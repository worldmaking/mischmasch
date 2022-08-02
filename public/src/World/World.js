// modules from the components folder
import { createCamera } from './components/camera.js';
import { createCube } from './components/cube.js';
import { createScene } from './components/scene.js';
import { createLights } from './components/lights.js'
// modules from the systems folder
import { createRenderer } from './systems/renderer.js';
import { Resizer } from './systems/Resizer.js';
import { Loop } from './systems/Loop.js';


// todo: you can add other folders to /World, like /utils, etc.

// These variables are module-scoped: we cannot access them
// from outside the module
let camera;
let renderer;
let scene;
let loop;
class World {
    // 1. Create an instance of the World app
    constructor(container) {
        camera = createCamera();
        scene = createScene();
        renderer = createRenderer();
        loop = new Loop(camera, scene, renderer);
        container.append(renderer.domElement); // add the canvas to the container
    
        const cube = createCube();
        const light = createLights();
        
        loop.updatables.push(cube)
        scene.add(cube, light);
        console.log(cube)
        // cube.position.x = 0.5 // update cube's pos X
        const resizer = new Resizer(container, camera, renderer);
    }
    
    // 2. Render the scene
    render() {
        // draw a single frame
        renderer.render(scene, camera);
        console.log(scene.children)
    }

    //  animation methods
    start() {
        loop.start();
    }
      
    stop() {
        loop.stop();
    }
}
    
export { World };