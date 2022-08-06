
import { XRControllerModelFactory } from 'three/examples/jsm/webxr/XRControllerModelFactory.js';


class XRController{
    constructor (renderer, controllerNumber){
        this.controller = renderer.xr.getController(controllerNumber)
        
        // // create a geometry
        // const geometry = new BoxBufferGeometry(2, 2, 2);

        // // create a default (white) Basic material
        // const material = new MeshBasicMaterial();

        // // create a Mesh containing the geometry and material
        // const cube = new Mesh(geometry, material);

        // cube.position.set(0,0.2,0)
        // this.controller.add(cube)
        const controllerModelFactory = new XRControllerModelFactory()
        const controllerGrip = renderer.xr.getControllerGrip(controllerNumber);

        const model = controllerModelFactory
        .createControllerModel( controllerGrip );

        controllerGrip.add( model );

        this.model = controllerGrip

    }
}

export { XRController }