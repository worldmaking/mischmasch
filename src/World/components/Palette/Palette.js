import { Group, MathUtils } from 'three';

import { Op } from "../Op/Op.js";

import { opsList } from "./genishOperators.js"

// at page load, create the menu from available operators. each operator is then available to be cloned into the scene when selected (or regenerated from an automerge doc)

class Palette extends Group {
    constructor(cameraPosition) {
        super();
        let middleRow = Math.floor(opsList.length / 15 / 2)
        // try to get 3 ops to render in palette
        for(let i=0; i < opsList.length; i++){
            let panelOffset = 2
            if(opsList[i].inputs && opsList[i].inputs.length > 0){
                panelOffset = Object.keys(opsList[i].inputs).length * 2
            }
            
            let row = Math.floor(i/10)
            let opPosY = (row * -3) - cameraPosition.y
            let column = (i % 10)
            
            let opName = opsList[i].op
            let op = new Op(opName);
            let opPosX = column * 3 + panelOffset
            
            op.position.x = opPosX
            op.position.y = opPosY
            op.position.z = cameraPosition.z - 50
                
            op.userData.kind = 'op'
            this.add(op)       
        }

        this.name = 'Palette'
        this.userData.active = false;
    // loop.updatables.push(op);

    }
}

export { Palette }

// class Palette extends Group {
//     constructor() {
//         super();
//         // import and create the meshes
//         // this.meshes = createMeshes();
    
//         // this.add(
//         //     // this.meshes.nose,
//         //     this.meshes.panel,
//         //     this.meshes.jackIn,
//         //     this.meshes.jackOut
//         //     // this.meshes.chimney,
//         //     // this.meshes.smallWheelRear,
//         //     // this.meshes.smallWheelCenter,
//         //     // this.meshes.smallWheelFront,
//         //     // this.meshes.bigWheel
//         // );
//     }

//     // loop through operators and make the menu

//     // animation tick
//     tick(delta) {
//         // this.meshes.bigWheel.rotation.y += wheelSpeed * delta;
//         // this.meshes.smallWheelRear.rotation.y += wheelSpeed * delta;
//         // this.meshes.smallWheelCenter.rotation.y += wheelSpeed * delta;
//         // this.meshes.smallWheelFront.rotation.y += wheelSpeed * delta;
//     }
// }

