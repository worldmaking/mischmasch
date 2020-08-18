function onSelectStart(event) {
    let controller = (event.target==controller1) ? ghostController1 : ghostController2;
    let intersections = getIntersections(controller, 0, 0, -1);
    //ghostMeshes.remove(menu);
    //console.log(intersections)
    if (intersections.length < 1) return;
    let intersection = intersections[0];

    let object = intersection.object;

   
    if (object && object.userData.moveable) {

        let kind = object.userData.kind;
        if (kind == "jack_inlet" || kind == "jack_outlet") {
            let cable = object.userData.cable;
            if (cable.dst && cable.src) {
                // send a delta:
                outgoingDeltas.push(
                    { op:"disconnect", paths:[cable.src.userData.path, cable.dst.userData.path] }
                );
            }

            if (kind == "jack_outlet") {
                cable.src = null;
            } else if (kind == "jack_inlet") {
                cable.dst = null;
            }
        }

        // TODO: Backpanel to null object for positioning purposes causes NULL for positions since the null doesnt actually have positions. Need to store the position
       if(object.userData.backPanel == true){
            object.parent.userData.moveable = object.userData.moveable;
            // object.parent.position.fromArray([object.position.x,object.position.y,object.position.z]);
            object = object.parent;
       }

        tempMatrix.getInverse(controller.matrixWorld);
        let parent = object.parent;
        object.matrix.premultiply(parent.matrixWorld);
        object.matrix.premultiply(tempMatrix);
        object.matrix.decompose(object.position, object.quaternion, object.scale);
    
        controller.userData.selected = object;
        object.userData.originalParent = parent;
        controller.add(object); 
        ghostMeshes.remove(object); //removes from previous parent

    }
    if (object && !object.userData.moveable) {

        let kind = object.userData.kind;
        if (kind == "outlet") {
            // create a new line
            // line's src == object
            // now set object = line.dstJackMesh
            let cable = new Cable(object, null);
            object = cable.dstJackMesh;
          //  object.visible = false;
            object.position.z = -0.07;
            //object.scale.set(CABLE_JACK_RADIUS, CABLE_JACK_RADIUS, CABLE_JACK_HEIGHT);
            controller.add(object); //removes from previous parent

        } else if (kind == "inlet") {
            //...
            let cable = new Cable(null, object);

            object = cable.srcJackMesh;
           // object.visible = false;
            object.position.z = -0.07;
            //object.scale.set(CABLE_JACK_RADIUS, CABLE_JACK_RADIUS, CABLE_JACK_HEIGHT);
            controller.add(object); //removes from previous parent

        }
        controller.userData.selected = object;
    }

    if(object && object.userData.menu == true && createObjFromMenu == true){
        copyModule(controller, object);
        createObjFromMenu = false;
        ghostMeshes.remove(menu);
    }

    controller.userData.rotation = controller.rotation.clone();
    object.userData.rotation = object.rotation.clone();

}

