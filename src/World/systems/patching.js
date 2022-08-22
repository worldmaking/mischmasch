class Patching {
  constructor ( cables, xrCtlRight, xrCtlLeft ){
    this.cables = cables;
    this.xrCtlRight = xrCtlRight;
    this.xrCtlLeft = xrCtlLeft;
  }

  cablePosition(){
    // update cable positioning, if any
    if(this.cables.length > 0){
      for(let i = 0; i < this.cables.length; i++){
        let cable = this.cables[i]
        // is the cable connected to one or two jacks?
        if(cable.userData.status = 'oneJack'){
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
        }
      }
    }
  }
}

export { Patching }