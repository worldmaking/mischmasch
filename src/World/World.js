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
        
        document.body.appendChild( VRButton.createButton( renderer ) );
        const controls = createControls(camera, renderer.domElement);
        loop = new Loop(camera, scene, renderer, pointer, raycaster);
        container.append(renderer.domElement); // add the canvas to the container

        // create the Palette of available Ops
        palette = new Palette(camera.position)

        loop.updatables.push(controls);

        const { ambientLight, mainLight } = createLights();
        
        scene.add(ambientLight, mainLight);

        // controls.target.copy(cube.position) ;// commented out during tutorial. left in as it might prove useful
        const resizer = new Resizer(container, camera, renderer);

        // get mouse activity

        window.addEventListener( 'pointermove', function(event){
            pointer.x = ( event.clientX / window.innerWidth ) * 2 - 1;
            pointer.y = - ( event.clientY / window.innerHeight ) * 2 + 1;
        } );

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
            
            let inPalettePos = loop.paletteHover().point
            
            op.position.x = inPalettePos.x
            op.position.y = inPalettePos.y
            op.position.z = inPalettePos.z
            loop.updatables.push(op);
            scene.remove(palette);
            scene.add(op);
            let stateChange = state('addNode', [opName, op])
            let newNode = stateChange[1]
            // let newNode = {michael: 'foo'}
            
            
            let nodeID = stateChange[2]
            let automergeMsg = stateChange[3]
            doc1 = Automerge.change(doc1, automergeMsg, doc => {
                doc.scene.nodes[nodeID] = newNode
            })

            // doc1 = Automerge.change(doc1, 'change', doc => {
            //     doc.scene.nodes['add_asdfasdf'] = {genish: {op:'add'}}
            // })

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