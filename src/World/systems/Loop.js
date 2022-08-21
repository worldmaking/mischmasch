import { Clock, Vector3, Matrix4, Raycaster, Color, ArrowHelper, BufferAttribute } from 'three';
const clock = new Clock();

const objectUnselectedColor = new Color(0x5853e6);
const objectSelectedColor = new Color(0xf0520a);
let hoverColour = new Array(); // element 0 = the object, element 1 is its original colour
class Loop {
    constructor(camera, scene, renderer, pointer, xrCtlRight, xrCtlLeft, stats, gpuPanel, palette) {
        this.camera = camera;
        this.scene = scene;
        this.renderer = renderer;
        this.updatables = [] // list to hold animated objects //! this might need to reference the automerge document eventually?
        this.pointer = pointer;
        this.raycaster = new Raycaster();
        this.arrow = new ArrowHelper( this.raycaster.ray.direction, this.raycaster.ray.origin, 100, Math.random() * 0xffffff, 0.05, 0.05 ) // for the hmd raycaster
        this.arrow.name = 'arrowHelper'
        this.arrow.cone.visible = false;
        this.hoveredPaletteOp;
        this.xrCtlRight = xrCtlRight;
        this.xrCtlLeft = xrCtlLeft;
        this.stats = stats;
        this.gpuPanel = gpuPanel;
        this.palette = palette;    
        
        this.editorState = {
            partialCable: false,
            controllerState: {
                squeeze: false,
                select: false,
                a: false,
                b: false,
                thumbstick: [0, 0, 0, 0],
                thumbstickButton: false
            }

        }
        this.cables = [];
        // userActivity
        this.hover = {
            paletteOp: false,
            ui: {
                element: false,
                object: false,
                name: false
            } // element can be inlet, outlet, panel, knob, etc. object is the threeJS object. if nothing is hovered over, set both to false 
        };
        
        // this.tempMatrix = new Matrix4();
        // this.controllerToObjectMap = new Map();
        // this.objectToColorMap = new Map();
        
        this.scene.add( this.arrow );
    }

