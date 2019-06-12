function enactDelta(delta) {
    if (Array.isArray(delta)) {
        for (let d of delta) {
            enactDelta(d);
        }
    } else {

        //console.log("enacting", delta.op)
        switch(delta.op) {
            case "propchange": {
                switch(delta.name) {
                    case "pos": {
                        enactDeltaObjectPos(delta);
                    } break;
                    case "orient": {
                        enactDeltaObjectOrient(delta);
                    } break; 
                    case "value": {
                        enactDeltaObjectValue(delta);
                    } break;
                    // handle other types, e.g. param value
                    default: {
                        console.log("unknown propchange delta kind", delta)
                    }
                }
            } break;
            case "connect": {
                enactDeltaConnect(delta);
            } break;
            case "disconnect": {
                enactDeltaDisconnect(delta);
            } break;
            case "newnode": {
                enactDeltaNewNode(delta);
            } break;
            case "delnode": {
                enactDeltaDeleteNode(delta);
            } break;
            case "repath": {
                enactDeltaRepath(delta);
            } break;
            default: {
                console.log("unknown delta kind", delta)
            }
        }
    }
}

/*
    { op:"newnode", path:"x", kind:"noise", pos:[], orient:[], ...properties }
*/
let parentInstanceID =  -1;


function enactDeltaNewNode(delta) {
    // create new object etc.

    //console.log(delta)

    //let parent = (delta.menu == true) ? menu : world;
    let parent = instMeshes;  

    // first, find parent.
    let path = delta.path;
    let name, parentpath;
    let pathlastdot = path.lastIndexOf(".")
    if (pathlastdot >= 0) {
        parentpath = path.substring(0, pathlastdot);
        name = path.substring(pathlastdot+1);
        parent = getObjectByPath(parentpath);
    } else {
    name = delta.path;
    }
    
   // console.log(path, name, parentpath, parent)
    let container;
    let labelName = delta.kind;

    // generic object:
    let material = generic_material.clone();
    material.color.set(Math.random() * 0xffffff);
    
    let outlet_material = material.clone();

    let inlet_material = material.clone();
    let knob_material = material.clone();
    let n_switch_material = material.clone();
    let n_switch_slider_material = material.clone();
    let outline_mat = outline_material.clone();
    let knob_point_material = material.clone();

    // SHADERS //

    
    switch(delta.kind){
      
        /*
        case "inlet": {
            inlet_material.blending = THREE.NormalBlending;
            container = new THREE.Mesh(inlet_geometry, inlet_material);
            container.position.fromArray([
                0, 
                0,
                generic_geometry.parameters.depth/2 - NLET_HEIGHT]);
            //Outline
            outline_mat.color.set(0x00ff00);    
            let outline = new THREE.Mesh(inlet_geometry, outline_mat);
            outline.scale.multiplyScalar(1.28);
            outline.castShadow = false;
            outline.receiveShadow = false;
            container.add(outline);

            let label = generateLabel(name, NLET_HEIGHT);
            label.position.z = 0.01;
            label.position.x = -NLET_RADIUS /2;
            container.add(label);
            
            container.userData.selectable = true;
        } break;
        case "outlet":{
            outlet_material.blending = THREE.NormalBlending;
            container = new THREE.Mesh(outlet_geometry, outlet_material);
            container.position.fromArray([
                0, 
                0,
                generic_geometry.parameters.depth/2 - NLET_HEIGHT]);

            //Outline
            outline_mat.color.set(0xff0000);    
            let outline = new THREE.Mesh(outlet_geometry, outline_mat);
            outline.scale.multiplyScalar(1.28);
            outline.castShadow = false;
            outline.receiveShadow = false;
            container.add(outline);

            let label = generateLabel(name, SMALL_KNOB_HEIGHT/2.7);
            label.position.z = 0.01;
            label.position.x = -NLET_RADIUS /2;
            container.add(label);
            container.userData.selectable = true;
        } break;
        case "large_knob": {
            container = new THREE.Mesh(large_knob_geometry, knob_material);
            //generic_geometry.parameters.width
            container.position.fromArray([
                0, 
                0,
                generic_geometry.parameters.depth/2 - LARGE_KNOB_HEIGHT]);

            knobPoint = new THREE.Mesh(knob_point_geometry, knob_point_material);
            knobPoint.position.y = LARGE_KNOB_RADIUS;
            container.add(knobPoint);
            
            let label = generateLabel(name, LARGE_KNOB_HEIGHT/2);
            label.position.z = 0.01;
            label.position.x = -LARGE_KNOB_RADIUS /2;
            container.add(label);
            container.userData.turnable = true;
            container.userData.selectable = true;
            container.userData.range = delta.range;

            let min = delta.range[0];
            let max = delta.range[1];
            let scaledValue = (delta.value - min) / (max - min);
            //scaledValue = wrap(scaledValue, 1);

            // if value == 0, angle should be -sweep
            // if value == 1, angle should be sweep 
            let derived_angle = KNOB_SWEEP * ((scaledValue*2) - 1);
            
            // set rotation of knob by this angle, and normal axis of knob:
            container.quaternion.setFromAxisAngle( new THREE.Vector3(0, 0, 1), derived_angle);
           // console.log("Initial Value", scaledValue)

        } break;
        case "small_knob": {
            container = new THREE.Mesh(small_knob_geometry, knob_material);
            container.position.fromArray([
                0, 
                0,
                generic_geometry.parameters.depth/2 - SMALL_KNOB_HEIGHT]);

            knobPoint = new THREE.Mesh(knob_point_geometry, knob_point_material);
            knobPoint.position.y = SMALL_KNOB_RADIUS;
            container.add(knobPoint);
            //Label
            let label = generateLabel(name, SMALL_KNOB_HEIGHT/2.7);
            label.position.z = 0.01;
            label.position.x = -SMALL_KNOB_RADIUS /2;
            container.add(label);

            container.userData.turnable = true;
            container.userData.selectable = true;
            container.userData.range = delta.range;
            

            let min = delta.range[0];
            let max = delta.range[1];
            let scaledValue = (delta.value - min) / (max - min);
            //scaledValue = wrap(scaledValue, 1);

            // if value == 0, angle should be -sweep
            // if value == 1, angle should be sweep 
            let derived_angle = KNOB_SWEEP * ((scaledValue*2) - 1);
            
            // set rotation of knob by this angle, and normal axis of knob:
            container.quaternion.setFromAxisAngle( new THREE.Vector3(0, 0, 1), derived_angle);

        } break;
        case "n_switch": {
            container = new THREE.Mesh(n_switch_geometry, n_switch_material);
            container.position.fromArray([
                (0 / 8) + 0.25,
                -generic_geometry.parameters.height/2 - LARGE_KNOB_HEIGHT/2, 
                generic_geometry.parameters.depth/2 - LARGE_KNOB_HEIGHT]);
            
            let switchPositions = [];
            //Draw N_SWTICH Label name itself
            // let label = generateLabel(parent.userData.name, .01);
            // label.position.y =  0;
            // label.position.z = 0;
            // container.add(label);
            if(delta.throws !== undefined){
                let y = -container.position.y / 2;
                for(let l =0; l < delta.throws.length; l++){
                    let labelN = generateLabel(delta.throws[l], .01);

                    labelN.position.y = y - container.geometry.parameters.height / 3;
                    y = labelN.position.y;
                    labelN.position.z = 0;
                    labelN.position.x = -0.01;
                    switchPositions[l] = [labelN.position.x + -0.02,
                        labelN.position.y,
                        labelN.position.z + n_switch_slider_geometry.parameters.width/2];  
                    if(delta.value !== undefined && delta.value === l){
                        n_switch_slider = new THREE.Mesh(n_switch_slider_geometry, n_switch_slider_material);
                        n_switch_slider.castShadow = true;
                        n_switch_slider.receiveShadow = true;
                        n_switch_slider.userData.slideable = true;
                        n_switch_slider.userData.selectable = true;
                        n_switch_slider.position.fromArray(switchPositions[l]);
                        container.add(n_switch_slider);

                    }
                    container.add(labelN);

                }

            }

            container.userData.positions = switchPositions;
            container.userData.selectable = false;
            container.userData.slideable = false;
        } break;
        case "group": {
            //Gonna be used for subpatching

        } break;
        */
        case "inlet": {
            // instBoxLocationAttr.setXYZ(maxInstances, 
            //     instBoxLocationAttr.array[parentInstanceID *3], 
            //     instBoxLocationAttr.array[(parentInstanceID*3)+1],  
            //     .1+instBoxLocationAttr.array[(parentInstanceID*3)+2]);

            // instBoxScaleAttr.setXYZ(maxInstances, 0.2, 0.2, 0.05);
            // instBoxColorAttr.setXYZW(maxInstances, Math.random(), Math.random(), Math.random(), 1);
            // instBoxShapeAttr.setX(maxInstances, 1.);
            // instBoxParentAttr.setX(maxInstances, parentInstanceID);
            // maxInstances++;

            container = new THREE.Mesh(boxGeom, boxMat);
            container.scale.fromArray([0.2, 0.2, 0.05]);
            container.position.fromArray([Math.random(),Math.random(),Math.random()]);
            container.userData.shape = 1.;
        } break;
        case "outlet":
        case "large_knob":
        case "small_knob":
        case "n_switch":
        case "group": break;
        default: {
            //container = new THREE.Mesh(instancedGeometry, shaderMat);
            // let label = generateLabel(labelName);
            // label.position.y = -LABEL_SIZE;
            // label.position.z += 0.01;
            // label.position.x = 0.005;
            // container.add(label);

            // container.userData.moveable = true; 
            // container.userData.selectable = true;
            // container.userData.dirty = true;
            // container.userData.isBox = true;

            // instBoxLocationAttr.setXYZ(maxInstances, Math.random()*3, Math.random()*3, Math.random()*3);
            // //instBoxOrientationAttr.setXYZ(maxInstances, Math.random(), Math.random(), Math.random(), 1);
            // instBoxScaleAttr.setXYZ(maxInstances, 0.6, 0.2, 0.05);
            // instBoxColorAttr.setXYZW(maxInstances, Math.random(), Math.random(), Math.random(), 1);
            // instBoxShapeAttr.setX(maxInstances, 0.);
            // parentInstanceID = maxInstances;
            // instBoxParentAttr.setX(maxInstances, parentInstanceID);
            // maxInstances++;
            // createLabel(labelName,  instBoxLocationAttr.array[parentInstanceID *3], 
            //     instBoxLocationAttr.array[(parentInstanceID*3)+1],  
            //     .5+instBoxLocationAttr.array[(parentInstanceID*3)+2], 0.002);

            container = new THREE.Mesh(boxGeom, boxMat);
            container.scale.fromArray([0.6, 0.2, 0.05]);
            container.position.fromArray([Math.random(),Math.random(),Math.random()])


        } break;
    }    
    // console.log(parentInstanceID)
     if(container !== undefined){
    // container.castShadow = true;
    // container.receiveShadow = true;
        container.updateMatrixWorld(true);
        container.name = name;
        container.userData.name = name;
        container.userData.path = path;
        container.userData.kind = delta.kind;
    // if(delta.value){
    //     container.userData.value = delta.value;
    // } 

    // if(delta.menu == true){
    //     container.userData.menu = delta.menu;
    //     container.scale.set(menuScaleSize, menuScaleSize, menuScaleSize);
       
    // }

    // if(delta.interactable == false){
    //     container.userData.interactable = delta.interactable;
    //     delete container.userData.moveable;
    //     delete container.userData.turnable;
    // }

    // if (delta.pos) {
    //     container.position.fromArray(delta.pos);
    //     container.userData.fromPos  = delta.pos;
    // } else {
    //     container.position = parent.position.clone();
    // }
    // if (delta.orient) {
    //     container.quaternion.fromArray(delta.orient);
    //     container.userData.fromOri  = delta.orient;
    // } else {
    //     container.quaternion = parent.quaternion.clone();
    // }
    // // add to our library of nodes:
    addObjectByPath(path, container);
    // // add to proper parent:

    parent.add(container);
  
    
    }

    
    // NOTE: not all nodes will have a pos, orient
    // e.g. outlet, knob, etc.
    // they need to find their parent and position accordingly
}