function onSelectEnd(event) {
    let controller = (event.target==controller1) ? ghostController1 : ghostController2;

    if (controller.userData.selected !== undefined) {
        let object = controller.userData.selected;
        let parent = object.userData.originalParent;
        /*if (object.userData.kind == "jack_outlet" || object.userData.kind == "jack_inlet") {
            if (parent == undefined) parent = ghostMeshes;
        } else{
            if (parent == undefined) parent = ghostMeshes; //object.parent;
        }*/
        if (parent == undefined) parent = ghostMeshes;
        controller.userData.selected = undefined;
       
        if (object && object.userData.moveable) {

            let objPos = new THREE.Vector3();
            object.getWorldPosition(objPos);
            let cable = object.userData.cable
            if (object.userData.kind == "jack_outlet" || object.userData.kind == "jack_inlet") {
                

                let intersections = getIntersectionsWithKind(object, 0, 0, -1, CABLE_JACK_HEIGHT * 2, object.userData.kind == "jack_outlet" ? "outlet" : "inlet");

                // take it out of controller-space
                object.matrix.premultiply(controller.matrixWorld);
                tempMatrix.getInverse(parent.matrixWorld);
                object.matrix.premultiply(tempMatrix);
                object.matrix.decompose(object.position, object.quaternion, object.scale);
                parent.add(object);

                if (intersections.length > 0) {
                    for(let i = 0; i < intersections.length; i++){
                        let intersection = intersections[i];
                        let o = intersection.object;

                        // if it is a jack, see if we can hook up?
                        if (object.userData.kind == "jack_outlet" && o.userData.kind == "outlet") {
                            // we have a hit! connect
                            cable.src = o;

                            // send a delta:
                            outgoingDeltas.push(
                                { op:"connect", paths:[cable.src.userData.path, cable.dst.userData.path] }
                            );

                            // destroy the cable and its objects
                            // and remove it from allCables
                            cable.destroy();
                            break;
                                    
                        } else if (object.userData.kind == "jack_inlet" && o.userData.kind == "inlet") {
                            // we have a hit! connect
                            cable.dst = o;

                            // send a delta:
                            outgoingDeltas.push(
                                { op:"connect", paths:[cable.src.userData.path, cable.dst.userData.path] }
                            );

                            // destroy the arc
                            cable.destroy();
                            break;
                        }
                    }
                }

                if(cable.src == null && cable.dst == null){
                    cable.destroy();
                }

                // console.log("~~Cables VV~~")
                // console.log(cable.dst)
                // console.log(cable.src)
                // console.log("~~~~~~~~~~~~~")
                if(cable.src == null || cable.dst == null){
                    
                    if(objPos.y < 0){
                        cable.destroy();
                        // console.log("Cable byebye");
                    }else{
                        // console.log("Cable call");
                        // object.scale.set(1,1,1);
                        // object.position.set(0, 0.3, 0);
                        //object.visible = true;
                        ghostMeshes.add(object);
                        // console.log("<<<<<ObjectCheck>>>>>");
                        // console.log(object);
                        // console.log("<<<<<----------->>>>>");
                        // console.log(object);
                    }
                }
                

            } else {
                let pos = new THREE.Vector3();
                let orient = new THREE.Quaternion();
                object.getWorldPosition(pos);
                object.getWorldQuaternion(orient);
                let path = object.userData.path;
                let fromPos = object.userData.fromPos;
                let fromOri = object.userData.fromOri;

                ghostMeshes.add(object);
                //object.visible = true;
                outgoingDeltas.push(
                    { op:"propchange",name:"pos",  path:path, from:[fromPos.x, fromPos.y, fromPos.z], to:[pos.x, pos.y, pos.z] }, 
                    { op:"propchange",  name:"orient", path:path, from:[fromOri._x, fromOri._y, fromOri._z, fromOri._w], to:[orient._x, orient._y, orient._z, orient._w] }
                );
            }
           
            if(objPos.y < 0){
                outgoingDeltas.push(
                    { op:"delnode", path:object.userData.path, kind:object.userData.name}
                );
            }
        }
        // console.log("~~~~~Ungrab~~~~~");
        // console.log(object);
        // console.log("~~~~~~~~~~~~~~~~");
    }
}

function onMenuSpawn(event){
    let controller = event.target;
    if(controller.getButtonState('trigger') == false){
        let headsetPos = new THREE.Vector3();
        camera.getWorldPosition(headsetPos);
        console.log(headsetPos);
        menu.position.fromArray([headsetPos.x, headsetPos.y + .25, headsetPos.z]);
        menu.userData.color = [Math.random(), Math.random(), Math.random(), 1];
        //menu.rotation.fromArray([0, -controller.rotation.y, 0]);
        ghostMeshes.add(menu);
        createObjFromMenu = true;
    }
    //updateInstances();
}

