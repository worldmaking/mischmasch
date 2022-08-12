import { Clock, Vector3, Matrix4, Raycaster } from 'three';

const clock = new Clock();
class Loop {
    constructor(camera, scene, renderer, pointer, xrCtlRight, xrCtlleft, stats, gpuPanel) {
        this.camera = camera;
        this.scene = scene;
        this.renderer = renderer;
        this.updatables = [] // list to hold animated objects //! this might need to reference the automerge document eventually?
        this.pointer = pointer;
        this.raycaster = new Raycaster;
        this.hoveredPaletteOp;
        this.xrCtlRight = xrCtlRight;
        this.xrCtlleft = xrCtlleft;
        this.stats = stats;
        this.gpuPanel = gpuPanel;
        
    }

    start() {
        // create event emitter for the controller thumbsticks, which aren't available natively in threejs
        let rightThumbstickAxes = new CustomEvent('rightThumbstickAxes', {
            bubbles: true, // allow parent script(s) like World.js to listen
            detail: {axes: 'touched'}
        })
        let rightThumbstickPress = new CustomEvent('rightThumbstickPress', {
            bubbles: true, // allow parent script(s) like World.js to listen
            detail: {button: 'pressed'}
        })
        
        let leftThumbstickAxes = new CustomEvent('leftThumbstickAxes', {
            bubbles: true, // allow parent script(s) like World.js to listen
            detail: {axes: 'touched'}
        })
        let leftThumbstickPress = new CustomEvent('leftThumbstickPress', {
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
                        // this.xrCtlRight.thumbstickPress = true
                        window.dispatchEvent(leftThumbstickPress)
                    }
                }
            }
            
            

            
            // const rotationMatrix = new Matrix4();
            // let ctrlMatrixWorld = this.xrCtlRight.controller.matrixWorld
            // rotationMatrix.extractRotation(ctrlMatrixWorld);
            // this.raycaster.ray.origin.setFromMatrixPosition(ctrlMatrixWorld);
            // this.raycaster.ray.direction.set(0, -35, -1).applyMatrix4(rotationMatrix);
            
            let rotation = this.xrCtlRight.controller.rotation
            let origin = this.xrCtlRight.controller.position
            
            let direction = new Vector3( rotation._x, rotation._y, rotation._z ) //.normalize()
            this.raycaster.set( origin, direction )
            this.raycaster.name = 'controller'

            // calculate objects intersecting the picking ray
            const intersects = this.raycaster.intersectObjects( this.scene.children );
            
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
            

            this.gpuPanel.startQuery();
            
            this.renderer.render(this.scene, this.camera);

            this.gpuPanel.endQuery();
            // // set right controller 'B' state
            // if(this.xrCtlRight.controller.gamepad && this.xrCtlRight.controller.gamepad.buttons[5].touched){
            //     xrCtlRight.controller.userData.buttons.b = this.xrCtlRight.controller.gamepad.buttons[5].value;
            // }
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