/*
    { op:"delnode", path:"x", kind:"noise", pos:[], orient:[], ...properties }
*/
function enactDeltaDeleteNode(delta) {
    // find matching object & destroy
    // (first destroy any cables connected to it)
    
    // first, find parent.

    let kind = delta.kind;

    //Removing all Cables that are attached to this node

    let deleteCable = allCables.filter(cable => {
        return (cable.src != null && cable.src.parent.name == kind) || (cable.dst != null && cable.dst.parent.name == kind);
    });

    deleteCable.forEach(cable => {
        cable.destroy();
    });
    //deleteObjectByPath(delta.path)
    //Removing from allNodes
    for(let name in allNodes){
        if(name.includes(kind)){
           delete allNodes[name];
        }
    }
    //Removing from the world
    for(let i=0; i<world.children.length; i++){
        if(world.children[i].name === kind){
            world.remove(world.children[i])
        }
    }
}

/*
    { op:"disconnect", paths:["oldpath", "newpath"] }
*/
function enactDeltaRepath(delta) {
    // rename object at oldpath to newpath (including its userData.path etc.)
}

/*
    { op:"disconnect", paths:["x", "y"] }
*/
function enactDeltaDisconnect(delta) {
    //console.log(delta)
    let src = getObjectByPath(delta.paths[0]);
    let dst = getObjectByPath(delta.paths[1]);
    if (!src || !dst) {
        console.log(arc[0], src)
        console.log(arc[1], dst)
        console.error("arc with unmatchable paths")
        return;
    }

    // find any matching cables and destroy them!!
    //console.log("disconnecting", delta.paths)

    let found = allCables.filter(cable => {
        return cable.src == src && cable.dst == dst;
    });

    //console.log("found matches:", found.length)

    found.forEach(cable => {
        //console.log("removing cable", cable);
        cable.destroy();
    });
}

