// modules from the components folder
import { createCamera } from './systems/camera.js';
import { Op } from './components/Op/Op.js';
import { Palette } from './components/Palette/Palette.js';
import { createScene } from './components/scene.js';
import { createLights } from './components/Lights/lights.js'
import { XRController } from './components/XRController/XRController.js'
import { Cable } from './components/Cable/Cable.js'
import { Curve } from './components/Cable/Curve.js'
import { Floor } from './components/Floor/Floor'
// modules from the systems folder
import { createControls } from './systems/controls.js';
import { createRenderer } from './systems/renderer.js';
import { Resizer } from './systems/Resizer.js'
import { UserSettings } from './systems/UserSettings.js';
import { Collisions } from './systems/Collisions';
// import { Resizer } from './systems/Resizer.js';
import { Loop } from './systems/Loop.js';
import { stateChange } from './systems/state.js'
import { Audio } from './systems/Audio.js'
// webXR
import { VRButton } from 'three/examples/jsm/webxr/VRButton.js';
import { Vector2, ObjectLoader, SetSceneCommand, AddObjectCommand,TubeGeometry, MeshBasicMaterial, LineCurve3, Mesh, LineBasicMaterial, Line, CatmullRomCurve3, BufferGeometry, Vector3, Matrix4, Group,BoxGeometry, ConeGeometry, CylinderGeometry, IcosahedronGeometry, TorusGeometry, MeshStandardMaterial, Raycaster, } from 'three'

import Stats from 'three/examples/jsm/libs/stats.module.js';
import { GPUStatsPanel } from 'three/examples/jsm/utils/GPUStatsPanel.js';

import { XRControllerModelFactory } from 'three/examples/jsm/webxr/XRControllerModelFactory.js';


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
let userSettings;
//!
let controller1, controller2;
let controllerGrip1, controllerGrip2;
const intersected = [];
const tempMatrix = new Matrix4();
//!

let raycaster;
let audio;
let mischmaschState;
let floor;
const pointer = new Vector2();
let opIDMap = {}

