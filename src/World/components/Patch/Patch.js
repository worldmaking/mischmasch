import { Scene } from "three";
import { Op } from '../Op/Op'
import { ops } from '../Palette/genishOperators.js'
import { v4 as uuidv4 } from 'uuid';
import * as Automerge from 'automerge'

class Patch {
  constructor (){
    this.scene = new Scene();

    // versioning     
    this.document = Automerge.init()

    this.dirty = false
  }
  add(item, payload){
    switch(item){
      case 'op':
        // get genish op
        let gOp = ops[payload[0]] 
        // get ouputs/inputs
        let gOutputs = []
        let gInputs = []
        Object.keys(gOp.outputs).forEach((out)=>{
          let output = {
            name: out,
            connections: {}
          }
          gOutputs.push(output)
        })
        Object.keys(gOp.inputs).forEach((key)=>{
          let input = {
            name: key,
            connections: {}
          }
          gInputs.push(input)
        })
        let op = {
          position: payload[1],
          // quaternion: this.scene.getWorldQuaternion(payload[0].quaternion),
          name: payload[0],
          uuid: uuidv4(),
          inputs: gInputs,
          outputs: gOutputs,          
        }
        
        let opName = `${op.name}_${op.uuid}`
        // update document in automerge
        this.document = Automerge.change(this.document, 'add op', doc => {
          doc[opName] = op
      })
      // set patch dirty flag for Loop
      this.dirty = true
      break
    }
  }
  remove(){


    this.dirty = true
  }
  update(){
    // update an object's position. should we set dirty to true?
    // should we set dirty = true? 
  }
  rebuild(){
    let cables = []
    let ops =  Object.keys(this.document)
    for(let i = 0; i < ops.length; i++){
      let target = this.document[ops[i]]
      let op = new Op(target.name)
      op.position.set(target.position.x, target.position.y, target.position.z)
      // op.quaternion = target.quaternion
      op.uuid = target.uuid
      this.scene.add(op)
      // loop through connection(s)
      if(target.outputs && target.outputs.length > 0){
        for(let j = 0; j < target.outputs.length; j++){
          Object.keys(target.outputs[j].connections).forEach((connection)=>{
            console.log('connection found:', connection)
            cables.push(connection)
          })
        }
      }
    }

      
      
  
    // once all of the ops have been added, add any cables found in the document next
    if( cables.length > 0 ){
      // do the thing
    }
  }
}

export { Patch }