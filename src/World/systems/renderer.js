import { WebGLRenderer } from "three";
function createRenderer() {
    const renderer = new WebGLRenderer({ antialias: true });

    // enable webxr 
    renderer.xr.enabled = true;
      
    // turn on the physically correct lighting model
    renderer.physicallyCorrectLights = true;
    return renderer;
}

export { createRenderer };