import { WebGLRenderer } from "https://cdn.skypack.dev/three@0.132.2";
function createRenderer() {
    const renderer = new WebGLRenderer();

      
    // turn on the physically correct lighting model
    renderer.physicallyCorrectLights = true;
    return renderer;
}

export { createRenderer };