    start() {
        // create event emitter for the controller thumbsticks, which aren't available natively in threejs
        // right controller
        // this.xrCtlRight.controller.matrixWorldNeedsUpdate = true;
        let rightThumbstickAxes = new CustomEvent('rightThumbstickAxes', {
            bubbles: true, // allow parent script(s) like World.js to listen
            detail: {axes: 'touched'}
        })
        let rightThumbstickPress = new CustomEvent('rightThumbstickPress', {
            bubbles: true, // allow parent script(s) like World.js to listen
            detail: {button: 'pressed'}
        })
        let rightBPress = new CustomEvent('rightBPress', {
            bubbles: true, // allow parent script(s) like World.js to listen
            detail: {button: 'pressed'}
        })
        let rightAPress = new CustomEvent('rightAPress', {
            bubbles: true, // allow parent script(s) like World.js to listen
            detail: {button: 'pressed'}
        })


        // left controller
        let leftThumbstickAxes = new CustomEvent('leftThumbstickAxes', {
            bubbles: true, // allow parent script(s) like World.js to listen
            detail: {axes: 'touched'}
        })
        let leftThumbstickPress = new CustomEvent('leftThumbstickPress', {
            bubbles: true, // allow parent script(s) like World.js to listen
            detail: {button: 'pressed'}
        })
        let leftBPress = new CustomEvent('leftBPress', {
            bubbles: true, // allow parent script(s) like World.js to listen
            detail: {button: 'pressed'}
        })
        let leftAPress = new CustomEvent('leftAPress', {
            bubbles: true, // allow parent script(s) like World.js to listen
            detail: {button: 'pressed'}
        })

        this.renderer.setAnimationLoop(() => {
            // tell every animated object to tick forward one frame
            this.tick();

            this.stats.update();
            // XR controller custom events
            // right controller
            if(this.xrCtlRight){
                // thumbstick axes
                if(this.xrCtlRight.controller.gamepad){
                    // thumbstick axes
                    this.xrCtlRight.thumbstickAxes = this.xrCtlRight.controller.gamepad.axes
                    window.dispatchEvent(rightThumbstickAxes)

                    // thumbstick button press
                    if(this.xrCtlRight.controller.gamepad.buttons[3].pressed === true){
                        // this.xrCtlRight.thumbstickPress = true
                        window.dispatchEvent(rightThumbstickPress)
                    }

                    // B button press
                    if(this.xrCtlRight.controller.gamepad.buttons[5].pressed === true){
                        window.dispatchEvent(rightBPress)
                    }

                    // A button press
                    if(this.xrCtlRight.controller.gamepad.buttons[4].pressed === true){
                        window.dispatchEvent(rightAPress)
                    }

                }
                
            } 
            //  left controller
            else if(this.xrCtlLeft){
                
                if(this.xrCtlLeft.controller.gamepad){
                    // thumbstick axes
                    this.xrCtlLeft.thumbstickAxes = this.xrCtlLeft.controller.gamepad.axes
                    window.dispatchEvent(leftThumbstickAxes)

                    // thumbstick button press
                    if(this.xrCtlLeft.controller.gamepad.buttons[3].pressed === true){
                        // this.xrCtlLeft.thumbstickPress = true
                        window.dispatchEvent(leftThumbstickPress)
                    }

                    // B button press
                    if(this.xrCtlLeft.controller.gamepad.buttons[5].pressed === true){
                        window.dispatchEvent(leftBPress)
                    }

                    // A button press
                    if(this.xrCtlLeft.controller.gamepad.buttons[4].pressed === true){
                        window.dispatchEvent(leftAPress)
                    }
                }
            }
            

            // use HMD for picking ray
            let raycaster = new Raycaster();
            // cast a ray through the frustrum
            raycaster.setFromCamera(this.pointer, this.camera)
            // update the position of arrow
            this.arrow.setDirection(raycaster.ray.direction);

            // console.log(this.arrow, this.arrow.length)
            let intersects = raycaster.intersectObjects(this.scene.children, true)
            if(intersects.length){
                
                // for(let i = 0; i <intersects.length; i++){
                    
                if(intersects[0].object.name && intersects[0].object.name !== 'arrowHelper' && intersects[0].object.name != 'controller' && !intersects[0].object.name.includes('partial_cable') ){
                    // set arrow ray length to distance of object
                    // console.log(intersects[0].distance)
                    this.arrow.setLength(intersects[0].distance)
                    // if the palette is open, do palette stuff
                    if (this.palette.userData.active){
                        // stage this op to be added to the scene 
                        this.hover.paletteOp = intersects[0]

                        // highlight the op 
                        
                        setHoverColour(intersects[0])
                    } else {
                        console.log(intersects)
                        // palette isn't open
                        this.hover.paletteOp = false
                        // allow manipulation of scene objects
                        let worldObjectName = intersects[0].object.name;
                        let worldObjectKind = worldObjectName.split('_')[0]
                        
                        switch (worldObjectKind){
                            case "panel":
                                this.hover.ui.element = 'panel'
                                this.hover.ui.object = intersects[0]
                                this.hover.ui.name = intersects[0].object.name
                                setHoverColour(intersects[0])
                            break;

                            case "inlet":

                                // if a partial cable isn't in the hands of the controller, then create one. if one does exist, get the 2nd jack, highlight it, and stage it for completing the connection.
                                if(this.editorState.partialCable == false){
                                    // create a partial cable
                                    this.hover.ui.element = 'inlet'
                                    this.hover.ui.object = intersects[0]    
                                    this.hover.ui.name = worldObjectName                      
                                    setHoverColour(intersects[0])
                                }else {
                                    // partial cable exists, set this jack as the 2nd end and highlight it
                                    this.hover.ui.element = 'inlet'
                                    this.hover.ui.object = intersects[1]    
                                    this.hover.ui.name = worldObjectName                      
                                    setHoverColour(intersects[1])
                                }

                            break;

                            case "outlet":
                                // if a partial cable isn't in the hands of the controller, then create one. if one does exist, get the 2nd jack and complete the connection.
                                if(this.editorState.partialCable == false){
                                    this.hover.ui.element = 'outlet'
                                    this.hover.ui.object = intersects[0] 
                                    this.hover.ui.name = intersects[0].object.name                             
                                    setHoverColour(intersects[0])
                                }else {
                                    this.hover.ui.element = 'outlet'
                                    this.hover.ui.object = intersects[1] 
                                    this.hover.ui.name = intersects[1].object.name                             
                                    setHoverColour(intersects[1])
                                }

                            break;

                            case 'opLabel':
                            case 'outLabel':
                            case 'inputLabel':
                                // probably nothing to do with these... maybe make them editable eventually?
                            break
                            default: console.log('no switch case for selected object in loop', worldObjectName)
                                // reset hover attributes
                                this.hover = {
                                    paletteOp: false,
                                    ui: {
                                        element: false,
                                        object: false,
                                        name: false
                                    }
                               }
                        }
                    }
        
                }
                // }
            } else {
                // reset all hover attributes
                // if (this.hover.paletteOp){
                    this.hover = {
                        paletteOp: false,
                        ui: {
                            element: false,
                            object: false,
                            name: false
                        }
                    // }
                }
                // reset the picking arrow length
                // TODO: this is commented out because the calibration of the arrow is off. possibly related to https://stackoverflow.com/questions/49009873/why-is-raycast-direction-calculated-incorrectly-in-webxr
                ! this.arrow.setLength(100)

                
            }

            /* //! one way to pick from touch controller (not working yet)
            console.log(this.scene.children, this.raycaster)
            // cast a ray from the controller
            this.tempMatrix.identity().extractRotation( this.xrCtlRight.controller.matrixWorld );
            this.raycaster.ray.origin.setFromMatrixPosition( this.xrCtlRight.controller.matrixWorld );
            this.raycaster.ray.direction.set( 0, 0, -1 ).applyMatrix4( this.tempMatrix )

            const intersections = this.raycaster.intersectObjects( this.scene.children );
            if( intersections.length ){
                for( let i=0; i<intersections.length; i++ ){
                    if(intersections[i].object.name !== 'xrControllerRaycastBeam' && intersections[i].object.name !== 'thumbstick' && intersections[i].object.name !== 'controller'){
                        console.log(intersections[i])
                    }
                }
                // console.log( 'intersections', intersections )

            } */ //!
            /* //! way #2 to pick from touch controller (not working yet)
            const rotationMatrix = new Matrix4();
            rotationMatrix.extractRotation(this.xrCtlRight.controller.matrixWorld);
            const raycaster = new Raycaster();
            // only intersect with world elements that aren't the controllers
            // raycaster.layers.set( 1 )
            raycaster.ray.origin.setFromMatrixPosition(this.xrCtlRight.controller.matrixWorld);
            raycaster.ray.direction.set(0, 0, -1).applyMatrix4(rotationMatrix);
            // the lighting and xr controller need to be ignored. 
            // todo make a more elegant solution, as eventually more than 2 objects will be added, like a second controller, like other players' controllers, etc. 
            // let userObjects = this.scene.children.slice(2)
            const intersects = raycaster.intersectObjects(this.raycastObjects, true);
            // console.log(this.raycastObjects)
            if (intersects.length > 0){
                console.log('intersections:', intersects)

                for(let i = 0; i <intersects.length; i++){
                    
                    if(intersects[i].object.name && intersects[i].object.name !== 'xrControllerRaycastBeam' && intersects[i].object.name !== 'controller' && intersects[i].object.name !== 'thumbstick'){
                        console.log(intersects[i].object.name, intersects[i])
                        this.xrCtlRight.model.children[1].scale.z = intersects[i].distance;
                        this.selectedObject = intersects[i].object;
                        this.selectedObject.material.color = 0xff0000;
                        this.selectedObjectDistance = this.selectedObject.position.distanceTo(this.xrCtlRight.controller.position);
                        // stage this op to be added to the scene
                        this.hoveredPaletteOp = intersects[i]
                    }
                }
                
              
            }
          
            */ //!

            this.gpuPanel.startQuery();       
            this.renderer.render(this.scene, this.camera);
            this.gpuPanel.endQuery();

            // update cable positioning, if any
            if(this.cables.length > 0){
                for(let i = 0; i < this.cables.length; i++){
                    let cable = this.cables[i]
                    // is the cable connected to one or two jacks?
                    if(cable.userData.status = 'oneJack'){
                        // the 'to' position of the line (aka 2nd position) needs to be updated to the controller's position
                        // can you get the controller given the handedness?
                        let ctlr = cable.userData.controller
                        switch(ctlr){
                            case 'controller_0': // xrCtlRight
                            let controllerPosition = this.xrCtlRight.controller.position

                            // let posAttribute = new BufferAttribute(new Float32Array(controllerPosition), 2);

                            // only update the 2nd point in the cable (1st is the cable origin jack)
                            cable.geometry.attributes.position.array[3] = controllerPosition.x
                            cable.geometry.attributes.position.array[4] = controllerPosition.y
                            cable.geometry.attributes.position.array[5] = controllerPosition.z

                            
                            // cable.geometry.setAttribute('position', posAttribute);
                            
                            cable.geometry.attributes.position.needsUpdate = true;

                                // cable.geometry.attributes.position.array = this.xrCtlRight.model.position
                            break

                            case 'controller_1': // xrCtlLeft
                                cable.geometry.attributes.position.array = this.xrCtlLeft.model.position
                            break;
                        }
                        //! 
                    }
                }
            }
            function setHoverColour(nextObject){
                // first check if another element is previously hovered, if so get previous element, get its original colour, reset it to that
                if(hoverColour.length > 0){
                    let previous = hoverColour[0]
                    previous.object.material.color.set(hoverColour[1]);
                }
                // get the object's original colour
                let originalColour = nextObject.object.material.color.getHex();
                // store the object, and its original colour in the hoverColour object
                hoverColour[0] = nextObject
                hoverColour[1] = originalColour
                // set next object's colour to highlighted colour
                nextObject.object.material.color.set(objectSelectedColor)
            }

            function unsetHoverColour(){
                // this is for when a cable connection is deleted, if the select button was released when the raycast isn't pointing at anything, it doesn't remove the hover 
                // get previous object

                // reset its colour

            }
        });   
    }

    stop() {
        // sending null to setAnimationLoop stops it
        this.renderer.setAnimationLoop(null);
    }

    userSelect(){
        // user selected the 
        return this.hover;
    }


    tick() {
        // only call the getDelta function once per frame!
        const delta = clock.getDelta();
        // Code to update animations will go here
        for (const object of this.updatables){
            object.tick(delta);
        }
    }
}

export { Loop }