import { Scene } from "three";
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
      console.log('gop', gOp)
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
          inputs: gInputs,
          outputs: gOutputs,          
        }
        
        let opName = `${payload.name}_${payload.uuid}`
        this.document[opName] = op
        console.log('document', this.document)
      break
    }
    this.dirty = true
  }
  remove(){

  }
  update(){

  }
}

export { Patch }