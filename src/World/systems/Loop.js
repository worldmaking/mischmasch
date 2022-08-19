import { Clock, Vector3, Matrix4, Raycaster, Color, ArrowHelper } from 'three';
const clock = new Clock();

const objectUnselectedColor = new Color(0x5853e6);
const objectSelectedColor = new Color(0xf0520a);
class Loop {
    constructor(camera, scene, renderer, pointer, xrCtlRight, xrCtlLeft, stats, gpuPanel, palette) {
        this.camera = camera;
        this.scene = scene;
        this.renderer = renderer;
        this.updatables = [] // list to hold animated objects //! this might need to reference the automerge document eventually?
        this.pointer = pointer;
        this.raycaster = new Raycaster();
        this.arrow = new ArrowHelper( this.raycaster.ray.direction, this.raycaster.ray.origin, 60, Math.random() * 0xffffff ) // for the hmd raycaster
        this.arrow.name = 'arrowHelper'
        this.hoveredPaletteOp;
        this.xrCtlRight = xrCtlRight;
        this.xrCtlLeft = xrCtlLeft;
        this.stats = stats;
        this.gpuPanel = gpuPanel;
        this.palette = palette;        
        // this.tempMatrix = new Matrix4();
        // this.controllerToObjectMap = new Map();
        // this.objectToColorMap = new Map();
        
        this.scene.add( this.arrow )
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
            let intersects = raycaster.intersectObjects(this.scene.children)
            if(intersects.length){

                for(let i = 0; i <intersects.length; i++){
                    
                    if(intersects[i].object.name && intersects[i].object.name !== 'arrowHelper' ){
                        // set arrow ray length to distance of object
                        this.arrow.setLength(intersects[i].distance)
                        // if the palette is open, do palette stuff
                        if (this.palette.userData.active){
                            // stage this op to be added to the scene 
                            this.hoveredPaletteOp = intersects[i]
                        } else {
                            // palette isn't open, allow manipulation of scene objects
                            let worldObjectName = intersects[i].object.name;
                            let worldObjectKind = worldObjectName.split('_')[0]
                            switch(worldObjectKind){
                                case "panel":
                                    console.log('panel', intersects[i])
                                break;

                                case "inlet":
                                    console.log('inlet', worldObjectName)
                                break;

                                case "outlet":
                                    console.log('outlet', worldObjectName)
                                break;

                                default: console.log('no switch case', worldObjectName)
                            }
                        }
            
                    }
                }
            }else {
                // reset the picking arrow length
                // TODO: this is commented out because the calibration of the arrow is off. possibly related to https://stackoverflow.com/questions/49009873/why-is-raycast-direction-calculated-incorrectly-in-webxr
                //! this.arrow.setLength(100)

                
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
        });   
    }

    stop() {
        // sending null to setAnimationLoop stops it
        this.renderer.setAnimationLoop(null);
    }

    paletteHover(){
        return this.hoveredPaletteOp;
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