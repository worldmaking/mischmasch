
import { XRControllerModelFactory } from 'three/examples/jsm/webxr/XRControllerModelFactory.js';
import { BufferGeometry, Vector3, Line, LineBasicMaterial, Raycaster, Matrix4,  } from 'three';

class XRController{
    constructor (renderer, handedness){
        // import model
        const controllerModelFactory = new XRControllerModelFactory()

        // create raycast beam
        const geometry = new BufferGeometry().setFromPoints([
            new Vector3(0, 0, 0),
            new Vector3(0, -45, -1)
        ]);
        const material = new LineBasicMaterial( {
            color: 0xffffff,
            linewidth: 20,
            linecap: 'round', //ignored by WebGLRenderer
            linejoin:  'round' //ignored by WebGLRenderer
        } );
        const line = new Line(geometry, material);
        line.scale.z = 100;
        line.name = 'xrControllerRaycastBeam'

        // setup controller
        this.controller = renderer.xr.getController(handedness)
        
        // this.controller.rayCastBeam = line
        
        this.controller.userData.selectPressed = false;
        this.controller.userData.selectPressedPrev = false;
        // the gamepad events are not available natively in threejs. so a little workaround to map in the gamepad data:
        this.controller.addEventListener( 'connected', (e) => {
            this.controller.gamepad = e.data.gamepad 
            this.controller.userData.handedness = e.data.handedness  
        });

        // setup custom mapping
        // this.controller.userData.buttons.b = 0;
        // this.controller.userData.buttons.a = 0;        
        
        // setup controller model
        // get hand side
        const controllerGrip = renderer.xr.getControllerGrip(handedness);
        // get model corresponding to hand side (left or right)
        const model = controllerModelFactory
        .createControllerModel( controllerGrip );
        // add model
        controllerGrip.add( model );
        // add controller model to exported controller
        this.model = controllerGrip
        // add raycast beam
        this.model.add(line)
    }
    
}

export { XRController }