// webXR
import { VRButton } from 'three/examples/jsm/webxr/VRButton.js';

// systems
import { createRenderer } from './systems/renderer.js';

// utilities
import { scale } from './utilties/scale.js'
class World {
  // 1. Create an instance of the World app
  constructor(container) {

  const SHAPE_BOX = 0;
  const SHAPE_BUTTON = 1;
  const SHAPE_CYLINDER = 2;
  const SHAPE_KNOB = 3;

  const UI_DEFAULT_SCALE = 0.1;
  const UI_DEPTH = 1/3;
  const UI_NUDGE = 0.01;
  const UI_SCROLL_SPEED = 1;
  const UI_ROTATE_SPEED = 180;
  const UI_TOUCH_DISTANCE = 0.1; // near enough to consider touch-based interaction
  const UI_KNOB_ANGLE_LIMIT = Math.PI * 5./6.; // 7 o'clock through 5 o'clock

  function value2angle(val) {
    return scale(val, 0., 1., -UI_KNOB_ANGLE_LIMIT, UI_KNOB_ANGLE_LIMIT);
  }
  function angle2value(a) {
    return scale(a, -UI_KNOB_ANGLE_LIMIT, UI_KNOB_ANGLE_LIMIT, 0., 1.);
  }




  
  let renderer;
  // renderer
  renderer = createRenderer();
  // XR rendering
  document.body.appendChild( VRButton.createButton( renderer ) );

  }
  //  animation methods
  start() {
    // loop.start();

  }
    
  stop() {
      // loop.stop();
  }
}



export { World }