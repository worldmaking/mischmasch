import { Clock } from 'three';
const clock = new Clock();
import { Collisions } from './Collisions.js'
import { Patching } from './Patching.js'

class Loop {
    constructor(camera, scene, renderer, pointer, xrCtlRight, xrCtlLeft, stats, gpuPanel, palette, userSettings, getIntersections, intersectObjects, cleanIntersected, controller1, synth, floor, editor) {
        this.camera = camera;
        this.scene = scene;
        this.synth = synth;
        this.renderer = renderer;
        this.updatables = [] // list to hold animated objects //! this might need to reference the automerge document eventually?
        this.pointer = pointer;
        this.userSettings = userSettings;
        
        this.xrCtlRight = xrCtlRight;
        this.xrCtlLeft = xrCtlLeft;
        this.stats = stats;
        this.gpuPanel = gpuPanel;
        this.palette = palette;    
        
        //controller intersection functions from world.js
        this.getIntersections = getIntersections
        this.intersectObjects = intersectObjects
        this.cleanIntersected = cleanIntersected
        this.controller1 = controller1

        this.editor = editor;
        this.cables = [];
        this.patching = new Patching(this.cables, this.xrCtlRight, this.xrCtlLeft, this.editor, this.userSettings, this.synth, this.controller1)
        this.collisions = new Collisions(this.editor.state, this.scene, this.pointer, this.camera, this.palette, this.patching, this.xrCtlRight, this.xrCtlLeft, this.synth);
        this.patching.arrow = this.collisions.arrow // pass the arrowhelper into patching for module movement

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

            // controller intersections
            this.cleanIntersected()
            // this.getIntersections
            this.intersectObjects(this.controller1)
            
            this.stats.update();
            // XR controller custom events
            if(this.controller1.gamepad){
                this.editor.state.controller_0.thumbstick = this.controller1.gamepad.axes
             
            }

            // update cable positioning, if any
            this.patching.cablePosition(this.cables)

            // update op positioning, if needed
            this.patching.opPosition()

            // check for object collisions
            // this.hover = this.collisions.detect()
            // right controller


            // if(this.xrCtlRight){
            //     // thumbstick axes
            //     if(this.xrCtlRight.controller.gamepad){
            //         // thumbstick axes
            //         // this.xrCtlRight.thumbstickAxes = this.xrCtlRight.controller.gamepad.axes
            //         window.dispatchEvent(rightThumbstickAxes)
            //         this.editor.state.controller_0.thumbstick = this.xrCtlRight.controller.gamepad.axes

            //         // thumbstick button press
            //         if(this.xrCtlRight.controller.gamepad.buttons[3].pressed === true){
            //             // this.xrCtlRight.thumbstickPress = true
            //             window.dispatchEvent(rightThumbstickPress)
            //         }

            //         // B button press
            //         if(this.xrCtlRight.controller.gamepad.buttons[5].pressed === true){
            //             window.dispatchEvent(rightBPress)
            //         }

            //         // A button press
            //         if(this.xrCtlRight.controller.gamepad.buttons[4].pressed === true){
            //             window.dispatchEvent(rightAPress)
            //         }

            //     }
                
            // } 
            //  left controller
            // else if(this.xrCtlLeft){
                
            //     if(this.xrCtlLeft.controller.gamepad){
            //         // thumbstick axes
            //         this.editor.state.leftControllerState.thumbstick = this.xrCtlLeft.controller.gamepad.axes

            //         // this.xrCtlLeft.thumbstickAxes = this.xrCtlLeft.controller.gamepad.axes
            //         window.dispatchEvent(leftThumbstickAxes)


            //         // thumbstick button press
            //         if(this.xrCtlLeft.controller.gamepad.buttons[3].pressed === true){
            //             // this.xrCtlLeft.thumbstickPress = true
            //             window.dispatchEvent(leftThumbstickPress)
            //         }

            //         // B button press
            //         if(this.xrCtlLeft.controller.gamepad.buttons[5].pressed === true){
            //             window.dispatchEvent(leftBPress)
            //         }

            //         // A button press
            //         if(this.xrCtlLeft.controller.gamepad.buttons[4].pressed === true){
            //             window.dispatchEvent(leftAPress)
            //         }
            //     }
            // }          

           
            this.gpuPanel.startQuery();       
            this.renderer.render(this.scene, this.camera);
            this.gpuPanel.endQuery();


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