/*
    { op:"connect", paths:["x", "y"] }
*/
function enactDeltaConnect(delta) {
    // create a new arc that joins the paths of delta.paths[0] and delta.paths[1]
    let src = getObjectByPath(delta.paths[0]);
    let dst = getObjectByPath(delta.paths[1]);
    if (!src || !dst) {
        console.log(arc[0], src)
        console.log(arc[1], dst)
        console.error("arc with unmatchable paths")
        return;
    }
    new Cable(src, dst);
}


/*
    { op:"propchange", path:"x", name:"pos", from:[x, y, z], to:[x, y, z] }
*/
function enactDeltaObjectPos(delta) {
    // assert(delta.op == "propchange")
    // assert(delta.name == "pos")

    let object = getObjectByPath(delta.path);
    // assert (object, "path not found")
    object.userData.fromPos = delta.to;
    // TODO: assert delta.from is roughly equal to current object.position

    // what the object should be part of:
    let parent = object.userData.originalParent;
    if (parent == undefined) parent = object.parent;
    // temporarily move object to world space to set the position:
    world.add(object);
    // set the position & update matrices:
    object.position.fromArray(delta.to);
    object.matrixWorldNeedsUpdate = true;
    object.updateMatrixWorld();
    // now re-attach object to proper parent:
    parent.add(object);
}

