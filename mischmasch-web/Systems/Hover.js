import { Color } from 'three';

const objectSelectedColor = new Color(0xf0520a);
let hoverColour = new Array(); // element 0 = the object, element 1 is its original colour

class Hover {
  constructor( ){
    this.state = {
      paletteOp: false,
      ui: {
          element: false,
          object: false,
          name: false
      }, // element can be inlet, outlet, panel, knob, etc. object is the threeJS object. if nothing is hovered over, set both to false 
    };
  }
  setHoverColour(nextObject){
    // first check if another element is previously hovered, if so get previous element, get its original colour, reset it to that
    if(hoverColour.length > 0){
        let previous = hoverColour[0]
        previous.object.material.color.set(hoverColour[1]);
    }
    // get the object's original colour
    let originalColour = nextObject.object.material.color.getHex();
    // store the object, and its original colour in the hoverColour object
    hoverColour[0] = nextObject
    hoverColour[1] = originalColour
    // set next object's colour to highlighted colour
    nextObject.object.material.color.set(objectSelectedColor)
  }

  unsetHoverColour(){
    // this is for when a cable connection is deleted, if the select button was released when the raycast isn't pointing at anything, it doesn't remove the hover 
    if(hoverColour.length>0){  
        // get previous object
        let previous = hoverColour[0]
        // reset its colour
        previous.object.material.color.set(hoverColour[1]);
        
    }
  }
  resetState(){
    this.state = {
      paletteOp: false,
      ui: {
          element: false,
          object: false,
          name: false
      }, // element can be inlet, outlet, panel, knob, etc. object is the threeJS object. if nothing is hovered over, set both to false 
    };
  }
}

export { Hover }