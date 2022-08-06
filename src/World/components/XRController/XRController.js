
import { XRControllerModelFactory } from 'three/examples/jsm/webxr/XRControllerModelFactory.js';
import { BufferGeometry, Vector3, Line } from 'three';

class XRController{
    constructor (renderer, controllerNumber){
        // import model
        const controllerModelFactory = new XRControllerModelFactory()

        // create raycast beam
        const geometry = new BufferGeometry().setFromPoints([
            new Vector3(0, 0, 0),
            new Vector3(0, 0, -1)
        ]);
        const line = new Line(geometry);
        line.scale.z = 10;

        // setup controller
        this.controller = renderer.xr.getController(controllerNumber)
        this.controller.add(line)
        this.controller.userData.selectPressed = false;
        this.controller.userData.selectPressedPrev = false;
        

        // setup controller model
        // get hand side
        const controllerGrip = renderer.xr.getControllerGrip(controllerNumber);
        // get model corresponding to hand side (left or right)
        const model = controllerModelFactory
        .createControllerModel( controllerGrip );
        // add model
        controllerGrip.add( model );
        // add controller model to exported controller
        this.model = controllerGrip

    }



}

export { XRController }