import { Scene } from "three";
import { Cable } from '../Cable/Cable'
class Editor {
  constructor (){

    this.scene = new Scene();

    this.state = {
      userSettings: {},
      partialCable: false,
      controller_0: {
          squeeze: false,
          select: {
              element: false,
              object: false
          },
          a: false,
          b: false,
          thumbstick: [0, 0, 0, 0],
          thumbstickButton: false,
          selected: false,
          hovered: false,
          jackTwoHover: false,
          secondaryIntersection: false
      },
      leftControllerState: {
          squeeze: false,
          select: {
              element: false,
              object: false
          },
          a: false,
          b: false,
          thumbstick: [0, 0, 0, 0],
          thumbstickButton: false,
          hovered: false,
          selected: false,
          jackTwoHover: false,
          secondaryIntersection: false
      }
    }
  }
  makePartialCable(src, controller){
      // start a cable between jack and a controller
    //todo decide how to pass this to genish?
    //todo let nm = selection.name
    let partialCable = new Cable('partial', src, controller.position, controller.name) 

    this.scene.add(partialCable.cable);
    // this.cables.push(partialCable.cable);
    this.state.partialCable = partialCable.cable;
  }
  removePartialCable(){
    this.scene.remove(this.state.partialCable)
    this.state.partialCable = false
  }
}

export { Editor }