function onSpawn(event) {
    let controller = event.target;
    if(controller.getButtonState('thumbpad') === undefined) return;

    

    if(controller.getButtonState('trigger') == false){
        
        if(controller.userData.selected === undefined){
            let intersections = getIntersections(controller, 0, 0, -1);
            if (intersections.length > 0) {
                let intersection = intersections[0];
                let object = intersection.object;
                if(createObjFromMenu == true)
                    copyModule(controller, object);
            }
        }
    } else { 
        //console.log("Spawnning");
        if(!createObjFromMenu){
            copyModule(controller);
            //console.log("Spawnning again");
        }
    }
    ghostMeshes.remove(menu);
    createObjFromMenu = false;
}
/**
 * Used to copy a specific module
 * @param {controller} controller - Vive Controller
 * @param {object} object - Object to copy (OPTIONAL: default is controller.userData.selected)
 */
function copyModule(controller, object = undefined){
    if(object == undefined){
        object = controller.userData.selected;
    }
    //Should put this in own function relPosController()??
    let pos = new THREE.Vector3();
    let orient = new THREE.Quaternion();
    controller.getWorldPosition(pos);
    controller.getWorldQuaternion(orient);

    // adjust spawn location:
    let tilt = new THREE.Quaternion();
    tilt.setFromAxisAngle(new THREE.Vector3(1., 0., 0.), -0.25);
    orient.multiply(tilt);
    let rel = new THREE.Vector3(-generic_geometry.parameters.width/2, generic_geometry.parameters.height*1.2, -.1);
    pos.add(rel.applyQuaternion(orient));

    let module_names = Object.keys(module_constructors)

    let opname, ctor;
    
    //object = getContainingModule(object);
    //object = object.parent;
    


    //TODO: Menu objects will disapear from the menu when duplicated, need to fix this.
    for(let i in menuNames){
   
        if(module_names[i] == object.userData.kind){
            opname = module_names[i];
            ctor = module_constructors[opname];

        }

        if(operator_names[i] == object.userData.kind){
            opname = operator_names[i];
            ctor = operator_constructors[opname];
        }

        // if(ctor == undefined){
        //     opname = module_names[0];
        //     ctor = module_constructors[opname];
        // }
    }

    let path = gensym(opname);
    let deltas = ctor(path);

    console.log("Copy module");

    deltas[0].pos = [pos.x, pos.y, pos.z];
    deltas[0].orient = [orient._x,orient._y, orient._z, orient._w];
    outgoingDeltas = outgoingDeltas.concat(deltas);
}

