function enactDelta(delta) {
    if (Array.isArray(delta)) {
        for (let d of delta) {
            enactDelta(d);
        }
    } else {

       // console.log("enacting", delta.op)
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
    updateInstaces();
}

/* 
*  { op:"newnode", path:"x", kind:"noise", pos:[], orient:[], ...properties }
*/

function enactDeltaNewNode(delta) {
    // create new object etc.

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

    let container;
    let def = false;
    let labelName = delta.kind;

    
    switch(delta.kind){
      
        case "inlet": {
            container = new THREE.Mesh(boxGeom, boxMat);
            container.scale.set(NLET_RADIUS, NLET_RADIUS, NLET_HEIGHT);
            //container.position.set(0,0, .05);
            //container.position.fromArray([Math.random(),Math.random(),Math.random()]);
            //container.rotation.fromArray([Math.random(),Math.random(),Math.random()]);
            container.userData.shape = 1.;
        } break;
        case "outlet":{
            container = new THREE.Mesh(boxGeom, boxMat);
            container.scale.set(NLET_RADIUS, NLET_RADIUS, NLET_HEIGHT);
            container.userData.shape = 1.;

        } break;
        case "large_knob":{
            container = new THREE.Mesh(boxGeom, boxMat);
            container.scale.set(LARGE_KNOB_RADIUS, LARGE_KNOB_RADIUS, NLET_HEIGHT);
            container.userData.shape = 1.;
        }break;
        case "small_knob":{
            container = new THREE.Mesh(boxGeom, boxMat);
            container.scale.set(SMALL_KNOB_RADIUS, SMALL_KNOB_RADIUS, NLET_HEIGHT);
            container.userData.shape = 1.;
        }break;
        case "n_switch":
        case "group": break;
        default: {

            container = new THREE.Mesh();
            let c = new THREE.Mesh(boxGeom, boxMat);
            //c.scale.set(0.6,0.2,0.05);
            container.position.set(GEN_GEOM_WIDTH/2, -GEN_GEOM_HEIGHT/2, -GEN_GEOM_DEPTH/2);

            // ! This is a special case to make the backplate
            c.userData.path = path+"."+name;
            c.name = name;
            c.userData.name = name;
            c.userData.kind = delta.kind;
            c.userData.color = [Math.random(), Math.random(), Math.random(), 1];
            if (delta.pos) {
                //c.position.fromArray(delta.pos);
                c.userData.fromPos  = delta.pos;
            } else {
               // c.position = parent.position.clone();
            }
    
            if (delta.orient) {
                //c.quaternion.fromArray(delta.orient);
                c.userData.fromOri  = delta.orient;
            } else {
                //c.quaternion = parent.quaternion.clone();
            }
            addObjectByPath(c.userData.path, c);
            c.userData.moveable = true;
            container.add(c);
            def = true;
            container.userData.dirty = true;

        } break;
    }    

    if(container !== undefined){
        // container.castShadow = true;
        // container.receiveShadow = true;
       // container.updateMatrixWorld(true);
        container.name = name;
        container.userData.name = name;
        container.userData.path = path;
        container.userData.kind = delta.kind;
        container.userData.color = [Math.random(), Math.random(), Math.random(), 1];

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


        if (delta.pos) {
            container.position.fromArray(delta.pos);
            container.userData.fromPos  = delta.pos;
        } else {
            container.position = parent.position.clone();
        }

        if (delta.orient) {
            container.quaternion.fromArray(delta.orient);
            container.userData.fromOri  = delta.orient;
        } else {
            container.quaternion = parent.quaternion.clone();
        }
        // add to our library of nodes:
        addObjectByPath(path, container);
        // add to proper parent:
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
    //console.log("Delete: ", delta)
    //Removing from the world
    for(let i=0; i<instMeshes.children.length; i++){
        if(delta.path.includes(instMeshes.children[i].userData.path)){
            instMeshes.remove(instMeshes.children[i]);
        }
    }

    // for(let i=0; i<instMeshes.children.length; i++){
    //     if(instMeshes.children[i].name === kind){
    //         instMeshes.remove(instMeshes.children[i])

    //     }
    // }
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
    instMeshes.add(object);
   // console.log(instMeshes)
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
    instMeshes.add(object);
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
    console.log("cleaning", dirtyPath)
    let parentNode = getObjectByPath(dirtyPath);
    if (!parentNode) return;

    let nodesToClean = [];
    for(let path in allNodes) {
        if (path === dirtyPath) continue; // skip ourself
        if(path === dirtyPath + "." + dirtyPath) continue;
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

    console.log("building module ", numchildren, parentNode.children.length, numrows, numcols)

    let LARGEST_MODULE = LARGE_KNOB_RADIUS;
    let widget_diameter = LARGEST_MODULE;
    let widget_padding = LARGEST_MODULE / 2;
    let grid_spacing = widget_diameter + widget_padding;

    // TODO: Seems silly to have to create a new geometry everytime.....
    //parentNode.geometry = new THREE.BoxBufferGeometry(width * nodesToClean.length, 0.2, 0.05);
    //parentNode.children[0].scale.set(grid_spacing * numcols, grid_spacing * numrows, 0.05);
    parentNode.children[0].scale.set(grid_spacing * numcols, grid_spacing * numrows, 0.02);
    // reset anchor to top left corner:
    parentNode.children[0].position.set(((grid_spacing * numcols) /2) - (grid_spacing /2) ,(-(grid_spacing * numrows) /2) + (grid_spacing /2), 0.);


    for (let r = 0, i=0; r<numrows; r++) {
        for (let c=0; c<numcols && i < numchildren; c++, i++) {
            console.log("adding child " + i + " of " + numchildren + " at ", c, r)
            let widget = nodesToClean[i];
            widget.position.x = ((grid_spacing * c));
            widget.position.y = (-(grid_spacing * r));
            widget.position.z = NLET_HEIGHT * 1.5;
        }
    }
    // cleansed:
    updateInstaces();
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
        console.log(dirtyObjects)
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