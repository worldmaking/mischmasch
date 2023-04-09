import { v4 as uuidv4 } from 'uuid';
import * as Y from 'yjs'

import { store } from '../../systems/syncStore.js'


import { WebrtcProvider } from "y-webrtc";


import { scale, hashCode, colorFromString, opMenuColour, value2angle, angle2value, prettyPrint } from '../../utilities/utilities.js'

import { Op } from '../Op/Op.js'

import * as _ from 'lodash'
import * as replaceAll from 'replaceAll'

class Patch{
  constructor(){
    // versioning     
    // create the syncedStore store 

    this.document = store;
    this.document = {}
    this.document.patch = {}
    this.dirty = {
      vr: false,
      audio:{
        graph: false,
        param: false
      },
      speaker: false
    }

    this.cables = []

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
        
        let tempPatch = this.document.patch
        for(let i=0; i<tempPatch[srcID].outputs.length; i++){
          // find the output in the doc matching the cable's src
          if(tempPatch[srcID].outputs[i].name == srcJack){
            if(!tempPatch[srcID].outputs[i].connections[destID]){
              this.document.patch[id] = op
              tempPatch[srcID].outputs[i].connections[destID] = {}
            }
            tempPatch[srcID].outputs[i].connections[destID][destJack] = cableType
          }
        }   
        
        this.dirty.vr = true
        this.dirty.audio.graph = true
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
        // update syncdStore
        this.document.patch[op.uuid] = op

        // set patch dirty flag for animation Loop
        this.dirty.vr = true
        this.dirty.audio.graph = true
 
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

        
        let outputs = this.document.patch[srcID].outputs 
        for(let i=0; i< outputs.length; i++){
          if(outputs[i].connections[destID]){
            console.log('connections', outputs[i].connections[destID])
            // update document in syncdStore
            delete this.document.patch[srcID].outputs[i].connections[destID][destJack]


            // check if destination op has no more connections, if so, delete its reference in ouput[i].connections
            if(Object.keys(this.document.patch[srcID].outputs[i].connections[destID]).length == 0){
              // update document in automerge

              delete this.document.patch[srcID].outputs[i].connections[destID]
            }            
          }
        }
     
        this.dirty.vr = true
        this.dirty.audio.graph = true
      break

      case 'op':
        let opKind = this.document.patch[payload].name
        if(opKind == 'speaker'){
          this.dirty.speaker = true
        }
        
        // rescursively remove all instances of this op's uuid matching output connections in other ops across the patch.document
        for(let m = 0; m < Object.keys(this.document.patch).length; m++){
          let op = this.document.patch[Object.keys(this.document.patch)[m]]
          let outputs = op.outputs
          for(let i = 0; i< outputs.length; i++){
            for(let j = 0; j< Object.keys(outputs[i].connections).length; j++){
              if(Object.keys(outputs[i].connections)[j] == payload){
                // delete the connection
                delete this.document.patch[Object.keys(doc)[m]].outputs[i].connections[Object.keys(outputs[i].connections)[j]]
              }
            }
          }
        }

        // remove the op from the document in syncdStore
        delete this.document.patch[payload]



        this.dirty.vr = true;
        this.dirty.audio.graph = true;
      break
      case 'steve':
        console.log('hooosa')
      break
    }
  }

  update(item, payload){
    
    switch(item){
      case 'pos':
        let posID = payload[0].split('_')[1]
        // prevent updates if op was recently deleted
        this.document.patch[posID].position = payload[1]
        this.dirty.vr = true
      break;

      case 'quat':

          this.document.patch[quatID].quaternion = payload[1]
        this.dirty.vr = true
      break;

      case 'param':
        
        let opID = payload[0].path.split('_')[1].split('.')[0]

        let paramName = payload[0].name
        // get the param index
        for(let i = 0; i < this.document.patch[opID].inputs.length; i++){
          if(this.document.patch[opID].inputs[i].name == paramName){
            this.document.patch[opID].inputs[i]._props.value = payload[1]
            this.document.patch[opID].inputs[i].value = payload[1]
          }
        }
      

        this.dirty.vr = true
        this.dirty.audio.param = true

      break 
    }
  }
  rebuild(scene, sceneObjects){
    let graph = {
      nodes:{},
      arcs: []
    }
    //! webxr version
    let cables = []
    let ops = Object.keys(this.document.patch)
    for(let i = 0; i < ops.length; i++){

      
      let opID = ops[i]
      let target = this.document.patch[opID]
      let op = new Op(target.name, target.uuid, target.position, target.quaternion)
      // op.position.set(target.position.x, target.position.y, target.position.z)
      // op.quaternion = target.quaternion
      // keep the uuid consistent between mischmasch document and threejs!
      op.uuid = target.uuid
      scene.add(op.op)
      
      // add op to sceneObjects for intersecting with raycaster
      sceneObjects.push(op.op)
      // loop through connection(s)
      if(target.outputs && target.outputs.length > 0){
        for(let j = 0; j < target.outputs.length; j++){
          Object.keys(target.outputs[j].connections).forEach((connection)=>{
            let dest = `inlet_${connection.split("_")[2]}_${connection.split("_")[1]}`
            let src = `outlet_${target.outputs[j].name}_${target.uuid}`
            cables.push([src, dest])
          })
        }
      }
    }
    





    //! node-gles3 version below
    /*
    let tempPatch = this.document.patch

    let ops = Object.keys(tempPatch)
    
    // loop through ops and get graph
    for(let i=0; i<ops.length; i++){
      let op = tempPatch[ops[i]];
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
            let destOp = tempPatch[destID]

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
    */
  }
  // load an patch from file ( use process.argv[2] = nameOfPatch.json )
  load(file){ 

    let ops = Object.keys(file)
    for(let i = 0; i< ops.length; i++){
      // update syncdStore
     
      this.document.patch[ops[i]] = file[ops[i]]
      // this.document.set(`${ops[i]}`, file[ops[i]])
      /*!
      this.document = Automerge.change(this.document, `load patch from file`, doc => {
        doc[ops[i]]= file[ops[i]]
      }) 
      */
    }
    // set patch dirty flag for animation Loop
    this.dirty.vr = true
    this.dirty.audio.graph = true
  }
  ensureSpeaker(hmd){
    let tempPatch = this.document.patch
    let ids = Object.keys(tempPatch)
    let speakers = []
    for(let i = 0; i< ids.length;i++){
      
      if(tempPatch[ids[i]].name == 'speaker'){
        speakers.push('speaker')
      }
    }
    console.log('num speakers', speakers)
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
      // update yjs doc
      this.document.patch[id] = op
      // update document in automerge
      // this.document = Automerge.change(this.document, 'add speaker', doc => {
      //   doc[id] = op
      // })
      // set patch dirty flag for animation Loop
      this.dirty.vr = true
      this.dirty.audio.graph = true
      this.dirty.speaker = false
    }
    

    
  }
}

export { Patch }