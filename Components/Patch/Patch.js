const { v4: uuidv4 } = require('uuid');
const Automerge = require('automerge')
const _ = require('lodash');
const replaceAll = require("replaceall");
const EventEmitter = require('node:events');
const emitMessage = new EventEmitter();
const fs = require('fs')
const utf8Array2Str = require('utf8array2str');

// webrtc datachannel setup
const SignalingChannel = require("../../lib/signaling-channel");
const WebrtcManager = require("../../lib/webrtc-manager");
const dataChannelHandler = require("../../lib/webrtc-handlers/data-channel-handler");
// CONSTANTS
const TOKEN = 'SIGNALING123';
// const SIGNALING_SERVER_URL = 'http://localhost:3030'

const SIGNALING_SERVER_URL = 'https://mischmasch-signalling-11bb45c31d65.herokuapp.com/'

/** @type {string} - can for example be 'admin' | 'vehicle' | 'robot'  depending on you application*/
const PEER_TYPE = "admin";


module.exports = class Patch{
  constructor(PEER_ID){
    this.PEER_ID = PEER_ID
    // versioning     
    this.document = Automerge.init()
    this.docId = 'doc1'
    this.syncStates = new Object()// automerge sync states
    this.dirty = {
      vr: false,
      audio:{
        graph: false,
        param: false
      },
      speaker: false
    }

    this.cables = []

    // SETUP SIGNALING CHANNEL AND WEBRTC
    const channel = new SignalingChannel(PEER_ID, PEER_TYPE, SIGNALING_SERVER_URL, TOKEN);
    const webrtcOptions = { enableDataChannel: true, enableStreams: false, dataChannelHandler };

    let num = 0
    let docId = this.docId
    let syncStates = this.syncStates
    this.webRTCManager = new WebrtcManager(PEER_ID, PEER_TYPE, channel, webrtcOptions, true, this.syncStates, this.docId, emitMessage);
    channel.connect();

    // this.messaging = this.webRTCManager.signalingMessageHandler
    // let self = this 
    // this.messaging.onMessage = (e) =>{
    //   console.log('received msseg', e)
      
    // }
    emitMessage.on('msg', e=> this.receiveSyncMessages(e))

  }

  add(item, payload){

    switch(item){
      case 'cable':
        let from = payload[0].split('_')[1]
        let to = payload[1].split('_')[1]

        let srcID = from.split('.')[0]
        let srcJack = from.split('.')[1]
        let destID = to.split('.')[0]
        let destJack = to.split('.')[1]

        let cableType = 'cable'
        if(srcID == destID){
          cableType = 'history'
        }
        // update document in automerge
        this.document = Automerge.change(this.document, 'add cable', doc => {
          for(let i=0; i<doc[srcID].outputs.length; i++){
            // find the output in the doc matching the cable's src
            if(doc[srcID].outputs[i].name == srcJack){
              if(!doc[srcID].outputs[i].connections[destID]){
                doc[srcID].outputs[i].connections[destID] = {}
              }
              doc[srcID].outputs[i].connections[destID][destJack] = cableType
            }
          }     
        })
        this.dirty.vr = true
        this.dirty.audio.graph = true
        this.updatePeers(this.docId)
      break;
  
      case 'op':
        // get all nodes from this op
        let outputs = []
        let inputs = []
        for(let i=0; i < payload.nodes.length; i++){
          let node = payload.nodes[i]
          switch(node.kind){
            case 'knob':
              let knob = {
                name: node.name,
                kind: 'knob',
                index: i,
                value: node.node._props.value || 0.,
                _props: node.node._props,
                range: node.node._props.range || [0., 1.],
                trim: node.node._props.trim || 'add'
              }
              inputs.push(knob)
            break

            case 'inlet':
              let input = {
                name: node.name,
                kind: 'inlet',
                index: i,
                _props: node.node._props
              }
              inputs.push(input)
            break

            case 'outlet':
              let output = {
                name: node.name,
                _props: node.node._props,
                connections: {}
              }
              outputs.push(output)
            break
          }
        }
        // get each output for this op
        
        const id = replaceAll('-', '', uuidv4())
        let op = {
          position: payload.node._props.pos,
          quaternion: payload.node._props.orient,
          category: payload.node._props.category,
          name: payload.name,
          uuid: id,
          inputs: inputs,
          outputs: outputs
          
        }
        if(op.sign){
          payload.node.sign = sign
        }
        // update document in automerge
        this.document = Automerge.change(this.document, 'add op', doc => {
          doc[op.uuid] = op
        })
        // set patch dirty flag for animation Loop
        this.dirty.vr = true
        this.dirty.audio.graph = true
        this.updatePeers(this.docId)
        // this.webRTCSend('add', 'op')
        return op
      break
  
    }
  }

  remove(item, payload){
    switch(item){
      case 'cable':
        let from = payload[0].split('_')[1]
        let to = payload[1].split('_')[1]

        let srcID = from.split('.')[0]
        let srcJack = from.split('.')[1]
        let destID = to.split('.')[0]
        let destJack = to.split('.')[1]

        
        let outputs = this.document[srcID].outputs 
        for(let i=0; i< outputs.length; i++){
          if(outputs[i].connections[destID]){
            console.log('connections', outputs[i].connections[destID])
            // update document in automerge
            this.document = Automerge.change(this.document, 'remove cable', doc => {
              delete doc[srcID].outputs[i].connections[destID][destJack]
            }) 

            // check if destination op has no more connections, if so, delete its reference in ouput[i].connections
            if(Object.keys(this.document[srcID].outputs[i].connections[destID]).length == 0){
              // update document in automerge
              this.document = Automerge.change(this.document, 'remove connection ref', doc => {
                delete doc[srcID].outputs[i].connections[destID]
              }) 
            }
            
            
          }
        }
     
        this.dirty.vr = true
        this.dirty.audio.graph = true
        this.updatePeers(this.docId)
        
      break

      case 'op':
        let opKind = this.document[payload].name
        if(opKind == 'speaker'){
          this.dirty.speaker = true
        }
        
        // rescursively remove all instances of this op's uuid matching output connections in other ops across the patch.document
        for(let m = 0; m < Object.keys(this.document).length; m++){
          let op = this.document[Object.keys(this.document)[m]]
          let outputs = op.outputs
          for(let i = 0; i< outputs.length; i++){
            for(let j = 0; j< Object.keys(outputs[i].connections).length; j++){
              if(Object.keys(outputs[i].connections)[j] == payload){
                // delete the connection
                this.document = Automerge.change(this.document, 'remove cable', doc => {
                  delete doc[Object.keys(doc)[m]].outputs[i].connections[Object.keys(outputs[i].connections)[j]]
                }) 
              }
            }
          }
        }

        // remove the op from the document in automerge
        this.document = Automerge.change(this.document, 'remove op', doc => {
          delete doc[payload]
        }) 


        this.dirty.vr = true;
        this.dirty.audio.graph = true;

        this.updatePeers(this.docId)
      break
    }
  }

  update(item, payload){
    
    switch(item){
      case 'pos':
        let posID = payload[0].split('_')[1]
        // prevent updates if op was recently deleted
        this.document = Automerge.change(this.document, 'update position', doc => {
          doc[posID].position = payload[1]
        }) 
        this.dirty.vr = true
        this.updatePeers(this.docId)
      break;

      case 'quat':
        let quatID = payload[0].split('_')[1]
        this.document = Automerge.change(this.document, 'update quaternion', doc => {
          doc[quatID].quaternion = payload[1]
        }) 
        this.dirty.vr = true
        this.updatePeers(this.docId)
      break;

      case 'param':
        
        let opID = payload[0].path.split('_')[1].split('.')[0]

        let paramName = payload[0].name
        // get the param index
        for(let i = 0; i < this.document[opID].inputs.length; i++){
          if(this.document[opID].inputs[i].name == paramName){
            this.document = Automerge.change(this.document, `update param value`, doc => {
              doc[opID].inputs[i]._props.value = payload[1]
              doc[opID].inputs[i].value = payload[1]
            }) 
          }
        }

        this.dirty.vr = true
        this.dirty.audio.param = true
        this.updatePeers(this.docId)
      break 
    }
  }
  rebuild(){
    let graph = {
      nodes:{},
      arcs: []
    }
    // prettyPrint(this.document)
    let ops = Object.keys(this.document)

    // loop through ops and get graph
    for(let i=0; i<ops.length; i++){
      let op = this.document[ops[i]];
      let opName = `${op.name}_${op.uuid}`
      graph.nodes[opName] = {
        _props: {
          kind: op.name,
          category: op.category,
          pos: op.position,
          orient: op.quaternion,
        }
      }
      let controlName = null; // used if there is a control (param) op
      
      // loop over inputs
      for(let j = 0; j<op.inputs.length; j++){
        let input = op.inputs[j];
        if(!graph.nodes[opName][input.name]){
          graph.nodes[opName][input.name] = {}
        }
        if(op.name == 'control'){
          // get this op's connection(s)

        }
        graph.nodes[opName][input.name]._props = input._props
      }
      // loop over outputs
      for(let j = 0; j<op.outputs.length; j++){
        let output = op.outputs[j];
        if(!graph.nodes[opName][output.name]){
          graph.nodes[opName][output.name] = {}
        }
        graph.nodes[opName][output.name]._props = output._props

        // get connections for each output
        let connections = Object.keys(output.connections)
        if(connections.length > 0){
          // build the arc
          for(let k = 0; k < connections.length; k++ ){
            // getting the src is easy
            let src = `${opName}.${output.name}`
            // destination op id
            let destID = connections[k]
            let destOp = this.document[destID]

            // when user deletes an op, sometimes it gets deleted from patch.document before its connections, which will throw an error. so, ignore any connection attempts to non-existent ops
            if(!destOp){
              console.log(`no connect exists for ID ${destID} in patch.rebuild(), skipping`)
              continue
            }
                      
            // these are inputs specified by output.connections[k]
            let destOpPatchedInputs = Object.keys(output.connections[destID])
            // loop through connections in case there are one-to-many 
            for(let l = 0; l < destOpPatchedInputs.length; l++){
              let destJack = destOpPatchedInputs[l]
              let dest = `${destOp.name}_${destID}.${destJack}`
              graph.arcs.push([src, dest])
            }
          }
        }
      }
    }
    return graph // this is the localGraph that mischmasch's vr uses (mainscene(localGraph))
  }
  // load an patch from file ( use process.argv[2] = nameOfPatch.json )
  load(file){ 
    let ops = Object.keys(file)
    for(let i = 0; i< ops.length; i++){
      this.document = Automerge.change(this.document, `load patch from file`, doc => {
        doc[ops[i]]= file[ops[i]]
      }) 
    }
    // set patch dirty flag for animation Loop
    this.dirty.vr = true
    this.dirty.audio.graph = true
    this.updatePeers(this.docId)
  }
  ensureSpeaker(hmd){
    let ids = Object.keys(this.document)
    let speakers = []
    for(let i = 0; i< ids.length;i++){
      
      if(this.document[ids[i]].name == 'speaker'){
        speakers.push('speaker')
      }
    }
    
    if(speakers.length == 0){
      let pos = [hmd.pos[0], hmd.pos[1], hmd.pos[2]-0.5]
      const id = replaceAll('-', '', uuidv4())
      let op = {
        position: pos,
        quaternion: hmd.orient,
        category: 'speaker',
        name: 'speaker',
        uuid: id,
        inputs: [{
          name: 'audio',
          kind: 'inlet',
          index: 0,
          _props: {
            kind: 'inlet',
            index: 0,
            range: [-1, 1]
          }
        }],
        outputs:[ ]
      }
      
      // update document in automerge
      this.document = Automerge.change(this.document, 'add speaker', doc => {
        doc[id] = op
      })
      // set patch dirty flag for animation Loop
      this.dirty.vr = true
      this.dirty.audio.graph = true
      this.dirty.speaker = false
      this.updatePeers(this.docId)
    }    
  }

  webRTCSend(payload){
    // eventually we'll involve automerge. but for now, just send the payload
    for (let peer in this.webRTCManager.peers) {
      this.webRTCManager.peers[peer].dataChannel.send(JSON.stringify({
        edit: 'add',
        type: 'op',
        sync: op
      }))

    }
  }

  receiveSyncMessages(msg){
    
    let syncMsg = JSON.parse(msg)
    switch(syncMsg.arg){
      case 'signallingMessage':
        console.log('our id', this.PEER_ID)
        // ignore for now?
        //todo: the signalling messaging is funky. msg.target and msg.from sometimes get flipped. need to figure out why
        // if (msg.target == 'all'){
        //   if(this.PEER_ID != msg.from){
        //     console.log(`connected to new peer ${msg.from} on datachannel`)
        //   }
        // } else if (msg.from == 'all'){
        //   if(this.PEER_ID != msg.target){
        //     console.log(`connected to new peer ${msg.target} on datachannel`)
        //   }
        // }
      break;

      case 'syncMessage':
        delete syncMsg.arg
        let syncMessageArray = new Uint8Array(syncMsg.syncMsgArray);
        const [nextDoc, nextSyncState, patch] = Automerge.receiveSyncMessage(
          this.document,
          this.syncStates[syncMsg.peerId][this.docId] || Automerge.initSyncState(),
          syncMessageArray,
        )
        this.document = nextDoc
        this.syncStates[syncMsg.peerId] = { ...this.syncStates[syncMsg.peerId], [this.docId]: nextSyncState }
        this.dirty.audio.graph = true
        this.dirty.audio.param = true
        this.dirty.vr = true
        this.updatePeers(this.docId)

      break;

      default: console.log(`message from datachannel without matching switch case in Patch.js:receiveSyncMessages() ${msg}`)
    }
  }
  // method to update all peers using automerge sync protocol
  updatePeers(docId, editDetails){
    Object.entries(this.syncStates).forEach(([peer, syncState]) => {
      const [nextSyncState, syncMessage] = Automerge.generateSyncMessage(
        this.document,
        syncState[docId] || Automerge.initSyncState(),
      )
      this.syncStates[peer] = { ...this.syncStates[peer], [docId]: nextSyncState }
      if (syncMessage && this.webRTCManager.peers[peer]) {
        
        // convert sync message array to string
        let syncMsgArray = Array.from(syncMessage)
        // send new sync message to peer
        this.webRTCManager.peers[peer].dataChannel.send(JSON.stringify({arg: 'syncMessage', editDetails,
          docId, peerId: this.PEER_ID, target: peer, syncMsgArray,
        }))
        
      }
    })
  }
  
}
