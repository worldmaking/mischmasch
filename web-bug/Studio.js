// components
import { Op } from './components/Op/Op.js';
import { Palette } from './components/Palette/Palette.js';
import { createLights } from './components/Lights/lights.js'
import { XRController } from './components/XRController/XRController.js'
import { Cable } from './components/Cable/Cable.js'
import { Curve } from './components/Cable/Curve.js'
import { Floor } from './components/Floor/Floor'
import { createScene } from './components/scene.js';
import { Editor } from './components/Editor/Editor'
import { Patch } from './components/Patch/Patch'

// systems
import { createCamera } from './systems/camera.js';
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
import { Vector2, BufferGeometry, Vector3, Matrix4, Group, Raycaster, Line} from 'three'

import Stats from 'three/examples/jsm/libs/stats.module.js';
import { GPUStatsPanel } from 'three/examples/jsm/utils/GPUStatsPanel.js';

import { XRControllerModelFactory } from 'three/examples/jsm/webxr/XRControllerModelFactory.js';



// versioning



// These variables are module-scoped: we cannot access them
// from outside the module
let camera;
let renderer;

// scenes
let studioScene, editor, patch;

let loop;
let palette;
let doc1;
let stats, gpuPanel;
let userSettings;
//!
let controller_0, controller_1;
let controllerGrip1, controllerGrip2;
const intersected = [];
let currentIntersection;
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
class Studio {
    constructor(container) {

        
        camera = createCamera();

        // scenes
        
        studioScene = createScene('studio');
        studioScene.name = 'studio'

        editor = new Editor();
        editor.scene.name = 'editor'
        studioScene.add(editor.scene)
        patch = new Patch(loop);
        patch.scene.name = 'synth'
        editor.scene.add( patch.scene );
       
        // renderer
        renderer = createRenderer();
        // XR rendering
        document.body.appendChild( VRButton.createButton( renderer ) );
        renderer.xr.enabled = true;
     
        // page UI: gpu stats panel
        stats = new Stats();
        gpuPanel = new GPUStatsPanel( renderer.getContext() );
        stats.addPanel( gpuPanel );
        // page UI: userSettings
        userSettings = new UserSettings(stats);
        

        // collision detecting
        
        // carpet (floor)
        floor = new Floor()
        floor.floor.position.y = -2
        studioScene.add(floor.floor)
        
        // create the Palette of available Ops
        palette = new Palette(camera.position)
        // place palette in front of camera
        camera.add(palette);
        // palette.position.set(-25,0,20);
        palette.position.copy( camera.position );
        palette.rotation.copy( camera.rotation );
        palette.updateMatrix();
        editor.scene.add(palette)
        palette.visible = false


        //! alternate xr controller attempt


        
        controller_0 = renderer.xr.getController( 0 );
        controller_0.addEventListener( 'selectstart', onSelectStart );
        controller_0.addEventListener( 'selectend', onSelectEnd );
        controller_0.addEventListener( 'squeezestart', onSqueezeStart);
        controller_0.addEventListener( 'squeezeend', onSqueezeEnd)
        controller_0.addEventListener( 'connected', (e) => {
            controller_0.userData.gamepad = e.data.gamepad 
            controller_0.userData.handedness = e.data.handedness 
        });
        controller_0.name = 'controller_0'
        // this will be from a custom event emitter in loop.js       
        controller_0.thumbstickAxes = []
        editor.scene.add( controller_0 );

        controller_1 = renderer.xr.getController( 1 );
        controller_1.addEventListener( 'selectstart', onSelectStart );
        controller_1.addEventListener( 'selectend', onSelectEnd );
        editor.scene.add( controller_1 );

        const controllerModelFactory = new XRControllerModelFactory();

        controllerGrip1 = renderer.xr.getControllerGrip( 0 );
        controllerGrip1.add( controllerModelFactory.createControllerModel( controllerGrip1 ) );
        editor.scene.add( controllerGrip1 );

        controllerGrip2 = renderer.xr.getControllerGrip( 1 );
        controllerGrip2.add( controllerModelFactory.createControllerModel( controllerGrip2 ) );
        editor.scene.add( controllerGrip2 );

        const geometry = new BufferGeometry().setFromPoints( [ new Vector3( 0, 0, 0 ), new Vector3( 0, 0, -1 ) ] );

        const line = new Line( geometry );
        line.name = 'line';
        line.scale.z = 5;
        line.updateMatrix()
        controller_0.add( line.clone() );
        controller_1.add( line.clone() );

        raycaster = new Raycaster();
        //! aadfadfadfaf
        
        // // mouse controls 
        // const controls = createControls(camera, renderer.domElement);
        // window.addEventListener( 'pointermove', function(event){
        //     pointer.x = ( event.clientX / window.innerWidth ) * 2 - 1;
        //     pointer.y = - ( event.clientY / window.innerHeight ) * 2 + 1;
        // } );
        
        // rendering loop
        // loop = new Loop(camera, studioScene, renderer, pointer, xrCtlRight, xrCtlLeft, stats, gpuPanel, palette, userSettings);
    
        loop = new Loop(camera, studioScene, renderer, pointer, null, null, stats, gpuPanel, palette, userSettings, getIntersections, intersectObjects, cleanIntersected, controller_0, patch, floor, editor, patch);
        // loop.updatables.push(controls);

        

        // add the three canvas to the html container
        container.append(renderer.domElement); 

        // ligthing
        const { ambientLight, mainLight } = createLights();
        studioScene.add(ambientLight, mainLight);

        // resizer. See discoverthreejs for how/why this is useful
        const resizer = new Resizer(container, camera, renderer);

        // controller functions
        function onSelectStart( event ) {
            const controller = event.target;

            const intersections = getIntersections( controller );

            if ( intersections.length > 0 ) {

                const intersection = intersections[ 0 ];

                const object = intersection.object;
                if(palette.userData.active){
                    // get position of palette op relative to patch scene
                    let palettePos = palette.localToWorld(object.parent.position) //keep this here
                    let pos = patch.scene.localToWorld(object.parent.position)
                    
                    let payload = [object.parent.name, pos]
                    // console.log(object.parent.clone())
                    // controller.attach( object.parent );
                    patch.add('op', payload)
                    // console.log('palette op', object.parent)

                    // editor.scene.remove(palette)
                    palette.userData.active = false;
                    hidePalette()

                }else {
                    //palette isn't open
                    let objectName = object.name;
                    let objectKind = objectName.split('_')[0]

                    switch (objectKind){
                        case "panel":
                            // manipulate the op's position in world space
                            // controller.attach( object.parent );
                            editor.state.controller_0.selected = object.parent
                            
                            editor.state.controller_0.select.element = 'panel'
                            editor.state.controller_0.select.object = object.parent
                        break;

                        case 'inlet':
                        case 'outlet':
                            if(editor.state.partialCable == false){
                                editor.makePartialCable(object, controller_0)
                            } else {        
                            }
                        break

                    }
                }

            }

        }

        function onSelectEnd( event ) {

            // handle partial cables
            if(editor.state.partialCable != false){
                // is the controller ray hovering a jack?
                if(editor.state.controller_0.jackTwoHover != false){
                    let jackTwo = editor.state.controller_0.jackTwoHover
                    // check if 2nd end of partial cable is intersecting the correct jack type (opposite of 1st end)
                    if(editor.state.partialCable.userData.src.userData.kind != jackTwo.userData.kind && (jackTwo.userData.kind == 'inlet' || jackTwo.userData.kind == 'outlet')){
                        // get both jacks for the new cable to attach to
                        let jackOne = editor.state.partialCable.userData.src
                        // add complete cable to document
                        patch.add('cable', [jackOne, jackTwo])                     
                        // remove partial cable
                        editor.removePartialCable(editor.state.partialCable)
                    } else {
                        // not intersecting a valid jack, so remove the partial cable
                        
                        editor.removePartialCable()
                    }
                }
                

            }else if(editor.state.partialCable != false){
                // not intersecting a valid jack, so remove the jack
                editor.removePartialCable()
            }
            


            const controller = event.target





            if ( controller.userData.selected !== undefined ) {


                const object = event.target.userData.selected;
                // check if there's a partial cable
                


                switch (object.userData.kind){
                    case 'op':
                        let op = object
                        op.meshes.panel.material.emissive.b = 0;

               

                        // patch.scene.attach( object );
                        // if op is below floor, delete it
                        // console.log('op y', op.position.y, 'floor', floor.floor.position, 'op', op.position)
                        // patch.scene.updateMatrixWorld()
                        
                        // if the op's Y position in world space is lower than the floor
                        // console.log(patch, op.position)
                        if(patch.scene.localToWorld(op.position).y < -2){

                            // remove it
                            controller.remove( op )
                            patch.scene.remove( op )
                        }else {

                        }
                    break

                    case 'inlet':
                    case 'outlet':

                    break


                }


                event.target.userData.selected = undefined;

                
        
            } 

        }
        /* //!
        if(loop.hover.ui.element != false && loop.hover.ui.element == 'inlet' || loop.hover.ui.element == 'outlet'){
            // get both jacks for the new cable to attach to
            let jackOne = loop.editorState.partialCable.userData.src
            let jackTwo = loop.hover.ui.object

            // add complete cable                        
            let completeCable = new Cable( 'complete', jackOne, jackTwo )
            studioScene.add(completeCable.cable);
            loop.cables.push(completeCable.cable);

            // remove partial cable
            studioScene.remove(loop.editorState.partialCable)
            let cableIndex = loop.cables.indexOf(loop.editorState.partialCable)
            loop.cables.splice(cableIndex, 1)
            loop.editorState.partialCable = false
        }
        // if it isn't, delete the cable
        else {
            // ctrl.controller.children[0].scale.z = 10;
            studioScene.remove(loop.editorState.partialCable)
            let cableIndex = loop.cables.indexOf(loop.editorState.partialCable)
            loop.cables.splice(cableIndex, 1)
            loop.editorState.partialCable = false
        }
        */ //!
        function onSqueezeStart(){
            showPalette()

        };

        function onSqueezeEnd(){
            hidePalette()
        };
        
        function getIntersections( controller ) {

            tempMatrix.identity().extractRotation( controller.matrixWorld );

            raycaster.ray.origin.setFromMatrixPosition( controller.matrixWorld );
            raycaster.ray.direction.set( 0, 0, - 1 ).applyMatrix4( tempMatrix );

            let intersections;
            if(palette.userData.active == true){
                intersections = raycaster.intersectObjects( palette.children, true );
            } else {
                intersections = raycaster.intersectObjects( patch.scene.children, true );
            }
            return intersections

        }

        function intersectObjects( controller ) {

            // Do not highlight when already selected
            if ( controller.userData.selected !== undefined ) return;

            const line = controller.getObjectByName( 'line' );
            const intersections = getIntersections( controller );

            if ( intersections.length > 0 ) {
                
                const intersection = intersections[ 0 ];
                const object = intersection.object;
                if(palette.userData.active){
                    // palette is active, so highlight an op if hovered
                    object.parent.meshes.panel.material.opacity = 0.4
                    object.parent.meshes.panel.material.emissive.b = 1;
                    object.parent.meshes.panel.material.emissiveIntensity = 1;
                    // add hovered to intersected array
                    intersected.push( object.parent.meshes.panel );
                }else {
                    // if partial cable is active, get inlet/outlet intersections for the 2nd plug
                    if(editor.state.partialCable != false){                        
                        // don't allow inlet to inlet, or outlet to outlet, for now
                        if(editor.state.partialCable.userData.src.userData.kind != object.userData.kind){
                            editor.state.controller_0.jackTwoHover = object
                            switch(object.userData.kind){
                                case 'inlet':
               
                                    object.material.emissive.r = 1
                                    object.material.emissiveIntensity = 10
                                break
                                case 'outlet':
                                    object.material.emissive.r = 1
                                    object.material.emissiveIntensity = 10
                                break
    
                            }
                            intersected.push(object)             
                        }else {
                            editor.state.controller_0.jackTwoHover = false
                        }
 
                    } else{

                        intersected.push( object );
                        // op element type:
                        switch(object.userData.kind){
                            case 'panel':
                                // detect if below floor (stage for deletion)
                                if(patch.scene.localToWorld( object.parent.position ).y < -2){
                                    // highlight it red?
                                    object.material.opacity = 0.1
                                    
                                    
                                }else {
                                    object.material.opacity = 0.3
                                    object.material.emissive.g = 1
                                    object.material.emissiveIntensity = 10
                                    editor.state[controller.name].hovered = object
                                }
                                
                            break
                            case 'inlet':
                                object.material.opacity = 0.3
                                object.material.emissive.r = 1
                                object.material.emissiveIntensity = 10
                            break
                            case 'outlet':
                                object.material.opacity = 0.3
                                object.material.emissive.r = 1
                                object.material.emissiveIntensity = 10
                            break

                        }
                    }
                    
                }

                
                

                line.scale.z = intersection.distance;

            } else {

                line.scale.z = 25;

            }

        }

        function cleanIntersected() {

            while ( intersected.length ) {
                
                if(palette.userData.active){
                    intersected[0].material.opacity = 0.2
                    intersected[0].material.emissive.b = 0;
                    // object.parent.meshes.panel.material.emissiveIntensity = 10;
                }else {
                    // op element type:
                    switch(intersected[0].userData.kind){
                        case 'panel':
                            intersected[0].material.opacity = 0.2
                            intersected[0].material.emissive.b = 0
                            editor.state['controller_0'].hovered = false
                            // object.material.emissiveIntensity = 10
                        break
                        case 'inlet':
                            
                            intersected[0].material.emissive.r = 0
                            intersected[0].material.emissiveIntensity = 1
                        break
                        case 'outlet':
                            intersected[0].material.emissive.r = 0
                            intersected[0].material.emissiveIntensity = 1
                        break
                    
                    }


                }
                // clear intersected array
                const object = intersected.pop();

            }

        }

        function showPalette(){

            // palette = new Palette(camera.position)
            // place palette in front of camera
            // camera.add(palette);
            // palette.position.set(-25,0,20);
            palette.position.copy( camera.position );
            palette.rotation.copy( camera.rotation );
            palette.updateMatrix();

            // palette.rotation.copy( camera.rotation );
            palette.translateX(-12)
            palette.translateY(floor.floor.position.y + 10);

            // palette.updateMatrix();
            let zTranslation = editor.userSettings.parameters['Palette Distance']
            palette.translateZ( + zTranslation );
            // editor.scene.add(palette);
            palette.visible = true
            palette.userData.active = true;
        }

        function hidePalette(){
            palette.visible = false
            palette.userData.active = false;
        }


        // updateMischmaschState()
        
        // audio
        // audio = new Audio()

        // how to load a scene from 
        // todo THIS WORKS, its only commented out to work on other stuff
        /*
        const loader = new ObjectLoader()
        loader.parse(tempScene, (theObj) => {
            studioScene.add(theObj)
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
}
    
function updateMischmaschState() {
    // apply new scene to automerge doc
    //todo automerge breaks when trying to apply the scene.toJSON(). posted this in their github issues: https://github.com/automerge/automerge/issues/504 --- so for now, I'm stringifying the resulting JSON and passing it into automerge, which does not seem to have a problem. 
    // update matrix world before exporting it to json
    //! studioScene.updateMatrixWorld()
    //! let sceneJSON = studioScene.toJSON()
    //! doc1 = Automerge.change(doc1, 'update state', doc => {
    //!     doc.three = sceneJSON
    //! })
    // mischmaschState = doc1
    // let jsonstudioScene = studioScene.toJSON()
    // studioScene.fromObj
    // genish.js will read from mischmaschState
    
    // update audio graph
    // audio.updateGraph()
}



export { Studio };