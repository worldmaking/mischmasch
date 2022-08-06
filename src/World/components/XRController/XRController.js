
import { XRControllerModelFactory } from 'three/examples/jsm/webxr/XRControllerModelFactory.js';
import { BufferGeometry, Vector3, Line, LineBasicMaterial } from 'three';

class XRController{
    constructor (renderer, handedness){
        // import model
        const controllerModelFactory = new XRControllerModelFactory()

        // create raycast beam
        const geometry = new BufferGeometry().setFromPoints([
            new Vector3(0, 0, 0),
            new Vector3(0, 0, -1)
        ]);
        const material = new LineBasicMaterial( {
            color: 0xffffff,
            linewidth: 20,
            linecap: 'round', //ignored by WebGLRenderer
            linejoin:  'round' //ignored by WebGLRenderer
        } );
        const line = new Line(geometry, material);
        line.scale.z = 30;

        // setup controller
        this.controller = renderer.xr.getController(handedness)
        
        this.controller.add(line)
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
    }
    // handleController(){
    //     if (controller.userData.selectPressed) {
    //         if (!controller.userData.selectPressedPrev) {
    //             // Select pressed
    //             controller.children[0].scale.z = 10;
    //             const rotationMatrix = new Matrix4();
    //             rotationMatrix.extractRotation(controller.matrixWorld);
    //             const raycaster = new Raycaster();
    //             raycaster.ray.origin.setFromMatrixPosition(controller.matrixWorld);
    //             raycaster.ray.direction.set(0, 0, -1).applyMatrix4(rotationMatrix);
    //             const intersects = raycaster.intersectObjects(this.objects);
    //             if (intersects.length > 0) {
    //                 controller.children[0].scale.z = intersects[0].distance;
    //                 this.selectedObject = intersects[0].object;
    //                 this.selectedObject.material.color = objectSelectedColor;
    //                 this.selectedObjectDistance = this.selectedObject.position.distanceTo(controller.position);
    //             }
    //             } else if (this.selectedObject) {
    //             // Move selected object so it's always the same distance from controller
    //             const moveVector = controller.getWorldDirection(new Vector3()).multiplyScalar(this.selectedObjectDistance).negate();
    //             this.selectedObject.position.copy(controller.position.clone().add(moveVector));
    //             }
    //         } else if (controller.userData.selectPressedPrev) {
    //             // Select released
    //             controller.children[0].scale.z = 10;
    //             if (this.selectedObject != null) {
    //             this.selectedObject.material.color = objectUnselectedColor;
    //             this.selectedObject = null;
    //             }
    //         }
    //     controller.userData.selectPressedPrev = controller.userData.selectPressed;
    // }
}

export { XRController }