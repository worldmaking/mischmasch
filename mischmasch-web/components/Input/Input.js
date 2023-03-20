import { Mesh } from 'three';

import { createGeometries } from './geometries.js';
import { createMaterials } from './materials.js';
import {Text} from 'troika-three-text'
// todo: see https://www.npmjs.com/package/troika-three-text#preloading for optimizing text loading

import { Group, MathUtils } from 'three';


import { createGeometries } from "./geometries.js";
import { createMaterials } from "./materials.js";
import { createMeshes } from "./meshes.js";
import { opsList } from "../Palette/genishOperators.js"
// todo: for now this is a rotation speed. but I bet this is how we could update the inlet and outlet LED saturation to respond to signal amplitude! use this when ready to make LED jacks: https://discoverthreejs.com/book/first-steps/animation-system/
const wheelSpeed = MathUtils.degToRad(24);

class Input extends Group {
    constructor(name, genishProp, index) {
        super();

        // create the meshes for the Input: Jack, Cable Connector, Text Label
        const geometries = createGeometries();
        const materials = createMaterials();

        this = new Mesh(geometries.jack, materials.jackIn);
        // let posX = index + -0.5
        this.position.set(-0.5, 1.8, 0.2);
        this.rotation.set(1.55, 1, 0)
        this.name = `inlet_${name}_${this.uuid}`
        // each jack needs a cable connection mesh in front. 
        let cableConnector = new Mesh(geometries.cableConnector, materials.cableConnector);
        cableConnector.position.set(-0.5, 2, 0.2);
        cableConnector.rotation.set(1.55, 1, 0)
        cableConnector.name = `cableConnector_${name}_${cableConnector.uuid}`
        // add the cableConnector to the jack inlet
        this.add(cableConnector)

        // labels
        let inputLabel = new Text();
        inputLabel.text = inputName
        inputLabel.fontSize = 0.2
        inputLabel.color = 'white'
        inputLabel.anchorX = 'center'
        inputLabel.position.set(-0.5, 1.6, 0.2);
        inputLabel.rotation.set(0, 0, 0)
        this.add(inputLabel)
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

export { Input }