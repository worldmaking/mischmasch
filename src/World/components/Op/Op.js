import { Group, MathUtils } from 'three';


import { createGeometries } from "./geometries.js";
import { createMaterials } from "./materials.js";
import { createMeshes } from "./meshes.js";
import { opsList } from "../Palette/genishOperators.js"
// todo: for now this is a rotation speed. but I bet this is how we could update the inlet and outlet LED saturation to respond to signal amplitude! use this when ready to make LED jacks: https://discoverthreejs.com/book/first-steps/animation-system/
const wheelSpeed = MathUtils.degToRad(24);

class Op extends Group {
    constructor(opName, position) {
        super();

        // retrieve the op's info
        let opProps = opsList.find(item => item.op === opName)

        // import and create the meshes
        this.meshes = createMeshes(opProps);
        this.name = opName

        // these are single items
        this.add(
            
            this.meshes.panel,
            this.meshes.jackOut,
            // this.meshes.jackOutConnector,
            this.meshes.outputLabel,
            this.meshes.opLabel
        );
        // some ops have no inlets, others have 2 or more inlets, so we need to iterate over them
        if(this.meshes.inputJacks.length > 0){
            // loop through the inlets array
            for(let i=0; i<this.meshes.inputJacks.length; i++){
                this.add(
                    this.meshes.inputJacks[i],
                    this.meshes.inputLabels[i]
                )
            }
        }

    }
    // animation tick
    tick(delta) {
        // todo: LED animation here?
        // this.meshes.bigWheel.rotation.y += wheelSpeed * delta;
        // this.meshes.smallWheelRear.rotation.y += wheelSpeed * delta;
        // this.meshes.smallWheelCenter.rotation.y += wheelSpeed * delta;
        // this.meshes.smallWheelFront.rotation.y += wheelSpeed * delta;
    }
}

export { Op }