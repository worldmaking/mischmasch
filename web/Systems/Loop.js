import { Clock } from 'three';
const clock = new Clock();
import { Collisions } from './Collisions.js'
import { Patching } from './Patching.js'

class Loop {
    constructor(camera, scene, renderer, pointer, xrCtlRight, xrCtlLeft, stats, gpuPanel, palette, userSettings, getIntersections, intersectObjects, cleanIntersected, controller_0, synth, floor, editor, patch) {
        this.camera = camera;
        this.scene = scene;
        this.synth = synth;
        this.renderer = renderer;
        this.updatables = [] // list to hold animated objects //! this might need to reference the automerge document eventually?
        this.pointer = pointer;
        
        this.xrCtlRight = xrCtlRight;
        this.xrCtlLeft = xrCtlLeft;
        this.stats = stats;
        this.gpuPanel = gpuPanel;
        this.palette = palette;    
        
        //controller intersection functions from world.js
        this.getIntersections = getIntersections
        this.intersectObjects = intersectObjects
        this.cleanIntersected = cleanIntersected
        this.controller_0 = controller_0

        this.editor = editor;
        this.editor.userSettings = userSettings
        this.patching = new Patching(this.xrCtlRight, this.xrCtlLeft, this.editor, this.synth, this.controller_0)
        this.collisions = new Collisions(this.editor.state, this.scene, this.pointer, this.camera, this.palette, this.patching, this.xrCtlRight, this.xrCtlLeft, this.synth);
        this.patching.arrow = this.collisions.arrow // pass the arrowhelper into patching for module movement
        this.patch = patch;
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
            this.intersectObjects(this.controller_0)
            
            this.stats.update();
            // XR controller custom events
            if(this.controller_0.userData.gamepad){
                this.editor.state.controller_0.thumbstick = this.controller_0.userData.gamepad.axes
             
            }

            // update cable positioning, if any
            this.patching.cablePosition()

            // update op positioning, if needed
            this.patching.opPosition()   
           
            this.gpuPanel.startQuery();       
            this.renderer.render(this.scene, this.camera);
            this.gpuPanel.endQuery();

            // check patch.dirty. if true, clear patch.scene and rebuild here from patch.state
            if (this.patch.dirty == true){
                this.patch.scene.clear()
                // rebuild from patch.document
                this.patch.rebuild()
                this.patch.dirty = false;
            }

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