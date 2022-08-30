import { Vector3 } from 'three'
import { Cable } from '../components/Cable/Cable'
class Patching {
  constructor ( cables, xrCtlRight, xrCtlLeft, editor, userSettings, synth, controller1, controller2 ){
    this.cables = cables;
    this.xrCtlRight = xrCtlRight;
    this.xrCtlLeft = xrCtlLeft;
    this.editor = editor;
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

            // previously, the cord followed the controller position. 
            // can we just move the plug?

            // let posAttribute = new BufferAttribute(new Float32Array(controllerPosition), 2);
            let cord = cable.children[0]
            let plugOne = cable.children[1]
            let plugTwo = cable.children[2]
            // cable.geometry.setAttribute('position', posAttribute);



            // if controller is intersecting a jack, snap plugTwo to that jack
            if(this.editor.state.controller_0.secondaryIntersection != false){
              let secondary = this.editor.state.controller_0.secondaryIntersection
              console.log('secondary', secondary)
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

  makePartialCable(object, controller){
    // console.log('cable')
    // start a cable between jack and a controller
    //todo decide how to pass this to genish?
    //todo let nm = selection.name
    let partialCable = new Cable('partial', object, controller.position, controller.name) 

    this.synth.add(partialCable.cable);
    this.cables.push(partialCable.cable);
    this.editor.state.partialCable = partialCable.cable;
  }

  makeCompleteCable(){
    
  }

  removePartialCable(){
    this.synth.remove(this.editor.state.partialCable)
    let cableIndex = this.cables.indexOf(this.editor.state.partialCable)
    this.cables.splice(cableIndex, 1)
    this.editor.state.partialCable = false
  }
}

export { Patching }