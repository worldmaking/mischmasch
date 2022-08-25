import { Vector3 } from 'three'
import { Cable } from '../components/Cable/Cable'
class Patching {
  constructor ( cables, xrCtlRight, xrCtlLeft, editorState, userSettings, synth, controller1, controller2 ){
    this.cables = cables;
    this.xrCtlRight = xrCtlRight;
    this.xrCtlLeft = xrCtlLeft;
    this.editorState = editorState;
    this.arrow 
    this.userSettings = userSettings
    this.controller1 = controller1
    this.synth = synth;
  }

  cablePosition(){
    // update cable positioning, if any
    if(this.cables.length > 0){
      for(let i = 0; i < this.cables.length; i++){
        let cable = this.cables[i]
        // is the cable connected to one or two jacks?
        if(cable.userData.status == 'partial'){
          // the 'to' position of the line (aka 2nd position) needs to be updated to the controller's position
          // can you get the controller given the handedness?
          let ctlr = cable.userData.controller
          switch(ctlr){
            case 'controller_0': // xrCtlRight
            let controllerPosition = this.controller1.position

            // let posAttribute = new BufferAttribute(new Float32Array(controllerPosition), 2);

            // only update the 2nd point in the cable (1st is the cable origin jack)
            cable.geometry.attributes.position.array[3] = controllerPosition.x
            cable.geometry.attributes.position.array[4] = controllerPosition.y
            cable.geometry.attributes.position.array[5] = controllerPosition.z

            
            // cable.geometry.setAttribute('position', posAttribute);
            
            cable.geometry.attributes.position.needsUpdate = true;

                // cable.geometry.attributes.position.array = this.xrCtlRight.model.position
            break

            case 'controller_1': // xrCtlLeft
                cable.geometry.attributes.position.array = this.xrCtlLeft.model.position
            break;
          }                    
        }else if (cable.userData.status == 'complete'){
          let srcJack = cable.userData.src
          let destJack = cable.userData.dest

          let srcPos = srcJack.object.parent.localToWorld( new Vector3( srcJack.object.position.x, srcJack.object.position.y, ( srcJack.object.position.z + 0.2 ) ) )
          let destPos = destJack.object.parent.localToWorld( new Vector3( destJack.object.position.x, destJack.object.position.y, ( destJack.object.position.z + 0.2 ) ) )
          cable.geometry.attributes.position.array[0] = srcPos.x
          cable.geometry.attributes.position.array[1] = srcPos.y
          cable.geometry.attributes.position.array[2] = srcPos.z          
          cable.geometry.attributes.position.array[3] = destPos.x
          cable.geometry.attributes.position.array[4] = destPos.y
          cable.geometry.attributes.position.array[5] = destPos.z
          cable.geometry.attributes.position.needsUpdate = true;

        }
      }
    }
  }

  opPosition(){
    // todo: repeat this for left controller
    if(this.editorState.rightControllerState.select.element == 'panel'){
      let op = this.editorState.rightControllerState.select.object

      
      // handle thumbstick when panel selected
      if(this.editorState.rightControllerState.thumbstick.some(item => item !== 0)){
        // thumbstick has changed
        let thumbX = this.editorState.rightControllerState.thumbstick[2] * this.userSettings.parameters['Module Rotation-X Speed']
        // use thumbstick X to rotate op on its Y Axis
        op.rotateY(thumbX)

        let thumbY = this.editorState.rightControllerState.thumbstick[3] * this.userSettings.parameters['Module Distancer Speed']
        // use thumbstick X to rotate op on its Y Axis
        op.translateZ(thumbY)
        // console.log(thumbX, thumbY)
      }
    }
  }

  makePartialCable(object, controller){
    // console.log('cable')
    // start a cable between jack and a controller
    //todo decide how to pass this to genish?
    //todo let nm = selection.name
    let partialCable = new Cable('partial', object, controller.position, controller.name) 

    this.synth.add(partialCable.cable);
    this.cables.push(partialCable.cable);
    this.editorState.partialCable = partialCable.cable;
  }

  removePartialCable(){
    this.synth.remove(this.editorState.partialCable)
    let cableIndex = this.cables.indexOf(this.editorState.partialCable)
    this.cables.splice(cableIndex, 1)
    this.editorState.partialCable = false
  }
}

export { Patching }