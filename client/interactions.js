function onSelectStart(event) {
    let controller = event.target;
    let intersections = getIntersections(controller, 0, 0, -1);
    if (intersections.length < 1) return;
    let intersection = intersections[0];
    let object = intersection.object;

    if(object.userData.moveable == true){
        object.parent.userData.initChild = object;
        object = object.parent;
    }
   
    if (object) {
        tempMatrix.getInverse(controller.matrixWorld);
        let parent = object.parent;
        object.matrix.premultiply(parent.matrixWorld);
        object.matrix.premultiply(tempMatrix);
        object.matrix.decompose(object.position, object.quaternion, object.scale);
        
        controller.userData.selected = object;
        object.userData.originalParent = parent;
        object.visible = false;
        controller.add(object); //removes from previous parent
        instMeshes.remove(object);
        if(controller == controller1){
            grabbingC1 = true;
        }else{
            grabbingC2 = true;
        }
    }

    

    controller.userData.rotation = controller.rotation.clone();
    object.userData.rotation = object.rotation.clone();
   

}

function onSelectEnd(event) {
    let controller = event.target;
    if(controller == controller1){
        grabbingC1 = false;
    }else{
        grabbingC2 = false;
    }
    if (controller.userData.selected !== undefined) {
        let object = controller.userData.selected;
        let parent = object.userData.originalParent;
        if (parent == undefined) parent = instMeshes; //object.parent;
        controller.userData.selected = undefined;
       
        if (object) {
            let objPos = new THREE.Vector3();
            object.getWorldPosition(objPos);
            let pos = new THREE.Vector3();
            let orient = new THREE.Quaternion();
            
            object.getWorldPosition(pos);
            object.getWorldQuaternion(orient);
            let path = object.userData.path;
            let fromPos = object.userData.fromPos;
            let fromOri = object.userData.fromOri;
          
            instMeshes.add(object);
            object.visible = true;
            outgoingDeltas.push(
                { op:"propchange",name:"pos",  path:path, from:[fromPos.x, fromPos.y, fromPos.z], to:[pos.x, pos.y, pos.z] }, 
                { op:"propchange",  name:"orient", path:path, from:[fromOri._x, fromOri._y, fromOri._z, fromOri._w], to:[orient._x, orient._y, orient._z, orient._w] }
            );

           
            if(objPos.y < 0){
                outgoingDeltas.push(
                    { op:"delnode", path:object.userData.path, kind:object.userData.name}
                );
            }
        }
    }
}

//Generates a new Module inside the radial Menu (Honestly need to probably refarctor this so it isn't so redundant to other code)
function generateNewModule(pos, orient, name){
    //let module_names = Object.keys(module_constructors)
    let ctor = module_constructors[name];
    if (ctor == undefined) ctor = operator_constructors[name]
    // for(let j in operator_names){

    //     if(operator_names[j] == object.userData.kind){
    //         opname = operator_names[i];
    //         ctor = operator_constructors[opname];
    //     }
    // }

    let path = gensym(name);
    let deltas = ctor(path);
    deltas[0].pos = pos;
    deltas[0].orient = orient;
    deltas[0].menu = true;
    for(let i in deltas) {
        deltas[i].interactable = false;
    }

    return deltas;
}

function getIntersections(controller, x, y, z, offset =0) {
    tempMatrix.identity().extractRotation(controller.matrixWorld);
    let origin = new THREE.Vector3(0, 0, offset).applyMatrix4(tempMatrix);
    raycaster.ray.origin.setFromMatrixPosition(controller.matrixWorld).add(origin);
    raycaster.ray.direction.set(x, y, z).applyMatrix4(tempMatrix);
    // argument here is just any old array of objects
    // 2nd arg is recursive (recursive breaks grabbing)
    let intersections = raycaster.intersectObjects(instMeshes.children, true);

    while (intersections.length > 1 /*&& !intersections[0].object.userData.selectable*/){ 
        intersections.shift();
        //console.log(intersections)
    }
    return intersections;
    
}

