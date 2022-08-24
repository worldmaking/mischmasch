import { Vector3 } from 'three'

class Patching {
  constructor ( cables, xrCtlRight, xrCtlLeft, editorState, userSettings ){
    this.cables = cables;
    this.xrCtlRight = xrCtlRight;
    this.xrCtlLeft = xrCtlLeft;
    this.editorState = editorState;
    this.arrow 
    this.userSettings = userSettings
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
            let controllerPosition = this.xrCtlRight.controller.position

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
      let panel = this.editorState.rightControllerState.select.object
      // update the parent 
      // console.log()
      //! this isn't working ideally the way we need it to. But I left this as it is just be able to move on with other items in issue #136
      let rayEndPointLocalX = this.xrCtlRight.model.children[1].geometry.attributes.position.array[3]
      let rayEndPointLocalY = this.xrCtlRight.model.children[1].geometry.attributes.position.array[4]
      let rayEndPointLocalZ = this.xrCtlRight.model.children[1].geometry.attributes.position.array[5]
      
      let rayEndPointWorld = this.xrCtlRight.model.localToWorld(new Vector3(rayEndPointLocalX, rayEndPointLocalY, rayEndPointLocalZ))

      panel.object.parent.position.x = rayEndPointWorld.x
      panel.object.parent.position.y = rayEndPointWorld.y
      if(this.editorState.rightControllerState.thumbstick.some(item => item !== 0)){
        // thumbstick has changed
        let thumbX = this.editorState.rightControllerState.thumbstick[2] * this.userSettings.parameters['Module Rotation-X Speed']
        // use thumbstick X to rotate op on its Y Axis
        panel.object.parent.rotateY(thumbX)

        let thumbY = this.editorState.rightControllerState.thumbstick[3] * this.userSettings.parameters['Module Distancer Speed']
        // use thumbstick X to rotate op on its Y Axis
        panel.object.parent.translateZ(thumbY)
        
      }
      
    } 
    
   
  }
}

export { Patching }