// modules from the components folder
import { createCamera } from './components/camera.js';
import { createCube } from './components/cube.js';
import { createScene } from './components/scene.js';
// modules from the systems folder
import { createRenderer } from './systems/renderer.js';
import { Resizer } from './systems/Resizer.js';
// todo: you can add other folders to /World, like /utils, etc.

// These variables are module-scoped: we cannot access them
// from outside the module
let camera;
let renderer;
let scene;
class World {
    // 1. Create an instance of the World app
    constructor(container) {
        camera = createCamera();
        scene = createScene();
        renderer = createRenderer();
        container.append(renderer.domElement); // add the canvas to the container
    
        const cube = createCube();

        scene.add(cube);

        const resizer = new Resizer(container, camera, renderer);
    }
    
    // 2. Render the scene
    render() {
        // draw a single frame
        renderer.render(scene, camera);
    }
}
    
export { World };