import { Group, MathUtils } from 'three';


import { createGeometries } from "./geometries.js";
import { createMaterials } from "./materials.js";
import { createMeshes } from "./meshes.js";

// todo: for now this is a rotation speed. but I bet this is how we could update the inlet and outlet LED saturation to respond to signal amplitude! use this when ready to make LED jacks: https://discoverthreejs.com/book/first-steps/animation-system/
const wheelSpeed = MathUtils.degToRad(24);

class Op extends Group {
    constructor() {
        super();
        // import and create the meshes
        this.meshes = createMeshes();
    
        this.add(
            // this.meshes.nose,
            this.meshes.panel,
            this.meshes.jackIn,
            this.meshes.jackOut
            // this.meshes.chimney,
            // this.meshes.smallWheelRear,
            // this.meshes.smallWheelCenter,
            // this.meshes.smallWheelFront,
            // this.meshes.bigWheel
        );
    }
    // animation tick
    tick(delta) {
        // this.meshes.bigWheel.rotation.y += wheelSpeed * delta;
        // this.meshes.smallWheelRear.rotation.y += wheelSpeed * delta;
        // this.meshes.smallWheelCenter.rotation.y += wheelSpeed * delta;
        // this.meshes.smallWheelFront.rotation.y += wheelSpeed * delta;
    }
}

export { Op }