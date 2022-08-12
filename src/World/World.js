// modules from the components folder
import { createCamera } from './systems/camera.js';
import { Op } from './components/Op/Op.js';
import { Palette } from './components/Palette/Palette.js';
import { createScene } from './components/scene.js';
import { createLights } from './components/Lights/lights.js'
import { XRController } from './components/XRController/XRController.js'
import { Cable } from './components/Cable/Cable.js'
import { Curve } from './components/Cable/Curve.js'
// modules from the systems folder
import { createControls } from './systems/controls.js';
import { createRenderer } from './systems/renderer.js';

// import { Resizer } from './systems/Resizer.js';
import { Loop } from './systems/Loop.js';
import { stateChange } from './systems/state.js'
import { Audio } from './systems/Audio.js'
// webXR
import { VRButton } from 'three/examples/jsm/webxr/VRButton.js';
import { Vector2, ObjectLoader, SetSceneCommand, AddObjectCommand,TubeGeometry, MeshBasicMaterial, LineCurve3, Mesh } from 'three'
import Stats from 'three/examples/jsm/libs/stats.module.js';
import { GPUStatsPanel } from 'three/examples/jsm/utils/GPUStatsPanel.js';
import { GUI } from 'three/examples/jsm/libs/lil-gui.module.min.js';


// versioning
import * as Automerge from 'automerge'

// scaffolding
import { abs, div } from "./scaffolding.js"

// These variables are module-scoped: we cannot access them
// from outside the module
let camera;
let renderer;
let scene;
let loop;
let palette;
let doc1;
let stats, gpuPanel;
let gui;
let audio;

let mischmaschState;
const pointer = new Vector2();
let opIDMap = {}

// temp vars for keyboard scaffolding
let newAbs, newDiv;

class World {
    // 1. Create an instance of the World app
    constructor(container) {
        camera = createCamera();
        scene = createScene();
        renderer = createRenderer();
        container.append(renderer.domElement);
        
        // gpu stats panel
        stats = new Stats();
        
        gpuPanel = new GPUStatsPanel( renderer.getContext() );
        stats.addPanel( gpuPanel );

        // user settings
        initGui();

        // XR rendering
        document.body.appendChild( VRButton.createButton( renderer ) );
        renderer.xr.enabled = true;

        
        // create the Palette of available Ops
        palette = new Palette(camera.position)
        // place palette in front of camera
        camera.add(palette);
        palette.position.set(0,0,-50);
        palette.position.copy( camera.position );
        palette.rotation.copy( camera.rotation );
        palette.updateMatrix();
        palette.translateZ( - 10 );

        // XR controllers
        const xrCtlRight = new XRController(renderer, 0)
        const xrCtlLeft = new XRController(renderer, 1)
        scene.add(xrCtlRight.model, xrCtlLeft.model)
        // xrCtlRight.controller.rayCastBeam, xrCtlLeft.controller.rayCastBeam
        let xrControllers = [xrCtlLeft, xrCtlRight]
        xrControllers.forEach(ctlr => {
            // trigger press
            ctlr.controller.addEventListener('selectstart', function(){
                // this refers to the controller
                // ctlr.controller.children[0].scale.z = 10;
                ctlr.controller.userData.selectPressed = true;
                console.log('select pressed', )
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
                    let stateChange = stateChange('addNode', [opName, op])
                    doc1 = Automerge.change(doc1, stateChange[3], doc => {
                        doc.scene.nodes[stateChange[2]] = stateChange[1]
                    })
                    updateMischmaschState(doc1)
                }  
            });

            // trigger unpress
            ctlr.controller.addEventListener('selectend', function(){
                // this refers to the controller
                // ctlr.controller.children[0].scale.z = 10;
                ctlr.controller.userData.selectPressed = true;
                console.log('select unpressed', )
            });
            // squeeze press
            ctlr.controller.addEventListener('squeezestart', function(){
                // this refers to the controller
                // ctlr.controller.children[0].scale.z = 10;
                ctlr.controller.userData.selectPressed = true;
                // set palette position in front of player
                // make Palette visible & clickable
                palette.position.copy( camera.position );
                palette.rotation.copy( camera.rotation );
                palette.updateMatrix();
                palette.translateZ( - 10 );
                scene.add(palette);
            });

            // squeeze unpress
            ctlr.controller.addEventListener('squeezeend', function(){
                // this refers to the controller
                // ctlr.controller.children[0].scale.z = 10;
                ctlr.controller.userData.selectPressed = true;
                // make Palette invisible & unclickable
                scene.remove(palette);
                
            });
           
        })
         // CUSTOM EVENTS:
            // get thumbstick axes
            window.addEventListener('rightThumbstickAxes', (e) => {
                //! the axes data is found below. commented out just for now:  
                //! xrCtlRight.thumbstickAxes
            })
            window.addEventListener('leftThumbstickAxes', (e) => {
                //! the axes data is found below. commented out just for now:  
                //! xrCtlLeft.thumbstickAxes
            })

