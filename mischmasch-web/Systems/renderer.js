import { WebGLRenderer } from "three";
function createRenderer() {
    const renderer = new WebGLRenderer({ antialias: true });

    // enable webxr 
    renderer.xr.enabled = true;
      
    // turn on the physically correct lighting model
    renderer.useLegacyLights  = true;

    renderer.setPixelRatio(window.devicePixelRatio);
    renderer.setSize(window.innerWidth, window.innerHeight);

    // from nodegles version:
    // const floor_m = 6;
	// renderer.floor_geom = glutils.makeQuad({ min: -floor_m, max: floor_m, div:8 })



    return renderer;
}

export { createRenderer };