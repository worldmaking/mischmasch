// modules from the components folder
import { createCamera } from './systems/camera.js';
import { Op } from './components/Op/Op.js';
import { Palette } from './components/Palette/Palette.js';
import { createScene } from './components/scene.js';
import { createLights } from './components/Lights/lights.js'
import { XRController } from './components/XRController/XRController.js'
// modules from the systems folder
import { createControls } from './systems/controls.js';
import { createRenderer } from './systems/renderer.js';
import { Resizer } from './systems/Resizer.js';
import { Loop } from './systems/Loop.js';
import { state } from './systems/state.js'

// webXR
import { VRButton } from 'three/examples/jsm/webxr/VRButton.js';
import { Raycaster, Vector2 } from 'three'

// versioning
import * as Automerge from 'automerge'


// These variables are module-scoped: we cannot access them
// from outside the module
let camera;
let renderer;
let scene;
let loop;
let palette;
let raycaster;
let doc1;
let mischmaschState;
const pointer = new Vector2();
let opIDMap = {}
class World {
    // 1. Create an instance of the World app
    constructor(container) {
        camera = createCamera();
        scene = createScene();
        renderer = createRenderer();
        container.append(renderer.domElement);
        raycaster = new Raycaster();
        
        // XR rendering
        document.body.appendChild( VRButton.createButton( renderer ) );
        renderer.xr.enabled = true;

        // XR controllers
        const xrCtlRight = new XRController(renderer, 0)
        const xrCtlLeft = new XRController(renderer, 1)
        console.log(xrCtlRight)
        scene.add(xrCtlRight.model, xrCtlLeft.model)
        let xrControllers = [xrCtlLeft, xrCtlRight]
        xrControllers.forEach(ctlr => {
            // trigger press
            ctlr.controller.addEventListener('selectstart', function(){
                // this refers to the controller
                ctlr.controller.children[0].scale.z = 10;
                ctlr.controller.userData.selectPressed = true;
                console.log('select pressed', )
            });

            // trigger unpress
            ctlr.controller.addEventListener('selectend', function(){
                // this refers to the controller
                ctlr.controller.children[0].scale.z = 10;
                ctlr.controller.userData.selectPressed = true;
                console.log('select unpressed', )
            });
            // squeeze press
            ctlr.controller.addEventListener('squeezestart', function(){
                // this refers to the controller
                ctlr.controller.children[0].scale.z = 10;
                ctlr.controller.userData.selectPressed = true;
                // make Palette visible & clickable
                loop.updatables.push(palette);
                scene.add(palette);
            });

            // squeeze unpress
            ctlr.controller.addEventListener('squeezeend', function(){
                // this refers to the controller
                ctlr.controller.children[0].scale.z = 10;
                ctlr.controller.userData.selectPressed = true;
                // make Palette invisible & unclickable
                scene.remove(palette);
            });
            
     
        })
                     

        // mouse controls 
        const controls = createControls(camera, renderer.domElement);
        window.addEventListener( 'pointermove', function(event){
            pointer.x = ( event.clientX / window.innerWidth ) * 2 - 1;
            pointer.y = - ( event.clientY / window.innerHeight ) * 2 + 1;
        } );

        // rendering loop
        loop = new Loop(camera, scene, renderer, pointer, raycaster, xrCtlRight, xrCtlLeft);
        loop.updatables.push(controls);

        // add the three canvas to the html container
        container.append(renderer.domElement); 

        // create the Palette of available Ops
        palette = new Palette(camera.position)

        
        // ligthing
        const { ambientLight, mainLight } = createLights();
        scene.add(ambientLight, mainLight);

        // resizer. See discoverthreejs for how/why this is useful
        // const resizer = new Resizer(container, camera, renderer);

        // versioning
        doc1 = Automerge.init()
        doc1 = Automerge.change(doc1, 'create blank scene', doc => {
            doc.scene = {nodes:{}, arcs:[]}
        })
        updateMischmaschState(doc1)

    }

    //  animation methods
    start() {
        loop.start();
    }
      
    stop() {
        loop.stop();
    }

    addOp(){
        // first check if palette is open. if not, block this action
        if(scene.children.some(element => element.name === 'Palette')){
            let opName = loop.paletteHover().object.name
            
            const op = new Op(opName);
            // get current position of op from within the palette
            let inPalettePos = loop.paletteHover().point
            op.position.x = inPalettePos.x
            op.position.y = inPalettePos.y
            op.position.z = inPalettePos.z
            loop.updatables.push(op);
            scene.remove(palette);
            scene.add(op);
            let stateChange = state('addNode', [opName, op])
            doc1 = Automerge.change(doc1, stateChange[3], doc => {
                doc.scene.nodes[stateChange[2]] = stateChange[1]
            })
            updateMischmaschState(doc1)
        }        
    }

    displayPalette(){
        // make Palette visible & clickable
        // palette.position()
        loop.updatables.push(palette);
        // palette.position.x = camera.position.x // - 20
        // palette.position.y = camera.position.y // - 0
        // palette.position.z = camera.position.z - 50
        scene.add(palette);
    }

    hidePalette(){
        // make Palette invisible & unclickable
        scene.remove(palette);
    }
}
    
function updateMischmaschState(newState) {
    mischmaschState = newState
    // genish.js will read from mischmaschState
}

export { World };