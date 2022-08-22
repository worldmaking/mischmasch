import { Clock } from 'three';
const clock = new Clock();
import { Collisions } from './Collisions.js'
import { Patching } from './Patching.js'

class Loop {
    constructor(camera, scene, renderer, pointer, xrCtlRight, xrCtlLeft, stats, gpuPanel, palette) {
        this.camera = camera;
        this.scene = scene;
        this.renderer = renderer;
        this.updatables = [] // list to hold animated objects //! this might need to reference the automerge document eventually?
        this.pointer = pointer;
        
        
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
        this.patching = new Patching(this.cables, this.xrCtlRight, this.xrCtlLeft)
        this.collisions = new Collisions(this.editorState, this.scene, this.pointer, this.camera, this.palette);

        this.hover = this.collisions.hover
        
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
            // check for object collisions
            this.hover = this.collisions.detect()
           
            this.gpuPanel.startQuery();       
            this.renderer.render(this.scene, this.camera);
            this.gpuPanel.endQuery();

            // update cable positioning, if any
            this.patching.cablePosition(this.cables)
        });   
    }
    stop() {
        // sending null to setAnimationLoop stops it
        this.renderer.setAnimationLoop(null);
    }
    userSelect(){
        // user selected the 
        return this.collisions.hover.state;
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