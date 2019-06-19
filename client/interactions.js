function onSelectStart(event) {
    let controller = event.target;
    let intersections = getIntersections(controller, 0, 0, -1);
    if (intersections.length < 1) return;
    let intersection = intersections[0];

    let object = intersection.object.parent;
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

    let targetPos = new THREE.Vector3();
    let controllerPos = new THREE.Vector3();
    controller.getWorldPosition(controllerPos);
    
}