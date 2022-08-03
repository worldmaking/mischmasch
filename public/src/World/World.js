// modules from the components folder
import { createCamera } from './components/camera.js';
import { createCube } from './components/cube.js';
import { createMeshGroup } from './components/meshGroup.js';
import { createScene } from './components/scene.js';
import { createLights } from './components/lights.js'
// modules from the systems folder
import { createControls } from './systems/controls.js';
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
        container.append(renderer.domElement);


        const controls = createControls(camera, renderer.domElement);
        loop = new Loop(camera, scene, renderer);
        container.append(renderer.domElement); // add the canvas to the container
    
        // const cube = createCube(); // commented out during tutorial. left in as it might prove useful

        const meshGroup = createMeshGroup();

        loop.updatables.push(controls, meshGroup);

        const { ambientLight, mainLight } = createLights();

        loop.updatables.push(controls);
        scene.add(ambientLight, mainLight, meshGroup);

        // controls.target.copy(cube.position) ;// commented out during tutorial. left in as it might prove useful
        
        
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