// temp vars for keyboard scaffolding
let newAbs, newDiv;
let count = 0
class World {
    // 1. Create an instance of the World app
    constructor(container) {
        camera = createCamera();
        scene = createScene();
        renderer = createRenderer();
        
        // gpu stats panel
        stats = new Stats();
        
        gpuPanel = new GPUStatsPanel( renderer.getContext() );
        stats.addPanel( gpuPanel );

        // user settings
        userSettings = new UserSettings(stats);

        // XR rendering
        document.body.appendChild( VRButton.createButton( renderer ) );
        renderer.xr.enabled = true;

        // collision detecting
        
        // carpet (floor)
        floor = new Floor()
        floor.floor.position.y = -10
        scene.add(floor.floor)
        
        // create the Palette of available Ops
        palette = new Palette(camera.position)
        // place palette in front of camera
        camera.add(palette);
        palette.position.set(-25,0,20);
        palette.position.copy( camera.position );
        palette.rotation.copy( camera.rotation );
        palette.updateMatrix();
        // palette.translateZ( - 10 );

        //! alternate xr controller attempt

        let synth = new Group();
        synth.name = 'sceneSynth'
        scene.add( synth );

        const geometries = [
            new BoxGeometry( 0.2, 0.2, 0.2 ),
            new ConeGeometry( 0.2, 0.2, 64 ),
            new CylinderGeometry( 0.2, 0.2, 0.2, 64 ),
            new IcosahedronGeometry( 0.2, 8 ),
            new TorusGeometry( 0.2, 0.04, 64, 32 )
        ];

        for ( let i = 0; i < 50; i ++ ) {

            const geometry = geometries[ Math.floor( Math.random() * geometries.length ) ];
            const material = new MeshStandardMaterial( {
                color: Math.random() * 0xffffff,
                roughness: 0.7,
                metalness: 0.0
            } );

            const object = new Mesh( geometry, material );

            object.position.x = Math.random() * 4 - 2;
            object.position.y = Math.random() * 2;
            object.position.z = Math.random() * 4 - 2;

            object.rotation.x = Math.random() * 2 * Math.PI;
            object.rotation.y = Math.random() * 2 * Math.PI;
            object.rotation.z = Math.random() * 2 * Math.PI;

            object.scale.setScalar( Math.random() + 0.5 );

            object.castShadow = true;
            object.receiveShadow = true;

            // synth.add( object );

        }
        
        controller1 = renderer.xr.getController( 0 );
        controller1.addEventListener( 'selectstart', onSelectStart );
        controller1.addEventListener( 'selectend', onSelectEnd );
        controller1.addEventListener( 'squeezestart', onSqueezeStart);
        controller1.addEventListener( 'squeezeend', onSqueezeEnd)
        scene.add( controller1 );

        controller2 = renderer.xr.getController( 1 );
        controller2.addEventListener( 'selectstart', onSelectStart );
        controller2.addEventListener( 'selectend', onSelectEnd );
        scene.add( controller2 );

        const controllerModelFactory = new XRControllerModelFactory();

        controllerGrip1 = renderer.xr.getControllerGrip( 0 );
        controllerGrip1.add( controllerModelFactory.createControllerModel( controllerGrip1 ) );
        scene.add( controllerGrip1 );

        controllerGrip2 = renderer.xr.getControllerGrip( 1 );
        controllerGrip2.add( controllerModelFactory.createControllerModel( controllerGrip2 ) );
        scene.add( controllerGrip2 );

        const geometry = new BufferGeometry().setFromPoints( [ new Vector3( 0, 0, 0 ), new Vector3( 0, 0, - 1 ) ] );

        const line = new Line( geometry );
        line.name = 'line';
        line.scale.z = 5;
        line.updateMatrix()
        controller1.add( line.clone() );
        controller2.add( line.clone() );

        raycaster = new Raycaster();
        //! aadfadfadfaf

        function onSelectStart( event ) {

            const controller = event.target;

            const intersections = getIntersections( controller );

            if ( intersections.length > 0 ) {

                const intersection = intersections[ 0 ];

                const object = intersection.object;
                if(palette.userData.active){
                   
                    
                    // object.parent.meshes.panel.material.emissive
                    // object.material.emissive.b = 1;
                    controller.attach( object.parent );

                    controller.userData.selected = object.parent;

                    synth.remove(palette)
                    palette.userData.active = false;

                    // rebuild the palette so the selected op is replaced
                    camera.remove(palette)
                    palette = new Palette(camera.position)
                    // place palette in front of camera
                    camera.add(palette);
                    palette.position.set(-25,0,20);
                    palette.position.copy( camera.position );
                    palette.rotation.copy( camera.rotation );
                    palette.updateMatrix();

                    // let paletteOp = object
                    // let opName = paletteOp.object.name
                    
                    // const op = new Op(opName);
                    // // get current position of op from within the palette
                    // let inPalettePos = paletteOp.point
                    // op.position.x = inPalettePos.x
                    // op.position.y = inPalettePos.y
                    // op.position.z = inPalettePos.z
                    // loop.updatables.push(op);
                    // synth.remove(palette);
                    // palette.userData.active = false;
                    // synth.add(op);
                    // console.log(op)



                    // let stateChange = stateChange('addNode', [opName, op])
                    // doc1 = Automerge.change(doc1, stateChange[3], doc => {
                    //     doc.scene.nodes[stateChange[2]] = stateChange[1]
                    // })
                    // updateMischmaschState(doc1)
                }else {
                    //palette isn't open
                    console.log(object)
                    let objectName = object.name;
                    let objectKind = objectName.split('_')[0]

                    switch (objectKind){
                        case "panel":
                            // manipulate the op's position in world space
                            controller.attach( object.parent );

                            controller.userData.selected = object.parent;
                            // this.hover.state.ui.element = 'panel'
                            // this.hover.state.ui.object = intersects[i]
                            // this.hover.state.ui.name = intersects[i].object.name
                            // this.hover.setHoverColour(intersects[i])
                        break;

                    }
                }

            }

        }

        function onSelectEnd( event ) {

            const controller = event.target;

            if ( controller.userData.selected !== undefined ) {



                const object = controller.userData.selected;
                if(object.userData.kind = 'op'){
                    let op = object
                    op.meshes.panel.material.emissive.b = 0;
                    // synth.attach( object );
                    synth.add(op)
                    controller.remove( op );
                    loop.updatables.push(op);
                    
    
                    controller.userData.selected = undefined;
                }


            }


        }

        function onSqueezeStart(){
            // this refers to the controller
            // if (palette.userData.active == true ){
            //     synth.remove(palette);
            //     palette.userData.active = false;
            // }else {
                // ctrl.controller.children[0].scale.z = 10;
                // ctrl.controller.userData.squeezePressed = true;
                // set palette position in front of player
                // make Palette visible & clickable
                palette.position.copy( camera.position );
                palette.rotation.copy( camera.rotation );
                palette.position.x -= 25
                palette.position.z =+ 5
                palette.updateMatrix();
                // palette.translateZ( - 10 );
                synth.add(palette);
                palette.userData.active = true;
            // }

        };

        // squeeze unpress
        function onSqueezeEnd(){
            // this refers to the controller
            // ctrl.controller.children[0].scale.z = 10;
            // ctrl.controller.userData.squeezePressed = false;
            // make Palette invisible & unclickable
            synth.remove(palette);
            palette.userData.active = false;
        };
        
        function getIntersections( controller ) {

            tempMatrix.identity().extractRotation( controller.matrixWorld );

            raycaster.ray.origin.setFromMatrixPosition( controller.matrixWorld );
            raycaster.ray.direction.set( 0, 0, - 1 ).applyMatrix4( tempMatrix );

            return raycaster.intersectObjects( synth.children, true );

        }

        function intersectObjects( controller ) {

            // Do not highlight when already selected

            if ( controller.userData.selected !== undefined ) return;

            const line = controller.getObjectByName( 'line' );
            const intersections = getIntersections( controller );

            if ( intersections.length > 0 ) {

                const intersection = intersections[ 0 ];

                const object = intersection.object;
                object.parent.meshes.panel.material.emissive.r = 1;
                intersected.push( object );

                line.scale.z = intersection.distance;

            } else {

                line.scale.z = 25;

            }

        }

        function cleanIntersected() {

            while ( intersected.length ) {

                const object = intersected.pop();
                object.parent.meshes.panel.material.emissive.r = 0;

            }

        }
        //
        // function animate() {

        //     renderer.setAnimationLoop( render );

        // }

        // function render() {

        //     cleanIntersected();

        //     intersectObjects( controller1 );
        //     intersectObjects( controller2 );

        //     // renderer.render( scene, camera );

        // }

        // renderer.setAnimationLoop( render );

        /*
        //!
        // XR controllers
        const xrCtlRight = new XRController(renderer, 0)
        const xrCtlLeft = new XRController(renderer, 1)
        scene.add(xrCtlRight.model, xrCtlLeft.model)
        // xrCtlRight.controller.rayCastBeam, xrCtlLeft.controller.rayCastBeam
        let xrControllers = [xrCtlLeft, xrCtlRight]
        
        xrControllers.forEach(ctrl => {
            // trigger press
            ctrl.controller.addEventListener('selectstart', function(){
                
                // this refers to the controller
                // ctrl.controller.children[0].scale.z = 10;
                ctrl.controller.userData.selectPressed = true;
                // first check if palette is open. if not, block this action
                if(scene.children.some(element => element.name === 'Palette')){
                    let paletteOp = loop.userSelect().paletteOp;
                    let opName = paletteOp.object.name
                    
                    const op = new Op(opName);
                    // get current position of op from within the palette
                    let inPalettePos = paletteOp.point
                    op.position.x = inPalettePos.x
                    op.position.y = inPalettePos.y
                    op.position.z = inPalettePos.z
                    loop.updatables.push(op);
                    scene.remove(palette);
                    palette.userData.active = false;
                    scene.add(op);
                    console.log(op)
                    // let stateChange = stateChange('addNode', [opName, op])
                    // doc1 = Automerge.change(doc1, stateChange[3], doc => {
                    //     doc.scene.nodes[stateChange[2]] = stateChange[1]
                    // })
                    // updateMischmaschState(doc1)
                } 
                // check if a partial cable exists, and that it is not intersecting with an inlet, outlet, or (later) knob
                //todo: this might not be necessary...
                if (loop.editorState.partialCable != false && loop.hover.ui.element != 'inlet' && loop.hover.ui.element != 'outlet' && loop.hover.ui.element != 'knob'){
                    // this partial cable needs to be deleted
                    // console.log('remove')
                    // scene.remove(loop.editorState.partialCable)
                    // let cableIndex = loop.cables.indexOf(loop.editorState.partialCable)
                    // loop.cables.splice(cableIndex, 1)
                    // loop.editorState.partialCable = false
                } else if (loop.hover.ui.element != false) {
                    // user is interacting with an op UI element
                    // check controller hover
                    let selection = loop.hover.ui
                    
                    if(selection.element){
                        switch(selection.element){
                            // cable creation:
                            case "inlet":
                            case "outlet":
                                // is this a new cable, or a partial cable?
                                if(loop.editorState.partialCable == false){
                                    // start a cable between jack and a controller
                                    //todo decide how to pass this to genish?
                                    //todo let nm = selection.name
                                    let partialCable = new Cable('partial', selection.object, xrCtlRight.model.position, ctrl.name) 

                                    scene.add(partialCable.cable);
                                    loop.cables.push(partialCable.cable);
                                    loop.editorState.partialCable = partialCable.cable;
                                   
                                } else {

                                }
                                
                            break

                            case "panel":
                                // manipulate the op's position in space
                                if(ctrl.name == 'controller_0'){
                                    loop.editorState.rightControllerState.select.element = 'panel'
                                    loop.editorState.rightControllerState.select.object = loop.hover.ui.object                                   
                                } else if (ctrl.name = 'controller_1'){
                                    loop.editorState.leftControllerState.select.element = 'panel'
                                    loop.editorState.leftControllerState.select.object = loop.hover.ui.object
                                }
                                
                            break
                        }
                    }
                } 

            });

            // trigger unpress
            ctrl.controller.addEventListener('selectend', function(){
                // this refers to the controller
                ctrl.controller.userData.selectPressed = false;

                // is there a partial cable?
                if(loop.editorState.partialCable != false){
                    // is the partial cable's 2nd end intersecting a jack?
                    // console.log('ui element', loop.hover.ui)
                    // if it is, complete the cable
                    if(loop.hover.ui.element != false && loop.hover.ui.element == 'inlet' || loop.hover.ui.element == 'outlet'){
                        // get both jacks for the new cable to attach to
                        let jackOne = loop.editorState.partialCable.userData.src
                        let jackTwo = loop.hover.ui.object

                        // add complete cable                        
                        let completeCable = new Cable( 'complete', jackOne, jackTwo )
                        scene.add(completeCable.cable);
                        loop.cables.push(completeCable.cable);

                        // remove partial cable
                        scene.remove(loop.editorState.partialCable)
                        let cableIndex = loop.cables.indexOf(loop.editorState.partialCable)
                        loop.cables.splice(cableIndex, 1)
                        loop.editorState.partialCable = false
                    }
                    // if it isn't, delete the cable
                    else {
                        // ctrl.controller.children[0].scale.z = 10;
                        scene.remove(loop.editorState.partialCable)
                        let cableIndex = loop.cables.indexOf(loop.editorState.partialCable)
                        loop.cables.splice(cableIndex, 1)
                        loop.editorState.partialCable = false
                    }
                } else {
                    // manipulate the op's position in space
                    if(ctrl.name == 'controller_0'){
                        loop.editorState.rightControllerState.select.element = false
                        loop.editorState.rightControllerState.select.object = false                                   
                    } else if (ctrl.name = 'controller_1'){
                        loop.editorState.leftControllerState.select.element = false
                        loop.editorState.leftControllerState.select.object = false
                    }
                }

            });
            // squeeze press
            ctrl.controller.addEventListener('squeezestart', function(){
                // this refers to the controller
                // ctrl.controller.children[0].scale.z = 10;
                ctrl.controller.userData.squeezePressed = true;
                // set palette position in front of player
                // make Palette visible & clickable
                palette.position.copy( camera.position );
                palette.rotation.copy( camera.rotation );
                palette.position.x -= 25
                palette.updateMatrix();
                palette.translateZ( - 10 );
                scene.add(palette);
                palette.userData.active = true;
            });

            // squeeze unpress
            ctrl.controller.addEventListener('squeezeend', function(){
                // this refers to the controller
                // ctrl.controller.children[0].scale.z = 10;
                ctrl.controller.userData.squeezePressed = false;
                // make Palette invisible & unclickable
                scene.remove(palette);
                palette.userData.active = false;
            });
           
        })

        
         // CUSTOM EVENTS:
            // get thumbstick axes
            //! commented out because this data is available in loop.editorState.rightController.thumbstick, and this is being accessed in patching.js, so can be accessed in other places. perhaps commenting this out will help optimization
            // window.addEventListener('rightThumbstickAxes', (e) => {
            //     // the axes data is found below. commented out just for now:  
            //     // xrCtlRight.thumbstickAxes
                
            // })
            // window.addEventListener('leftThumbstickAxes', (e) => {
            //     // the axes data is found below. commented out just for now:  
            //     // xrCtlLeft.thumbstickAxes
            // })

            // get thumbstick button presses
            window.addEventListener('rightThumbstickPress', (e)=>{
                // do something with the press event
            })

            // get thumbstick button presses
            window.addEventListener('leftThumbstickPress', (e)=>{
                // do something with the press event
            })

            // get 'B'' button presses
            window.addEventListener('rightBPress', (e)=>{
                // do something with the press event


            })

            // get 'B' button presses
            window.addEventListener('leftBPress', (e)=>{
                // do something with the press event
            })

            // get 'A' button presses
            window.addEventListener('rightAPress', (e)=>{
                // do something with the press event
            })

            // get 'A' button presses
            window.addEventListener('leftAPress', (e)=>{
                // do something with the press event
            })
        */
       //!
        // mouse controls 
        const controls = createControls(camera, renderer.domElement);
        window.addEventListener( 'pointermove', function(event){
            pointer.x = ( event.clientX / window.innerWidth ) * 2 - 1;
            pointer.y = - ( event.clientY / window.innerHeight ) * 2 + 1;
        } );

        
        // rendering loop
        // loop = new Loop(camera, scene, renderer, pointer, xrCtlRight, xrCtlLeft, stats, gpuPanel, palette, userSettings);
        loop = new Loop(camera, scene, renderer, pointer, null, null, stats, gpuPanel, palette, userSettings, getIntersections, intersectObjects, cleanIntersected, controller1, synth);
        loop.updatables.push(controls);

        // add the three canvas to the html container
        container.append(renderer.domElement); 

        // ligthing
        const { ambientLight, mainLight } = createLights();
        scene.add(ambientLight, mainLight);

        // resizer. See discoverthreejs for how/why this is useful
        const resizer = new Resizer(container, camera, renderer);

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
                        newAbs = thisOp // this is used by 'c' key to get the id of the object that is the outlet

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



export { World };