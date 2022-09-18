const { v4: uuidv4 } = require('uuid');
const Automerge = require('automerge')

module.exports = class Patch{
  constructor(){
    // versioning     
    this.document = Automerge.init()

    this.dirty = false

    this.cables = []
  }

  add(item, payload){
    switch(item){
      case 'cable':
        return payload[0].path
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
                scale: node.scale,
                kind: 'knob',
                value: node.value
              }
              inputs.push(knob)
            break

            case 'inlet':
              let input = {
                name: node.name,
                scale: node.scale,
                kind: 'input',
              }
              inputs.push(input)
            break

            case 'outlet':
              let output = {
                name: node.name,
                scale: node.scale,
                kind: 'output',
                connections: {}
              }
              outputs.push(output)
            break
          }
        }


        // get each output for this op
        
        const id = uuidv4()
        let op = {
          position: payload.pos,
          quaternion: payload.quat,
          dim: payload.dim,
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
        this.dirty = true
        console.log(this.document)
        return op
      break
  
    }
  }

  rebuild(){


  }
}

