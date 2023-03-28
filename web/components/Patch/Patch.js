import { v4 as uuidv4 } from 'uuid';
import * as Automerge from "@automerge/automerge"

import * as _ from 'lodash'
import { replaceAll } from 'replaceall'
// const replaceAll = require("replaceall");


class Patch{
  constructor(load){
    // versioning     
    this.document = Automerge.init()
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
        this.document = Automerge.change(this.document, 'update position', doc => {
          doc[posID].position = payload[1]
        }) 
        this.dirty.vr = true
      break;

      case 'quat':
        let quatID = payload[0].split('_')[1]
        this.document = Automerge.change(this.document, 'update quaternion', doc => {
          doc[quatID].quaternion = payload[1]
        }) 
        this.dirty.vr = true
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
  }
  ensureSpeaker(hmd){
    let ids = Object.keys(this.document)
    let speakers = []
    for(let i = 0; i< ids.length;i++){
      
      if(this.document[ids[i]].name == 'speaker'){
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
      
      // update document in automerge
      this.document = Automerge.change(this.document, 'add speaker', doc => {
        doc[id] = op
      })
      // set patch dirty flag for animation Loop
      this.dirty.vr = true
      this.dirty.audio.graph = true
      this.dirty.speaker = false
    }
    

    
  }
}


function prettyPrint(object){
	console.log(JSON.stringify(object, null, 4))
}

export { Patch }