import { Clock, Vector3, Matrix4, Raycaster, Color } from 'three';
const clock = new Clock();

const objectUnselectedColor = new Color(0x5853e6);
const objectSelectedColor = new Color(0xf0520a);
class Loop {
    constructor(camera, scene, renderer, pointer, xrCtlRight, xrCtlLeft, stats, gpuPanel) {
        this.camera = camera;
        this.scene = scene;
        this.renderer = renderer;
        this.updatables = [] // list to hold animated objects //! this might need to reference the automerge document eventually?
        this.pointer = pointer;
        // this.raycaster = new Raycaster;
        this.hoveredPaletteOp;
        this.xrCtlRight = xrCtlRight;
        this.xrCtlLeft = xrCtlLeft;
        this.stats = stats;
        this.gpuPanel = gpuPanel;
        this.raycastObjects = [];
        
    }

    start() {
        // create event emitter for the controller thumbsticks, which aren't available natively in threejs
        // right controller
        this.xrCtlRight.controller.matrixWorldNeedsUpdate = true;
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
            const intersects = raycaster.intersectObjects(this.raycastObjects);
            console.log(this.raycastObjects)
            if (intersects.length > 0){
                console.log(intersects)

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
          
            

            
            // const rotationMatrix = new Matrix4();
            // let ctrlMatrixWorld = this.xrCtlRight.controller.matrixWorld
            // rotationMatrix.extractRotation(ctrlMatrixWorld);
            // this.raycaster.ray.origin.setFromMatrixPosition(ctrlMatrixWorld);
            // this.raycaster.ray.direction.set(0, -35, -1).applyMatrix4(rotationMatrix);
            /* 
            let rotation = this.xrCtlRight.controller.rotation
            let origin = this.xrCtlRight.controller.position
            
            let direction = new Vector3( rotation._x, rotation._y, rotation._z ) //.normalize()
            this.raycaster.set( origin, rotation )
            this.raycaster.name = 'controller'

            // calculate objects intersecting the picking ray
            const intersects = this.raycaster.intersectObjects( this.scene.children );
            console.log(intersects.slice(2))
            
            for ( let i = 0; i < intersects.length; i ++ ) {
                if(intersects[i].object.name && (intersects[i].object.name == 'xrControllerRaycastBeam' || intersects[i].object.name == 'controller' || intersects[i].object.name == 'thumbstick' || intersects[i].object.name == 'trigger')){
                    // ignore the raycast beam
                } else if(intersects[i].object.name.split('_')[0] === 'cable'){
                    // intersected with a cable. leaving this here in case we want to use this at some point...
                    console.log('cable intersected')
                } else {
                    console.log('unhandled raycast intersection. see Loop.js:', intersects[i])
                    
                    if(this.scene.children.some(element => element.name === 'Palette')){
                        // update the picking ray with the controller this.raycaster position and rotation
                        this.hoveredPaletteOp = intersects[i]
                        intersects[ i ].object.material.color.set( 0xff0000 );
                        
                    }
              
                }


            }
            
            */ 

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