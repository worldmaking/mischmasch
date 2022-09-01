import { Vector3 } from 'three'
import { Cable } from '../components/Cable/Cable'
class Patching {
  constructor ( xrCtlRight, xrCtlLeft, editor, userSettings, patch, controller_0, controller_1 ){

    this.xrCtlRight = xrCtlRight;
    this.xrCtlLeft = xrCtlLeft;
    this.editor = editor;
    this.arrow 
    this.userSettings = userSettings
    this.controller_0 = controller_0
    this.patch = patch;
  }

  cablePosition(){
    // check if a partial cable is active
    if(this.editor.state.partialCable != false){
      // the 'to' position of the line (aka 2nd position) needs to be updated to the controller's position
          // can you get the controller given the handedness?
          let ctlr = this.editor.state.partialCable.userData.controller
          switch(ctlr){
            case 'controller_0': // xrCtlRight
            let controllerPosition = this.controller_0.position

            // previously, the cord followed the controller position. 
            // can we just move the plug?

            // let posAttribute = new BufferAttribute(new Float32Array(controllerPosition), 2);
            let cord = this.editor.state.partialCable.children[0]
            let plugOne = this.editor.state.partialCable.children[1]
            let plugTwo = this.editor.state.partialCable.children[2]
            // cable.geometry.setAttribute('position', posAttribute);



            // if controller is intersecting a jack, snap plugTwo to that jack
            if(this.editor.state.controller_0.secondaryIntersection != false){
              let secondary = this.editor.state.controller_0.secondaryIntersection
              // console.log('secondary', secondary)
              if(secondary.object.userData.kind == 'outlet'){
                const local2WorldPos = secondary.object.parent.localToWorld(secondary.object.position)
                plugTwo.position.x = local2WorldPos.x
                plugTwo.position.y = local2WorldPos.y
                plugTwo.position.z = local2WorldPos.z + 0.2
              }
            }
            // handle thumbstick
            else if(this.editor.state.controller_0.thumbstick.some(item => item !== 0)){
              // update plugTwo position based on controller position
              plugTwo.position.x = controllerPosition.x
              plugTwo.position.y = controllerPosition.y
              plugTwo.position.z = controllerPosition.z
              
              let thumbY = this.editor.state.controller_0.thumbstick[3] * 10
              // use thumbstick Y reposition plugTwo along controller z axis
              plugTwo.translateZ(thumbY)
            } else {
              // update plugTwo position based on controller position
              plugTwo.position.x = controllerPosition.x
              plugTwo.position.y = controllerPosition.y
              plugTwo.position.z = controllerPosition.z
            }
            plugTwo.position.needsUpdate = true;

    
            // update the cord position to where plugTwo is
            cord.geometry.attributes.position.array[3] = plugTwo.position.x
            cord.geometry.attributes.position.array[4] = plugTwo.position.y
            cord.geometry.attributes.position.array[5] = plugTwo.position.z
            cord.geometry.attributes.position.needsUpdate = true;

            

                
                // cable.geometry.setAttribute('position', posAttribute);
                
              
            
            // only update the 2nd point in the cable (1st is the cable origin jack)


                // cable.geometry.attributes.position.array = this.xrCtlRight.model.position
            break

            case 'controller_1': // xrCtlLeft
              this.editor.state.partialCable.geometry.attributes.position.array = this.xrCtlLeft.model.position
            break;
          }
    }
    // update cable positioning, if any
    if(this.patch.cables.length > 0){
      for(let i = 0; i < this.patch.cables.length; i++){
        let cable = this.patch.cables[i]
        // is the cable connected to one or two jacks?
        if (cable.userData.status == 'complete'){
          let srcJack = cable.userData.src
          let destJack = cable.userData.dest

          let srcPos = srcJack.parent.localToWorld( new Vector3( srcJack.position.x, srcJack.position.y, ( srcJack.position.z + 0.2 ) ) )
          let destPos = destJack.parent.localToWorld( new Vector3( destJack.position.x, destJack.position.y, ( destJack.position.z + 0.2 ) ) )
          cable.children[0].geometry.attributes.position.array[0] = srcPos.x
          cable.children[0].geometry.attributes.position.array[1] = srcPos.y
          cable.children[0].geometry.attributes.position.array[2] = srcPos.z          
          cable.children[0].geometry.attributes.position.array[3] = destPos.x
          cable.children[0].geometry.attributes.position.array[4] = destPos.y
          cable.children[0].geometry.attributes.position.array[5] = destPos.z
          cable.children[0].geometry.attributes.position.needsUpdate = true;

        }
      }
    }
  }

  opPosition(){
    // todo: repeat this for left controller
    if(this.editor.state.controller_0.select.element == 'panel'){
      let op = this.editor.state.controller_0.select.object

      
      // handle thumbstick when panel selected
      if(this.editor.state.controller_0.thumbstick.some(item => item !== 0)){
        // thumbstick has changed
        let thumbX = this.editor.state.controller_0.thumbstick[2] * this.userSettings.parameters['Module Rotation-X Speed']
        // use thumbstick X to rotate op on its Y Axis
        op.rotateY(thumbX)

        let thumbY = this.editor.state.controller_0.thumbstick[3] * this.userSettings.parameters['Module Distancer Speed']
        // use thumbstick X to rotate op on its Y Axis
        op.translateZ(thumbY)
        // console.log(thumbX, thumbY)
      }
    }
  }


}

export { Patching }