import { Scene } from "three";
import { Op } from '../Op/Op'
import { ops } from '../Palette/genishOperators.js'
import { v4 as uuidv4 } from 'uuid';
import * as Automerge from 'automerge'
import { Cable } from '../Cable/Cable'
class Patch {
  constructor (){
    this.scene = new Scene();

    // versioning     
    this.document = Automerge.init()

    this.dirty = false
  }
  add(item, payload){
    switch(item){
      case 'cable':
        let jacks = payload
        let src, dest;
        for (let i = 0; i < 2; i++){
            if(jacks[i].name.split('_')[0] === 'outlet'){
                src = jacks[i]
            } else if (jacks[i].name.split('_')[0] === 'inlet'){
                dest = jacks[i]
            } else {
                console.log('error in cable connection, incorrect UI selected: ', jacks[i])
            }
        }
        // get parent ops of src and dest jacks
        let srcParentOp = src.parent
        let destParentOp = dest.parent
        let srcJackName = src.name.split("_")[1]
        let destName = `${dest.parent.name}_${dest.parent.uuid}_${dest.name.split('_')[1]}`

        // let ops = Object.keys(this.document)
        let srcName = `${src.parent.name}_${src.parent.uuid}`
        this.document = Automerge.change(this.document, 'add cable', doc => {
          for(let i = 0; i< this.document[srcName].outputs.length; i++){
            if(this.document[srcName].outputs[i].name == srcJackName){
              doc[srcName].outputs[i].connections[destName] = 'cable'
              break
            }
          }
        })
        this.dirty = true
        // destOpName_uuid_destJackName: 'cable'
      break
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
            // connections: {}
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
      // keep the uuid consistent between mischmasch document and threejs!
      op.uuid = target.uuid
      this.scene.add(op)
      console.log('op',op)
      // loop through connection(s)
      if(target.outputs && target.outputs.length > 0){
        for(let j = 0; j < target.outputs.length; j++){
          Object.keys(target.outputs[j].connections).forEach((connection)=>{
            console.log('connection found:', connection)
            let src = 
            cables.push(connection)
          })
        }
      }
    }

      
      
  
    // once all of the ops have been added, add any cables found in the document next
    if( cables.length > 0 ){
      // do the thing
      // let completeCable = new Cable( 'complete', jackOne, jackTwo )
      // patch.scene.add(completeCable.cable);
      // loop.cables.push(completeCable.cable);
    }
  }
}

export { Patch }