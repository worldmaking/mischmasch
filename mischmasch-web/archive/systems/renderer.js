import { WebGLRenderer } from "three";
function createRenderer() {
    const renderer = new WebGLRenderer({ antialias: true });

    // enable webxr 
    renderer.xr.enabled = true;
      
    // turn on the physically correct lighting model
    renderer.useLegacyLights = true;

    renderer.setPixelRatio(window.devicePixelRatio);
    renderer.setSize(window.innerWidth, window.innerHeight);

    return renderer;
}

export { createRenderer };