/*
    { op:"propchange", path:"x", name:"orient", from:[x, y, z, w], to:[x, y, z, w] }
*/
function enactDeltaObjectOrient(delta) {
    // assert(delta.op == "propchange")
    // assert(delta.name == "orient")

    let object = getObjectByPath(delta.path);
    // assert (object, "path not found")
    object.userData.fromOri = delta.to;
    // TODO: assert delta.from is roughly equal to current object.quaternion

    // what the object should be part of:
    let parent = object.userData.originalParent;
    if (parent == undefined) parent = object.parent;
    // temporarily move object to world space to set the position:
    world.add(object);
    // set the position & update matrices:
    object.quaternion.fromArray(delta.to);
    object.matrixWorldNeedsUpdate = true;
    object.updateMatrixWorld();
    // now re-attach object to proper parent:
    parent.add(object);
}

/*
    { op:"propchange", path:"x", name:"value", from:x, to:y }
*/
function enactDeltaObjectValue(delta) {
    let object = getObjectByPath(delta.path);
    let kind = object.userData.kind; // small_knob, nswitch, etc.
    let value = delta.to;
    switch(kind){
        case "small_knob":
        case "large_knob": {
            value = value.toFixed(2);
            object.userData.value = value;
            //console.log("Back from server Value", value)
            //Update once server says:
            
            // if value == 0, angle should be -sweep
            // if value == 1, angle should be sweep 
            let derived_angle = KNOB_SWEEP * ((value*2) - 1);
            
            // set rotation of knob by this angle, and normal axis of knob:
            object.quaternion.setFromAxisAngle( new THREE.Vector3(0, 0, 1), derived_angle);
        } break;
        case "n_switch": {
            object.userData.value = value;
            for(let child of object.children){
                if(child.userData.selectable){
                    child.position.fromArray( object.userData.positions[value -1]);
                }
            }
        } break;
        default:{

        } break;
    }
}

