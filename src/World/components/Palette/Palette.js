import { Group, MathUtils } from 'three';

import { Op } from "../Op/Op.js";



// ! at page load, create the menu from available operators. each operator is then available to be cloned into the scene when selected (or regenerated from an automerge doc)

function Palette(){
    // try to get 3 ops to render in palette
    // for(let i=0; i< 3; i++){
    //     let opName = opsList[i].op
    //     // we get add, mul, and mix.
    //     // add and mul have 2 inputs, mix has 3
    //     console.log(opName)
    //     if(i=0){
    //         // just work with add for now

    //     }

    // }
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

