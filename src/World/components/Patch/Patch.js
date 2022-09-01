import { Scene } from "three";
import { Op } from '../Op/Op'
import { ops } from '../Palette/genishOperators.js'
class Patch {
  constructor (){
    this.scene = new Scene();

    this.document = {
      

    }
    this.dirty = false
  }
  add(item, payload){
    switch(item){
      case 'op':
        // get genish op
        let gOp = ops[payload.name] 
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
          position: this.scene.getWorldPosition(payload.position),
          quaternion: this.scene.getWorldQuaternion(payload.quaternion),
          name: payload.name,
          uuid: payload.uuid,
          inputs: gInputs,
          outputs: gOutputs,          
        }
        
        let opName = `${payload.name}_${payload.uuid}`
        this.document[opName] = op
        console.log('document', this.document)
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
    console.log()
    let ops =  Object.keys(this.document)
    for(let i = 0; i < ops.length; i++){
      let target = this.document[ops[i]]
      console.log(target)
      let op = new Op(target.name)
      op.position.set(target.position.x, target.position.y, target.position.z)
      // op.quaternion = target.quaternion
      op.uuid = target.uuid
      this.scene.add(op)
      // loop through connection(s)
      if(target.outputs && target.outputs.length > 0){
        for(let j = 0; j < target.outputs.length; j++){
          Object.keys(target.outputs[j]).forEach((connection)=>{
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