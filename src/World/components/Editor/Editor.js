import { Scene } from "three";

class Editor {
  constructor (){

    this.scene = new Scene();

    this.state = {
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
          secondaryIntersection: false
      }
    }
  }
}

export { Editor }