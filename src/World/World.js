// webXR
import { VRButton } from 'three/examples/jsm/webxr/VRButton.js';

// systems
import { createRenderer } from './systems/renderer.js';
class World {
  // 1. Create an instance of the World app
  constructor(container) {

  // These variables are module-scoped: we cannot access them
// from outside the module
  let camera;
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