function generateLabel(message, label_size) {
    let shapes;
    let msg = message.replace(/_/g, " ")
    if(label_size !== undefined){
        shapes = loadedFont.generateShapes(msg, label_size);
    } else {
        shapes = loadedFont.generateShapes(msg, LABEL_SIZE);
    }

    let shapeGeometry = new THREE.ShapeBufferGeometry(shapes);
    shapeGeometry.computeBoundingBox();

    text = new THREE.Mesh(shapeGeometry, label_material);

    return text;
}
/**
 * create a label with 3D space
 * @param {VALUE} text - text for the label
 * @param {VALUE} x - x location
 * @param {VALUE} y - y location
 * @param {VALUE} z - z location
 * @param {value} scale - OPTIONAL: single scale size (default: 0.009)
 */
function createLabel(text, x, y, z, uniformScaling=0.009){
    let mesh;
    bm_loadFont('shaders/CONSOLA.TTF-msdf.json', function(err, font) {
    //bm_loadFont('shaders/distanceConsolasNEHE.fnt', function(err, font) {
        // create a geometry of packed bitmap glyphs, 
        // word wrapped to 240px (10 characters) and center-aligned

        //default pixel width is 24px
        let wrapWidth = 240.0;

        //https://github.com/Jam3/three-bmfont-text
        let geometry = bm_createGeometry({
            width: wrapWidth,
            align: 'center',
            font: font
        })
        // change text and other options as desired
        // the options sepcified in constructor will
        // be used as defaults
        geometry.update(
            { text: text });
        
        // the resulting layout has metrics and bounds
        // console.log(geometry.layout.height)
        // console.log(geometry.layout.descender)
            
        // the texture atlas containing our glyphs
        let textureLoader = new THREE.TextureLoader();
        textureLoader.load('shaders/CONSOLATTF.png', function (texture) {
        //textureLoader.load('shaders/distanceConsolasNEHE.png', function (texture) {
            if(textMaterial == undefined){
                textMaterial = new THREE.ShaderMaterial( {
                    uniforms: {
                        "u_texture": { value: texture },
                        "u_time": { value: 0 },
                        "u_color": {value: 0 }
                    },
                    vertexShader: loadedFontVShader,
                    fragmentShader: loadedFontFShader,
                    side: THREE.DoubleSide,
                    transparent: true,
                    derivatives: true,
                } );
            }
        
            // now do something with our mesh!
            mesh = new THREE.Mesh(geometry, textMaterial);

            mesh.scale.set(uniformScaling, -uniformScaling, uniformScaling);
           // mesh.scale.set(.02,-.02,.02);
            //mesh.position.set(-3,0.5,0);

            //center text: scale * Wrap Width (width) /2 (ex. .009 * 240 / 2)
            let centerX = (wrapWidth* uniformScaling)/2.0;
            if(x=="center")
                mesh.position.set(-centerX, y, z);
            else
                mesh.position.set(x,y,z);
            world.add(mesh);

            //return mesh;
        });

    });
}

