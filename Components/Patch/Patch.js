const { v4: uuidv4 } = require('uuid');
const Automerge = require('automerge')
const _ = require('lodash');
module.exports = class Patch{
  constructor(){
    // versioning     
    this.document = Automerge.init()
    this.dirty = {
      vr: false,
      audio:{
        graph: false,
        param: false
      }
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
                _props: node.node._props
              }
              inputs.push(knob)
            break

            case 'inlet':
              let input = {
                name: node.name,
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
        
        const id = uuidv4()
        let op = {
          position: payload.node._props.pos,
          quaternion: payload.node._props.orient,
          category: payload.node._props.category,
          name: payload.name,
          uuid: id,
          inputs: inputs,
          outputs: outputs
          
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
        // update document in automerge
        this.document = Automerge.change(this.document, 'remove op', doc => {
          delete doc[payload]
        }) 
        this.dirty.vr = true;
        this.dirty.audio.graph = true;
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
          if(this.document[opID].inputs[i].name, paramName){
            this.document = Automerge.change(this.document, `update param value`, doc => {
              doc[opID].inputs[i]._props.value = payload[1]
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
      // loop over inputs
      for(let j = 0; j<op.inputs.length; j++){
        let input = op.inputs[j];
        if(!graph.nodes[opName][input.name]){
          graph.nodes[opName][input.name] = {}
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
            let destOp = this.document[destID].name
            
            // loop through connections in case there are one-to-many 
            let inputJacks = Object.keys(connections[k])
            for(let l = 0; l < inputJacks.length; l++){
              let destJack = Object.keys(output.connections[destID])[l]
              let dest = `${destOp}_${destID}.${destJack}`

              graph.arcs.push([src, dest])
            }
          }
        }
      }
    }
    return graph // this is the localGraph that mischmasch's vr uses (mainscene(localGraph))
  }
}


function prettyPrint(object){
	console.log(JSON.stringify(object, null, 4))
}