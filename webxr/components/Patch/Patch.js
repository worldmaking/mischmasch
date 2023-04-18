import { v4 as uuidv4 } from 'uuid';
import * as Y from 'yjs'
import { Vector3, Curve, TubeGeometry, MeshBasicMaterial, Mesh, LineCurve3, SphereGeometry, MeshStandardMaterial } from 'three'
import { store } from '../../systems/syncStore.js'

import { 	docHasFeedback, updateGraph, updateParams} from '../Audio/Audio.js'

import { WebrtcProvider } from "y-webrtc";


import { scale, hashCode, colorFromString, opMenuColour, value2angle, angle2value, prettyPrint } from '../../utilities/utilities.js'

import { Op } from '../Op/Op.js'
import {systemSettings} from '../../settings/systemSettings.js'
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
        
 
        // payload is [scene, src, dest]
        // get src
        // get src opID
        let srcID = payload[1].split('_')[2]
        // get src op object from scene
        let srcSceneObject = payload[0].children.find(element => element.userData.mischmaschID == srcID);

        // get src jack object from op
        let srcJackObject = srcSceneObject.children.find(element => element.name == payload[1]);
        
        // get world position of src jack
        let srcPos = srcSceneObject.localToWorld( new Vector3( srcJackObject.position.x, srcJackObject.position.y, ( srcJackObject.position.z) ) )

        let destID = payload[2].split('_')[2]
        
        // get src op object from scene
        
        let destSceneObject = payload[0].children.find(element => element.userData.mischmaschID == destID);
        
        // get src jack object from op
        let destJackObject = destSceneObject.children.find(element => element.name == payload[2]);
        // get world position of src jack
        let destPos = destSceneObject.localToWorld( new Vector3( destJackObject.position.x, destJackObject.position.y, ( destJackObject.position.z) ) )
        
        // get world position of dest jack
        var path = new LineCurve3(srcPos, destPos)
        const geometry = new TubeGeometry( path, 20, systemSettings.cableThickness, 8, true );
        // geometry.setFromPoints(curveArray)
        const material = new MeshBasicMaterial( { color: 0x00ff00 } );
        const mesh = new Mesh( geometry, material );

        // create cable plugs
        const plugGeometry = new SphereGeometry( 0.01, 32, 32 )
        const plugMaterial = new MeshStandardMaterial( { color: 0x00ff00, roughness: 0.7, metalness: 0.0 } )
        const plugOne = new Mesh(plugGeometry, plugMaterial)
        plugOne.position.set(srcPos.x, srcPos.y, srcPos.z)
        plugOne.rotation.set(0, 0, 1.57)
        plugOne.name = 'cablePlug_' + payload[1]
        plugOne.userData.status = 'partial'
        plugOne.userData.src = 'object'
        const plugTwo = plugOne.clone()
        plugTwo.name = 'cablePlug_' + payload[2]
        plugTwo.userData.status = 'complete'
        plugTwo.userData.dest = 'object'
        plugTwo.position.set(destPos.x, destPos.y, destPos.z)

        payload[0].add( mesh, plugOne, plugTwo );
        // let from = payload[1].split('_')[1]
        // let to = payload[2].split('_')[1]

        // let srcID = from.split('.')[0]
        // let srcJack = from.split('.')[1]
        // let destID = to.split('.')[0]
        // let destJack = to.split('.')[1]

        // let cableType = 'cable'
        // if(srcID == destID){
        //   cableType = 'history'
        // }
        
        // let tempPatch = this.document.patch
        // for(let i=0; i<tempPatch[srcID].outputs.length; i++){
        //   // find the output in the doc matching the cable's src
        //   if(tempPatch[srcID].outputs[i].name == srcJack){
        //     if(!tempPatch[srcID].outputs[i].connections[destID]){
        //       this.document.patch[id] = op
        //       tempPatch[srcID].outputs[i].connections[destID] = {}
        //     }
        //     tempPatch[srcID].outputs[i].connections[destID][destJack] = cableType
        //   }
        // }   
        
        this.dirty.vr = true
        this.dirty.audio.graph = true
      break;
  
      case 'op':
        // payload is: [scene, sceneObjects, opID]
        let sceneObjects = payload[1]
        
        let opID = payload[2]
        let target = this.document.patch[opID]
        let op = new Op(target.name, target.uuid, target.position, target.quaternion)
        // op.position.set(target.position.x, target.position.y, target.position.z)
        // op.quaternion = target.quaternion
        // keep the uuid consistent between mischmasch document and threejs!
        op.userData = { mischmaschID: target.uuid }
        // payload[0] is scene
        payload[0].add(op.op)
        
        // add op to sceneObjects for intersecting with raycaster
        sceneObjects.push(op.op)

        // update audio
        this.updateGenishGraph()
        // set patch dirty flag for animation Loop
        this.dirty.vr = true
        this.dirty.audio.graph = true
        
        //! node version?
        // get all nodes from this op
        // let outputs = []
        // let inputs = []
        // for(let i=0; i < payload.nodes.length; i++){
        //   let node = payload.nodes[i]
        //   switch(node.kind){
        //     case 'knob':
        //       let knob = {
        //         name: node.name,
        //         kind: 'knob',
        //         index: i,
        //         value: node.node._props.value || 0.,
        //         _props: node.node._props,
        //         range: node.node._props.range || [0., 1.],
        //         trim: node.node._props.trim || 'add'
        //       }
        //       inputs.push(knob)
        //     break

        //     case 'inlet':
        //       let input = {
        //         name: node.name,
        //         kind: 'inlet',
        //         index: i,
        //         _props: node.node._props
        //       }
        //       inputs.push(input)
        //     break

        //     case 'outlet':
        //       let output = {
        //         name: node.name,
        //         _props: node.node._props,
        //         connections: {}
        //       }
        //       outputs.push(output)
        //     break
        //   }
        // }
        // // get each output for this op
        
        // const id = replaceAll('-', '', uuidv4())
        // let op = {
        //   position: payload.node._props.pos,
        //   quaternion: payload.node._props.orient,
        //   category: payload.node._props.category,
        //   name: payload.name,
        //   uuid: id,
        //   inputs: inputs,
        //   outputs: outputs
          
        // }
        // if(op.sign){
        //   payload.node.sign = sign
        // }
        // update syncdStore
        // this.document.patch[op.uuid] = op

        // // set patch dirty flag for animation Loop
        // this.dirty.vr = true
        // this.dirty.audio.graph = true
 
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
  dispose(scene, sceneObjects){

  }
  rebuild(scene, sceneObjects){
    //! webxr version
    let cables = []
    let ops = Object.keys(this.document.patch)
    // add all ops first
    for(let i = 0; i < ops.length; i++){
      let opID = ops[i]
      let target = this.document.patch[opID]
      this.add('op', [scene, sceneObjects, opID])
      // loop through connection(s)
      if(target.outputs && target.outputs.length > 0){
        for(let j = 0; j < target.outputs.length; j++){
          Object.keys(target.outputs[j].connections).forEach((destinationOpID)=>{
            // check for one-to-many connections
            Object.keys(target.outputs[j].connections[destinationOpID]).forEach((destInput)=>{

              let dest = `inlet_${destInput}_${destinationOpID}`
              let src = `outlet_${target.outputs[j].name}_${target.uuid}`
              // push into cables array, but wait until for..loop is completed before adding them to scene
              cables.push([src, dest])
            })
          })
        }
      }      
    }
    // once ops have all been added, loop through cables and add those
    for(let i=0;i<cables.length;i++){
      this.add('cable', [scene, cables[i][0], cables[i][1]])
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
  updateGenishGraph(){
    updateGraph(this.document.patch)
  }
}

export { Patch }