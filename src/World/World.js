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
import { Resizer } from './systems/Resizer.js'

// import { Resizer } from './systems/Resizer.js';
import { Loop } from './systems/Loop.js';
import { stateChange } from './systems/state.js'
import { Audio } from './systems/Audio.js'
// webXR
import { VRButton } from 'three/examples/jsm/webxr/VRButton.js';
import { Vector2, ObjectLoader, SetSceneCommand, AddObjectCommand,TubeGeometry, MeshBasicMaterial, LineCurve3, Mesh, LineBasicMaterial, Line, CatmullRomCurve3, BufferGeometry, Vector3 } from 'three'
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
let count = 0
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
        palette.position.set(-25,0,-30);
        palette.position.copy( camera.position );
        palette.rotation.copy( camera.rotation );
        palette.updateMatrix();
        // palette.translateZ( - 10 );

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
                                    // let fromSrc = selection.object

                                    // set cable position 0.2 in front of jack. 
                                    // let fromPos = new Vector3(fromSrc.object.position.x, fromSrc.object.position.y, (fromSrc.object.position.z + 5))
                                    // the 'from' is an jack, meaning its position is local to its parent op. so, need to get its localToWorld position:
                                    // let parentOp = fromSrc.object.parent;
                                    // let fromPos = parentOp.localToWorld(new Vector3(fromSrc.object.position.x, fromSrc.object.position.y, (fromSrc.object.position.z + 0.2)));
                                    // let toPos = xrCtlRight.model.position ;              
                                    
                                    // const cablePoints = [];
                                    // cablePoints.push(fromPos);
                                    // cablePoints.push(toPos);
                                
                                    // let geometry = new BufferGeometry().setFromPoints( cablePoints );
                                    // let cable = new Line(geometry, new LineBasicMaterial({ color: 0x888888 }));

                                    // cable.name = `partial_cable___src:_${parentOp.name}`
                                    // cable.userData.status = 'oneJack';
                                    // cable.userData.src = fromSrc
                                    // cable.userData.controller = ctrl.name;

                                    scene.add(partialCable.cable);
                                    loop.cables.push(partialCable.cable);
                                    loop.editorState.partialCable = partialCable.cable;
                                   
                                } else {
                                    // it is a partial cable
                                    // check 
                                    // connect cable to 2nd jack, remember to disconnect it from the controller
                                    console.log('complete cable:', selection)
                                    // reset activeCable status
                                    loop.editorState.partialCable = false
                                }
                                
                            break

                            case "panel":

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

                        let plugOne = loop.editorState.partialCable.userData.src
                        let plugTwo = loop.hover.ui.object
                        let plugs = [plugOne, plugTwo]
                        let src, dest;
                        for (let i = 0; i < 2; i++){
                            if(plugs[i].object.name.split('_')[0] === 'outlet'){
                                src = plugs[i]
                            } else if (plugs[i].object.name.split('_')[0] === 'inlet'){
                                dest = plugs[i]
                            } else {
                                console.log('error in cable connection, incorrect UI selected: ', plugs[i])
                            }
                        }
                        
                        // get parent ops of src and dest jacks
                        let srcParentOp = src.object.parent
                        let destParentOp = dest.object.parent
                        // get world positioning of jacks relative to their parents
                        let srcPos = srcParentOp.localToWorld(new Vector3(src.object.position.x, src.object.position.y, (src.object.position.z + 0.2)))
                        let destPos = destParentOp.localToWorld(new Vector3(dest.object.position.x, dest.object.position.y, (dest.object.position.z + 0.2)))          
        
                        const cablePoints = [];
                        cablePoints.push(srcPos);
                        cablePoints.push(destPos);
                        let geometry = new BufferGeometry().setFromPoints( cablePoints );
                        let cable = new Line(geometry, new LineBasicMaterial({ color: 0x888888 }));

                        cable.name = `cable___src:_${src.object.name}___dest:${dest.object.name}`
                        cable.userData.status = 'full_cable';
                        cable.userData.src = src
                        cable.userData.dest = dest
                        
                        scene.add(cable);
                        loop.cables.push(cable);

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

                }

                //  // check if a partial cable exists, and that it is not intersecting with an inlet, outlet, or (later) knob
                // //todo: this might not be necessary...
                // if (loop.editorState.partialCable != false && loop.hover.ui.element != 'inlet' && loop.hover.ui.element != 'outlet' && loop.hover.ui.element != 'knob'){
                //     // this partial cable needs to be deleted
                //     // console.log('remove')
                //     // scene.remove(loop.editorState.partialCable)
                //     // let cableIndex = loop.cables.indexOf(loop.editorState.partialCable)
                //     // loop.cables.splice(cableIndex, 1)
                //     // loop.editorState.partialCable = false
                // } else if (loop.hover.ui.element != false) {
                //     // user is interacting with an op UI element
                //     // check controller hover
                //     let selection = loop.hover.ui
                    
                //     if(selection.element){
                //         switch(selection.element){
                //             // cable creation:
                //             case "inlet":
                //             case "outlet":
                                
                //                 // is this a new cable, or a partial cable?
                //                 if(loop.editorState.partialCable == false){
                //                     // start a cable between jack and a controller
                //                     //todo decide how to pass this to genish?
                //                     //todo let nm = selection.name
                //                     let ob = selection.object
                //                     let fromSrc = selection.object

                //                     // set cable position 0.2 in front of jack. 
                //                     // let fromPos = new Vector3(fromSrc.object.position.x, fromSrc.object.position.y, (fromSrc.object.position.z + 5))
                //                     // the 'from' is an jack, meaning its position is local to its parent op. so, need to get its localToWorld position:
                //                     let parentOp = fromSrc.object.parent;
                //                     let fromPos = parentOp.localToWorld(new Vector3(fromSrc.object.position.x, fromSrc.object.position.y, (fromSrc.object.position.z + 0.2)));
                //                     let toPos = xrCtlRight.model.position ;              
                    
                //                     const cablePoints = [];
                //                     cablePoints.push(fromPos);
                //                     cablePoints.push(toPos);
                //                     let geometry = new BufferGeometry().setFromPoints( cablePoints );
                //                     let cable = new Line(geometry, new LineBasicMaterial({ color: 0x888888 }));

                //                     cable.name = `partial_cable___src:_${parentOp.name}`
                //                     cable.userData.status = 'oneJack';
                //                     cable.userData.src = fromSrc
                //                     cable.userData.controller = ctrl.name;

                //                     scene.add(cable);
                //                     loop.cables.push(cable);
                //                     loop.editorState.partialCable = cable;
                                   
                //                 } else {
                //                     // it is a partial cable
                //                     // check 
                //                     // connect cable to 2nd jack, remember to disconnect it from the controller
                //                     console.log('complete cable:', selection)
                //                     // reset activeCable status
                //                     loop.editorState.partialCable = false
                //                 }
                                
                //             break

                //             case "panel":

                //             break
                //         }
                //     }
                // } 



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

        // mouse controls 
        const controls = createControls(camera, renderer.domElement);
        window.addEventListener( 'pointermove', function(event){
            pointer.x = ( event.clientX / window.innerWidth ) * 2 - 1;
            pointer.y = - ( event.clientY / window.innerHeight ) * 2 + 1;
        } );


        // rendering loop
        loop = new Loop(camera, scene, renderer, pointer, xrCtlRight, xrCtlLeft, stats, gpuPanel, palette);
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