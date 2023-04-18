import { Group, MathUtils } from 'three';

import { createMeshes } from "./meshes.js";
import { opsList } from "../Palette/genishOperators.js"
import { systemSettings } from '../../settings/systemSettings.js'
const scale = systemSettings.UI_DEFAULT_SCALE
// todo: for now this is a rotation speed. but I bet this is how we could update the inlet and outlet LED saturation to respond to signal amplitude! use this when ready to make LED jacks: https://discoverthreejs.com/book/first-steps/animation-system/
// const wheelSpeed = MathUtils.degToRad(24);

// class Op extends Group {
    class Op{
    constructor(opName, uuid, position, quat) {
        // super();
        // retrieve the op's info
        let opProps = opsList.find(item => item.op === opName)
        this.name = opName
        this.uuid;
        // import and create the meshes
        this.meshes = createMeshes(opProps);
        
        this.op = new Group()
        this.op.name = `opGroup_${opName}` 
        this.op.uuid;
        this.op.userData = {mischmaschID: uuid}
        // these are single items
        this.op.add(
            
            this.meshes.panel,
            // this.meshes.jackOut,
            // this.meshes.jackOutConnector,
            // this.meshes.outputLabel,
            this.meshes.opLabel
        );
        let posX = position[0]
        let posY = position[1]
        let posZ = position[2]
        let quatX = quat[0]
        let quatY = quat[1]
        let quatZ = quat[2]
        let quatW = quat[3]

        this.op.position.set(posX, posY, posZ)
        this.op.quaternion.set(quatX, quatY, quatZ, quatW)
        // using the op's panel width, we can calculate the offset for the first input and output, respectively
        let panelWidth = this.meshes.panel.geometry.parameters.width
        let inputOffset = ((panelWidth / 2) * -1) + 0.5
        let outputOffset = ((panelWidth / 2) * -1) + 0.5

        // check if uuid is supplied.
        if(uuid){
            this.uuid = uuid
        }
        // some ops have no inlets, others have 2 or more inlets, so we need to iterate over them
        if(this.meshes.inputJacks.length > 0){
            // loop through the inlets array
            for(let i=0; i<this.meshes.inputJacks.length; i++){
                // set the the 1st input position to the input offset, then increment for each additional input
                this.meshes.inputJacks[i].position.x = (inputOffset * scale + i) * scale

                this.meshes.inputLabels[i].position.x = (inputOffset * scale + i) * scale
                // name every jack with the parent op's uuid
                this.meshes.inputJacks[i].name = `${this.meshes.inputJacks[i].name}_${this.uuid}`
                this.op.add(
                    this.meshes.inputJacks[i],
                    
                    this.meshes.inputLabels[i]
                )
            }
        }
        // some ops have no outlets, others have 2 or more outlets, so we need to iterate over them
        if(this.meshes.outputJacks.length > 0){
            // loop through the inlets array
            for(let i=0; i<this.meshes.outputJacks.length; i++){
                // set the the 1st output position to the output offset, then increment for each additional output
                this.meshes.outputJacks[i].position.x = (scale * outputOffset + i) * scale
                this.meshes.outputLabels[i].position.x = (scale * outputOffset + i) * scale
                // name every jack with the parent op's uuid
                this.meshes.outputJacks[i].name = `${this.meshes.outputJacks[i].name}_${this.uuid}`
                this.op.add(
                    this.meshes.outputJacks[i],
                    
                    this.meshes.outputLabels[i]
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