            // get thumbstick button presses
            window.addEventListener('rightThumbstickPress', (e)=>{
                // do something with the press event
            })

            // get thumbstick button presses
            window.addEventListener('leftThumbstickPress', (e)=>{
                // do something with the press event
            })

        // mouse controls 
        const controls = createControls(camera, renderer.domElement);
        window.addEventListener( 'pointermove', function(event){
            pointer.x = ( event.clientX / window.innerWidth ) * 2 - 1;
            pointer.y = - ( event.clientY / window.innerHeight ) * 2 + 1;
        } );


        // rendering loop
        loop = new Loop(camera, scene, renderer, pointer, xrCtlRight, xrCtlLeft, stats, gpuPanel);
        loop.updatables.push(controls);

        // add the three canvas to the html container
        container.append(renderer.domElement); 

        // ligthing
        const { ambientLight, mainLight } = createLights();
        scene.add(ambientLight, mainLight);

        // resizer. See discoverthreejs for how/why this is useful
        // const resizer = new Resizer(container, camera, renderer);

        // versioning
        doc1 = Automerge.init()
        doc1 = Automerge.change(doc1, 'create blank scene', doc => {
            doc.three = {}
            doc.genish = {}
        })
        // updateMischmaschState()

        // audio
        // audio = new Audio()

        // how to load a scene from 
        // todo THIS WORKS, its only commented out to work on other stuff
        /*
        const loader = new ObjectLoader()
        loader.parse(tempScene, (theObj) => {
            console.log(theObj)
            scene.add(theObj)
            console.log(scene)
        })
        */

        
        
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
            // let stateChange = stateChange('addNode', [opName, op])
            // doc1 = Automerge.change(doc1, stateChange[3], doc => {
            //     doc.scene.nodes[stateChange[2]] = stateChange[1]
            // })
            updateMischmaschState()
        }        
    }
    
    keyboardScaffolding(command, payload){
        switch(command){
            case 'addNode':
                switch(payload){
                    case 'abs':
                        
            
                        const thisOp = new Op('abs');
                        thisOp.position.x = abs.point.x
                        thisOp.position.y = abs.point.y
                        thisOp.position.z = abs.point.z
                        loop.updatables.push(thisOp);
                        scene.remove(palette);
                        scene.add(thisOp);
                        updateMischmaschState()
                        newAbs = thisOp // this is used by spacebar to get the id of the object that is the outlet

                        /*
                        let s = stateChange('addNode', ['abs', thisOp])
                        doc1 = Automerge.change(doc1, s[3], doc => {
                            doc.scene.nodes[s[2]] = s[1]
                        })
                        console.log('abs', thisOp)
                        
                        */
                        
                    break
                    case 'div':
                        let opName = 'div'
            
                        const op = new Op(opName);
                        // get current position of op from within the palette
                        let inPalettePos = div.point
                        op.position.x = inPalettePos.x
                        op.position.y = inPalettePos.y
                        op.position.z = inPalettePos.z
                        loop.updatables.push(op);
                        scene.remove(palette);
                        scene.add(op);
                        updateMischmaschState()
                        newDiv = op // this is used by spacebar to get the id of the object that is the inlet

                        /*
                        let newState = stateChange('addNode', [opName, op])
                        console.log(newState)
                        doc1 = Automerge.change(doc1, newState[3], doc => {
                            doc.scene.nodes[newState[2]] = newState[1]
                        })
                        
                        
                        */
                    break

                }
                
            break
            case 'addConnection':
                // audio.updateGraph()
                
                let from = newAbs.meshes.jackOut.name
                let to = newDiv.meshes.inputJacks[0].name
                
                // console.log(abs, div)
                let fromObj = scene.getObjectByName(from)
                let toObj = scene.getObjectByName(to)
                // console.log(fromObj, toObj)
                
                let fromPos = newAbs.localToWorld(fromObj.position)
                let toPos = newDiv.localToWorld(toObj.position)

                // add a cable
                // const cable = new Cable(fromPos, toPos);
                // scene.add(cable.line)


                var path = new LineCurve3(fromPos, toPos);
                var tubegeometry = new TubeGeometry(path, 2, .02, 8, false);
                var material = new MeshBasicMaterial({ color: 0x0000ff });
                var line = new Mesh(tubegeometry, material);

                scene.add(line)
                // const curve = new Curve(fromPos, toPos)
                // console.log(curve)
                // scene.add(curve.line)
                // 
                // let msg = `connect ${from} to ${to}`
                // let newState = stateChange('addConnection', [from, to])
                // doc1 = Automerge.change(doc1, msg, doc => {
                //     doc.scene.arcs.push([from, to])
                // })
                
                


            break
            

        }
    }
    displayPalette(){
        // make Palette visible & clickable
        scene.add(palette);
    }

    hidePalette(){
        // make Palette invisible & unclickable
        scene.remove(palette);
    }
}
    
