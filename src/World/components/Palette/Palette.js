import { Group, MathUtils } from 'three';

import { Op } from "../Op/Op.js";

import { opsList } from "./operators.js"

// ! at page load, create the menu from available operators. each operator is then available to be cloned into the scene when selected (or regenerated from an automerge doc)

class Palette extends Group {
    constructor(opName) {
        super();

        // try to get 3 ops to render in palette
        for(let i=0; i < opsList.length; i++){
            let panelOffset = 2
            if(opsList[i].inputs){
                panelOffset = Object.keys(opsList[i].inputs).length * 2
            }
            
            let row = Math.floor(i/15)
            let column = (i % 15)
            let opName = opsList[i].op
            // just work with add for now
            let op = new Op(opName);
            let opPosX = column * 3 + panelOffset
            let opPosY = row * -3
            op.position.x = opPosX
            op.position.y = opPosY
            this.add(op)
            console.log(row, column, opName, panelOffset)
            


            
                

        }


    // loop.updatables.push(op);

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