function updateDirtyNode(dirtyPath) {
    //console.log("cleaning", dirtyPath)
    let parentNode = getObjectByPath(dirtyPath);
    if (!parentNode) return;

    let nodesToClean = [];
    for(let path in allNodes) {
        if (path === dirtyPath) continue; // skip ourself
        if (path.includes(dirtyPath)) {
            nodesToClean.push(getObjectByPath(path));
        }
    }
    let numchildren = nodesToClean.length;
    // attempt an automatic layout
    let numcols = Math.ceil(Math.sqrt(numchildren));
    let numrows = Math.ceil(numchildren / numcols);
    // special-case small modules:
    if (numchildren <= 4) {
        numcols = numchildren;
        numrows = 1;
    }

    //console.log("building module ", numchildren, parentNode.children.length, numrows, numcols)

    let LARGEST_MODULE = LARGE_KNOB_RADIUS;
    let widget_diameter = LARGEST_MODULE*2;
    let widget_padding = LARGEST_MODULE / 4;
    let grid_spacing = widget_diameter + widget_padding;

    // TODO: Seems silly to have to create a new geometry everytime.....
    //parentNode.geometry = new THREE.BoxBufferGeometry(width * nodesToClean.length, 0.2, 0.05);
    parentNode.geometry = new THREE.BoxBufferGeometry(grid_spacing * numcols, grid_spacing * numrows, 0.05);
    // reset anchor to top left corner:
    parentNode.geometry.translate(parentNode.geometry.parameters.width/2, -parentNode.geometry.parameters.height/2, -parentNode.geometry.parameters.depth/2);

    for (let r = 0, i=0; r<numrows; r++) {
        for (let c=0; c<numcols && i < numchildren; c++, i++) {
            //console.log("adding child" + i + " of " + numchildren + "at ", c, r)

            let widget = nodesToClean[i];
            widget.position.x = grid_spacing * (c + 0.5);
            widget.position.y = -grid_spacing * (r + 0.5);
            widget.position.z = 0;
        }
    }

    // cleansed:
    parentNode.userData.dirty = false;
}

function updateDirty(){

    // get a list of dirty objects:
    let dirtyObjects = [];
    for (let path in allNodes) {
        
        if (allNodes[path].userData.dirty) {
            dirtyObjects.push(path)
        }
        allNodes[path].userData.dirty = false;
    }
    if (dirtyObjects.length) {
        //console.log(dirtyObjects)
    }

    for (let dirtyPath of dirtyObjects) {
        updateDirtyNode(dirtyPath);
    }
    
    
}

//send delta's client side only (No round trip)
function clientSideDeltas(deltas){
    while (deltas.length > 0) {
        let delta = deltas.shift();
        enactDelta(delta);
    }

}