function updateMischmaschState() {
    // apply new scene to automerge doc
    //todo automerge breaks when trying to apply the scene.toJSON(). posted this in their github issues: https://github.com/automerge/automerge/issues/504 --- so for now, I'm stringifying the resulting JSON and passing it into automerge, which does not seem to have a problem. 
    // update matrix world before exporting it to json
    //! scene.updateMatrixWorld()
    //! let sceneJSON = scene.toJSON()
    //! console.log(sceneJSON)
    //! doc1 = Automerge.change(doc1, 'update state', doc => {
    //!     doc.three = sceneJSON
    //! })
    // mischmaschState = doc1
    // let jsonScene = scene.toJSON()
    // scene.fromObj
    // console.log('jsonScene', jsonScene)
    // genish.js will read from mischmaschState
    
    // update audio graph
    // audio.updateGraph()
}

function initGui() {

    gui = new GUI();
    gui.close()
    gui.title('User Settings')
    const param = {
        // 'line type': 0,
        // 'world units': false,
        'Cable Width': 5,
        'Controller Beam Colour': 0xffffff,
        'Controller Beam Width': 20,
        'Controller Beam Angle': -35,
        'Controller Vibration': true,
        'GPU Stats Window': false,
        // 'dash scale': 1,
        // 'dash / gap': 1
    };

    gui.add( param, 'Cable Width', 1, 10 ).onChange( function ( val ) {
        console.log('Cable Width', val);
    } );

    gui.addColor( param, 'Controller Beam Colour' ).onChange( function ( val ) {
        console.log('beam colour', val)
    } );

    gui.add( param, 'Controller Beam Width', 5, 50 ).onChange( function ( val ) {
        console.log('Controller Beam Width', val)
    } );

    gui.add( param, 'Controller Beam Angle', -180, 180 ).onChange( function ( val ) {
        console.log('Controller Beam Angle', val)
    } );

    gui.add( param, 'Controller Vibration').onChange( function ( val ) {
        console.log('Controller Vibration', val)
    } );

    gui.add( param, 'GPU Stats Window').onChange( function ( val ) {
        if(val == true){
            document.body.appendChild( stats.dom );
            // stats.showPanel( 1 );
        } else {
            document.body.removeChild( stats.dom );
            // stats.showPanel( 0 );
        }
        
    } );


    // gui.add( param, 'line type', { 'LineGeometry': 0, 'gl.LINE': 1 } ).onChange( function ( val ) {

    //     switch ( val ) {

    //         case 0:
    //             line.visible = true;

    //             line1.visible = false;

    //             break;

    //         case 1:
    //             line.visible = false;

    //             line1.visible = true;

    //             break;

    //     }

    // } );

    // gui.add( param, 'dash scale', 0.5, 2, 0.1 ).onChange( function ( val ) {

    //     matLine.dashScale = val;
    //     matLineDashed.scale = val;

    // } );

    // gui.add( param, 'dash / gap', { '2 : 1': 0, '1 : 1': 1, '1 : 2': 2 } ).onChange( function ( val ) {

    //     switch ( val ) {

    //         case 0:
    //             matLine.dashSize = 2;
    //             matLine.gapSize = 1;

    //             matLineDashed.dashSize = 2;
    //             matLineDashed.gapSize = 1;

    //             break;

    //         case 1:
    //             matLine.dashSize = 1;
    //             matLine.gapSize = 1;

    //             matLineDashed.dashSize = 1;
    //             matLineDashed.gapSize = 1;

    //             break;

    //         case 2:
    //             matLine.dashSize = 1;
    //             matLine.gapSize = 2;

    //             matLineDashed.dashSize = 1;
    //             matLineDashed.gapSize = 2;

    //             break;

    //     }

    // } );

}


export { World };