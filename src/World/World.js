// modules from the components folder
import { createCamera } from './systems/camera.js';
import { Op } from './components/Op/Op.js';
import { Palette } from './components/Palette/Palette.js';
// import { createCube } from './components/cube.js';
// import { createMeshGroup } from './components/meshGroup.js';
import { createScene } from './components/scene.js';
import { createLights } from './components/Lights/lights.js'
// modules from the systems folder
import { createControls } from './systems/controls.js';
import { createRenderer } from './systems/renderer.js';
import { Resizer } from './systems/Resizer.js';
import { Loop } from './systems/Loop.js';

// webXR
import { VRButton } from 'three/examples/jsm/webxr/VRButton.js';





// These variables are module-scoped: we cannot access them
// from outside the module
let camera;
let renderer;
let scene;
let loop;
let palette;
class World {
    // 1. Create an instance of the World app
    constructor(container) {
        camera = createCamera();
        scene = createScene();
        renderer = createRenderer();
        container.append(renderer.domElement);
        
        document.body.appendChild( VRButton.createButton( renderer ) );
        const controls = createControls(camera, renderer.domElement);
        loop = new Loop(camera, scene, renderer);
        container.append(renderer.domElement); // add the canvas to the container

        // create the Palette of available Ops
        palette = new Palette(camera.position)

        loop.updatables.push(controls);

        const { ambientLight, mainLight } = createLights();
        
        scene.add(ambientLight, mainLight);

        // controls.target.copy(cube.position) ;// commented out during tutorial. left in as it might prove useful
        const resizer = new Resizer(container, camera, renderer);
    }
    
    // 2. Render the scene
    render() {
        // draw a single frame
        renderer.render(scene, camera);
    }

    //  animation methods
    start() {
        loop.start();
    }
      
    stop() {
        loop.stop();
    }

    addNode(){
        const op = new Op('mix');
        console.log(op)
        loop.updatables.push(op);
        
        scene.add(op);
        
    }

    displayPalette(){
        // make Palette visible & clickable
        // palette.position()
        loop.updatables.push(palette);
        // palette.position.x = camera.position.x // - 20
        // palette.position.y = camera.position.y // - 0
        // palette.position.z = camera.position.z - 50
        scene.add(palette);
        
        console.log('camera pos', camera.position)
    }

    hidePalette(){
        // make Palette invisible & unclickable
        scene.remove(palette);
    }
}
    
export { World };