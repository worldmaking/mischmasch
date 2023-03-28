import { Scene } from "three";
import { Op } from '../Op/Op'
import { ops } from '../Palette/genishOperators.js'
import { v4 as uuidv4 } from 'uuid';
import * as Automerge from 'automerge'
import { Cable } from '../Cable/Cable'
class Patch {
  constructor (loop){
    this.scene = new Scene();

    // versioning     
    this.document = Automerge.init()

    this.dirty = false

    this.cables = []
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
    console.log(this.document)
    let cables = []
    let ops =  Object.keys(this.document)
    for(let i = 0; i < ops.length; i++){
      let target = this.document[ops[i]]
      let op = new Op(target.name, target.uuid)
      op.position.set(target.position.x, target.position.y, target.position.z)
      // op.quaternion = target.quaternion
      // keep the uuid consistent between mischmasch document and threejs!
      op.uuid = target.uuid
      this.scene.add(op)
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

      
      
  
    // once all of the ops have been added, add any cables found in the document next
    if( cables.length > 0 ){
      // do the thing
      for(let i = 0; i<cables.length; i++){
        let src = cables[i][0]
        let dest = cables[i][1]
        // let destJackName = `inlet_${dest.split("_")[2]}_${dest.split("_")[1]}`
        let destJack = this.scene.getObjectByName( dest) 
        let srcJack = this.scene.getObjectByName( src) 
        let completeCable = new Cable( 'complete', srcJack, destJack )
        this.scene.add(completeCable.cable);
        this.cables.push(completeCable.cable);
      }
      
            

    }
    
  }
}

export { Patch }