function makeMenu(){
    menuNames = [].concat(module_names); //["sample_and_hold", "freevoib", "shifter", "knob", "lfo", "vco", "vca", "comparator", "outs"];

    for (let i=0; menuNames.length < 48; i++) {
        menuNames.push(operator_names[i])
    }

    
    let nrows = 3;
    let names_per_row = Math.ceil(menuNames.length / nrows);
    let i = 0;
    for (let row = 0; row < nrows; row++) {
        for(let col = 0; col < names_per_row && i < menuNames.length; col++, i++){
            let name = menuNames[i];
            let theta = col * (2 * Math.PI) / names_per_row;
            let r = .5;
            let x = r * Math.sin(theta);
            let z = r * Math.cos(theta);
            //console.log(i, name);
            let y = -.2 * (row + 1);
    
            let e = new THREE.Euler(0, theta + Math.PI, 0);
            let q = new THREE.Quaternion();
            q.setFromEuler(e);
    
            let deltas = generateNewModule([x, y, z], [q._x, q._y, q._z, q._w], name);

            clientSideDeltas(deltas);
            touched = false;
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

function highlightNlet(controller){
    if (controller.userData.selected !== undefined) {
        let object = controller.userData.selected;

        if (object && object.userData.moveable) {
            if (object.userData.kind == "jack_outlet" || object.userData.kind == "jack_inlet") {

                let intersections = getIntersectionsWithKind(object, 0, 0, -1, CABLE_JACK_HEIGHT * 2, object.userData.kind == "jack_outlet" ? "outlet" : "inlet");

                if (intersections.length > 0) {
                    let intersection = intersections[0];
                    let o = intersection.object;


                    // if it is a jack, see if we can hook up?
                    if ((object.userData.kind == "jack_outlet" && o.userData.kind == "outlet")||(object.userData.kind == "jack_inlet" && o.userData.kind == "inlet")) {
                        if(o.userData.color[0] > 0){
                            object.userData.color[0] = 3.;
                        }
                        if(object.userData.color[1] > 0){
                            object.userData.color[1] = 3.;
                        }
                        if(object.userData.color[2] > 0){
                            object.userData.color[2] = 3.;
                        }
                    } else {
                        if(object.userData.color[0] > 0){
                            object.userData.color[0] = 1.;
                        }
                        if(object.userData.color[1] > 0){
                            object.userData.color[1] = 1.;
                        }
                        if(object.userData.color[2] > 0){
                            object.userData.color[2] = 1.;
                        }
                    }
                }
            }
        }
    }
}

function getIntersections(controller, x, y, z, offset =0) {
    tempMatrix.identity().extractRotation(controller.matrixWorld);
    let origin = new THREE.Vector3(0, 0, offset).applyMatrix4(tempMatrix);
    raycaster.ray.origin.setFromMatrixPosition(controller.matrixWorld).add(origin);
    raycaster.ray.direction.set(x, y, z).applyMatrix4(tempMatrix);
    // argument here is just any old array of objects
    // 2nd arg is recursive (recursive breaks grabbing)

   
    let intersections = raycaster.intersectObjects(ghostMeshes.children, true);
    // let intersections1 = raycaster.intersectObjects(ghostMeshes.children, true);
    // //console.log(intersections1)
    // for(let i =0; i < intersections1.length; i++){
    //     intersections.push(intersections1[i]);

    // }

    while (intersections.length > 1){ 
        intersections.pop();
    } 
    //console.log(intersections.length)

    return intersections;
    
}

function getIntersectionsWithKind(controller, x, y, z, offset =0, kind) {
    tempMatrix.identity().extractRotation(controller.matrixWorld);
    let origin = new THREE.Vector3(0, 0, offset).applyMatrix4(tempMatrix);
    raycaster.ray.origin.setFromMatrixPosition(controller.matrixWorld).add(origin);
    raycaster.ray.direction.set(x, y, z).applyMatrix4(tempMatrix);
    // argument here is just any old array of objects
    // 2nd arg is recursive (recursive breaks grabbing)

    //let intersections = raycaster.intersectObjects(ghostMeshes.children, true);
    //let intersections = raycaster.intersectObjects(world.children, true);
    let intersections = raycaster.intersectObjects(ghostMeshes.children, true);
    // let intersections1 = raycaster.intersectObjects(ghostMeshes.children, true);

    // for(let i =0; i < intersections1.length; i++){
    //     intersections.push(intersections1[i]);
    // }


    while (intersections.length > 1 && kind !== intersections[0].object.userData.kind) intersections.pop();
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

    if(controller == controller1){
        controller = ghostController1;
    }else{
        controller = ghostController2;
    }

    if (controller.userData.selected) {
        let object = controller.userData.selected;
        // if what we have selected is a jack,
        // then do ray intersection as usual
        // if ray target is inlet/outlet (appropriately)
        // locate jack at ray target

        if (object.userData.moveable || (object.userData.initChild !== undefined && object.userData.initChild.userData.moveable)) {
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
                
                // if (world.getObjectByName("uiLine") !== undefined){
                //     uiLine.geometry.vertices[0] = 0;
                //     uiLine.geometry.vertices[1] = 0;
                //     uiLine.geometry.verticesNeedUpdate = true;
                   
                //     line.scale.z = getControllerLineLength;
                // }         
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

                // if(world.getObjectByName("uiLine") !== undefined){
                //     uiLine.geometry.vertices[0] = controllerPos;
                //     uiLine.geometry.vertices[1] = objectPos;
                //     uiLine.geometry.verticesNeedUpdate = true;

                //     line.scale.z = 0;
                // }
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