function intersectObjects(controller) {
    // Do not highlight when already selected
    if (controller.userData.selected !== undefined) return;
    let line = controller.getObjectByName("line");
    let intersections = getIntersections(controller, 0, 0, -1);
    
   // console.log(intersections)
    if (intersections.length > 0) {
        let intersection = intersections[0];
        let object = intersection.object;

        intersected.push(object);
        line.scale.z = intersection.distance;
    } else {
        line.scale.z = 1;
    }
}

function cleanIntersected() {
    while (intersected.length) {
        let object = intersected.pop();
    }
}

function controllerGamepadControls(controller){
    //console.log(controller)
    let touched = false;
    let gamepad = controller.getGamepad();
    if (gamepad) {
        let button0 = gamepad.buttons[0];
        // consider the thumbpad state:
        if (button0.touched) {
            if (!controller.userData.touched) {
                controller.userData.touched = true;
                touched = true;
                //console.log("touchstart", gamepad.axes[1])
                controller.userData.thumbpadDX = 0;
                controller.userData.thumbpadDY = 0;

            } else {
                //console.log("drag", gamepad.axes[1])
                controller.userData.thumbpadDX = gamepad.axes[0] - controller.userData.thumbpadX;
                controller.userData.thumbpadDY = gamepad.axes[1] - controller.userData.thumbpadY;
            }

            controller.userData.thumbpadX = gamepad.axes[0];
            controller.userData.thumbpadY = gamepad.axes[1];


        } else if (controller.userData.touched) {
            controller.userData.touched = false;
            controller.userData.thumbpadDX = 0;
            controller.userData.thumbpadDY = 0;
            // touch release event
            //console.log("release")
        }
    }

    if (controller.userData.selected) {
        let object = controller.userData.selected;
        // if what we have selected is a jack,
        // then do ray intersection as usual
        // if ray target is inlet/outlet (appropriately)
        // locate jack at ray target
        if(object.userData.initChild){
            object.userData.moveable = object.userData.initChild.userData.moveable;
        }

        if (object.userData.moveable) {
            let s = 1. + (controller.userData.thumbpadDY);
            let r = 1. + (controller.userData.thumbpadDX);
            object.position.multiplyScalar(s);
            let rot = new THREE.Vector3(object.rotation.x, object.rotation.y, object.rotation.z);
            rot.multiplyScalar(r);
            //object.rotation.x = rot.x;
            object.rotation.y = rot.y;
            //object.rotation.z = rot.z;
            //object.quaternion.multiply(r);

        } else if (object.userData.turnable) {
            
            let controllerPos = new THREE.Vector3();
            let objectPos = new THREE.Vector3();
            controller.getWorldPosition(controllerPos);
            object.getWorldPosition(objectPos); 
            let line = controller.getObjectByName("line");

            let value = 0;
            let dist = controllerPos.distanceTo(objectPos);

            if (dist < KNOB_TWIST_DISTANCE) {
                //controller.rotation.z += object.userData.rotation._z;
                //object.rotation.z = (controller.rotation.z - controller.userData.rotation._z);
                //console.log(object, controller)
                let angle = object.userData.rotation._z + (controller.rotation.z - controller.userData.rotation._z);

                // angle should be in range -PI to PI
                angle = wrap(angle + Math.PI, Math.PI * 2) - Math.PI;

                if (angle < KNOB_SWEEP) angle = KNOB_SWEEP;
                if (angle > -KNOB_SWEEP) angle = -KNOB_SWEEP;
                // turn angle back into a 0..1 value:
                value = (((angle / KNOB_SWEEP) + 1)/2);
                
                if (world.getObjectByName("uiLine") !== undefined){
                    uiLine.geometry.vertices[0] = 0;
                    uiLine.geometry.vertices[1] = 0;
                    uiLine.geometry.verticesNeedUpdate = true;
                   
                    line.scale.z = getControllerLineLength;
                }         
            } else if (dist > KNOB_SWING_DISTANCE) {
                //put controller into knob space using matrix
                //set angle to the knob
                //take controller out of knob space
                
                let controllerPos = new THREE.Vector3()
                controller.getWorldPosition(controllerPos)
               

                let knobPos = new THREE.Vector3()
                object.getWorldPosition(knobPos);

                let relPos = new THREE.Vector3();
                relPos.subVectors(controllerPos, knobPos);

                let moduleQuat = new THREE.Quaternion();
                moduleQuat.copy(object.parent.quaternion)
                moduleQuat.inverse();

                // now rotate this into the knob's perspective:
                relPos.applyQuaternion(moduleQuat);
                // //get controller angle via x and y
                // (This ranges from -PI to +PI)
                let angle = Math.atan2(-relPos.x, relPos.y);
                // map this to a 0..1 range:

                if (angle < KNOB_SWEEP) angle = KNOB_SWEEP;
                if (angle > -KNOB_SWEEP) angle = -KNOB_SWEEP;
                // turn angle back into a 0..1 value:
                value = (((angle / KNOB_SWEEP) + 1)/2);

                // if (dist < KNOB_TWIST_DISTANCE) {
                //     let factor = (dist - KNOB_SWING_DISTANCE) / (KNOB_TWIST_DISTANCE - KNOB_SWING_DISTANCE);
                   
                //     value = value + factor * (bigValue - value);

                // } else {
                //     value = bigValue;
                // }

                if(world.getObjectByName("uiLine") !== undefined){
                    uiLine.geometry.vertices[0] = controllerPos;
                    uiLine.geometry.vertices[1] = objectPos;
                    uiLine.geometry.verticesNeedUpdate = true;

                    line.scale.z = 0;
                }
                object.userData.rotation = object.rotation.clone();
                
            }
            

            

            //console.log("prev value", object.userData.value, "New Value", value)
            outgoingDeltas.push(
                { op:"propchange", path: object.userData.path, name:"value", from: object.userData.value, to: value });

            // TODO: send delta with this value
            // TODO: enact delta by mapping value back to angular range:

        } else if (object.userData.slideable){

  
                let controllerPos = new THREE.Vector3();
                controller1.getWorldPosition(controllerPos);
    
                let nswitchPos = new THREE.Vector3()
                object.parent.getWorldPosition(nswitchPos);
    
                let relPos = new THREE.Vector3();
                relPos.subVectors(controllerPos, nswitchPos);

                let moduleQuat = new THREE.Quaternion();
                moduleQuat.copy(object.parent.quaternion)
                moduleQuat.inverse();

                relPos.applyQuaternion(moduleQuat);

                let value = 0;
                if( relPos.y < -0.01){
                   value = 2;
                 } else if( relPos.y > 0.015){
                    value = 0;
                 } else {
                    value = 1;
                }
                // write(controllerPos.angleTo(nswitchPos))
                // if( controllerPos.angleTo(nswitchPos) < 0 && relPos.y < -0.01){
                //     value = 2;
                //   } else if( controllerPos.angleTo(nswitchPos) > 0.015){
                //      value = 0;
                //   } else {
                //      value = 1;
                //  }

                outgoingDeltas.push(
                    { op:"propchange", path: object.parent.userData.path, name:"value", from: object.parent.userData.value, to: value + 1 });
        }

    } else {
        let targetPos = new THREE.Vector3();
        let controllerPos = new THREE.Vector3();
        controller.getWorldPosition(controllerPos);

        // for (let name in allNodes) {
        //     let target = allNodes[name];
        //     target.getWorldPosition(targetPos);

        //     let d = targetPos.distanceTo(controllerPos);
        //     if (d < CONTROLLER_HIT_DISTANCE) {
        //         console.log(name, target.userData.kind);

        //         // if kind is outlet/inlet, start a patch coord
        //     }
        // }
    }
    
}