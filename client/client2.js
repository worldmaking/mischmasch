
let once = 1;


///////////////////////////////////////////
// Globals
///////////////////////////////////////////

// Editing
let incomingDeltas = [];
let outgoingDeltas = [];

// Virtual scene
let ghostScene = new THREE.Group();
ghostScene.name = "ghostScene"

let ghostControllers = []
for (let i=0; i<2; i++) {
    let ghostController = new THREE.Object3D();
    ghostController.name = "ghostController"+i
    ghostController.userData.controllerID = i
    ghostScene.add(ghostController);
    ghostControllers[i] = ghostController
}

let ghostWorld = new THREE.Group();
ghostWorld.name = "ghostWorld"
ghostScene.add(ghostWorld);

let ghostMenu = new THREE.Group();
ghostScene.add(ghostMenu);
ghostMenu.name = "ghostMenu"

// Networking
let sock;

// Three.js components
let camera, scene, renderer;
let orbitControls;

// VR components
let VRcontrollers = [];

// STYLES
const SHAPE_BOX = 0
const SHAPE_CYLINDER = 1
const NLET_RADIUS = 0.025;
const NLET_HEIGHT = 0.01;
const LARGE_KNOB_RADIUS = 0.055;
const LARGE_KNOB_HEIGHT = 0.02;
const SMALL_KNOB_RADIUS = 0.035;
const SMALL_KNOB_HEIGHT = 0.02;
const NSWITCH_WIDTH = LARGE_KNOB_RADIUS + 0.03
const NSWITCH_HEIGHT = LARGE_KNOB_RADIUS + 0.03
const NSWITCH_DEPTH = NLET_HEIGHT
let boxGeom = new THREE.BoxGeometry(1,1,1);
let boxMat = new THREE.MeshStandardMaterial({
    // TODO: temp
    transparent: true,
    opacity: 0.4,
    side: THREE.DoubleSide,
    depthWrite: false,
});
// sizes of the default node container
// const GEN_GEOM_WIDTH = 0.6;
// const GEN_GEOM_HEIGHT = 0.2;
// const GEN_GEOM_DEPTH = 0.05;

/**
 * Find an object in allNodes via a path
 * @param {PATH} path - path to object
 */
function getObjectByPath(world, path) {
    //return allNodes[path];
    let terms = path.split(".");
    let obj = world;
    for (let term of terms) {
        obj = obj.getObjectByName(term);
    }
    return obj
}


//////////////////////////////////////////////////////////////////////////////////////////
// BOOT SEQUENCE
//////////////////////////////////////////////////////////////////////////////////////////

init();
async function init() {

    // init 3D world
    init_threejs();
    addFloorGrid();
    scene.add(ghostScene)

    // init the input devices & their handlers:
    VRcontrollers[0] = initVRController(0);
    VRcontrollers[1] = initVRController(1);

    // document.addEventListener("keydown", onKeypress, false);
    // document.addEventListener( 'mousemove', onDocumentMouseMove, false );
    // document.addEventListener( 'mousedown', onDocumentMouseDown, false );

    // now we can start rendering:
    animate();

    // connect to server
    serverConnect();
}


function init_threejs() {
    scene = new THREE.Scene();

    camera = new THREE.PerspectiveCamera(
        70,
        window.innerWidth / window.innerHeight,
        0.1,
        10
    );
    camera.position.set(0, 1.5, 0);
    scene.add(camera)

    renderer = new THREE.WebGLRenderer({
        antialias: true,
        canvas: canvas});
    renderer.setPixelRatio(window.devicePixelRatio);
    renderer.setSize(window.innerWidth, window.innerHeight);
    renderer.shadowMap.enabled = true;
    // TODO what are these?
    renderer.gammaInput = true;
    renderer.gammaOutput = true;
    document.body.appendChild(WEBVR.createButton(renderer));

    orbitControls = new THREE.OrbitControls(camera, renderer.domElement);
    orbitControls.enableDamping = true; // an animation loop is required when either damping or auto-rotation are enabled
    orbitControls.dampingFactor = 0.25;
    orbitControls.screenSpacePanning = false;
    orbitControls.minDistance = 0;
    orbitControls.maxDistance = 500;
    orbitControls.maxPolarAngle = Math.PI / 2;

    // basic lighting:
    scene.add(new THREE.HemisphereLight(0x808080, 0x606060));
    scene.background = new THREE.Color(0x000000);
    let light = new THREE.DirectionalLight(0xffffff);
    light.position.set(0.000001, 6, 0.000001);
    light.castShadow = true;
    light.shadow.camera.top = 2;
    light.shadow.camera.bottom = -2;
    light.shadow.camera.right = 2;
    light.shadow.camera.left = -2;
    light.shadow.mapSize.set(4096, 4096);
    scene.add(light);
}

function addFloorGrid() {
    // floor
    const GRID_DIVISIONS = 60;
    let floorGrid = new THREE.GridHelper(10, GRID_DIVISIONS);
    floorGrid.position.y = 0;
    floorGrid.material.opacity = 0.25;
    floorGrid.material.transparent = true;
    scene.add(floorGrid);
}


function initVRController(id=0) {
    
    let tempMatrix = new THREE.Matrix4();
    let raycaster = new THREE.Raycaster();
    

    function getFirstIntersection(controller) {
        // derive ray origin & direction from controller:
        raycaster.ray.origin.setFromMatrixPosition(controller.matrixWorld);
        controller.getWorldDirection( raycaster.ray.direction );
        // world direction gives us the Z axis of the controller
        // but we are looking in the -Z axis -- so we need to negate it:
        raycaster.ray.direction.multiplyScalar(-1.)

        //let intersections = raycaster.intersectObjects(scene.children, true);
        let intersections = raycaster.intersectObjects(ghostScene.children, true);
        return intersections[0];
    }

    function onVRControllerTriggerDown(event) {
        let controller = event.target; // VRcontrollers[n]
        let idx = controller.userData.controllerID
        let ghostController = ghostControllers[idx];
        log("onVRControllerTriggerDown", idx, ghostController)
        
        let intersection = getFirstIntersection(controller);
        // TODO ray hit nothing; emit a "deselect" event?
        if (!intersection) return;

        let object = intersection.object;
        // TODO ray hit nothing; emit a "deselect event?"
        if (!object) return;

        // ray hit something -- but what happens next depends on what kind of object it is
        log("onVRControllerTriggerDown intersected", object, intersection)
        
    }

    function onVRControllerTriggerUp(event) {
        let controller = event.target; // VRcontrollers[n]
    }

    function onVRThumbPadDown(event) {
        let controller = event.target; // VRcontrollers[n]
    }

    function onVRThumbPadUp(event) {
        let controller = event.target; // VRcontrollers[n]
    }

    let controller = new THREE.ViveController(id);
    controller.standingMatrix = renderer.vr.getStandingMatrix();
    controller.addEventListener("triggerdown", onVRControllerTriggerDown);
    controller.addEventListener("triggerup", onVRControllerTriggerUp);
    controller.addEventListener("thumbpadup", onVRThumbPadUp);
    controller.addEventListener("thumbpaddown", onVRThumbPadDown);
    controller.name = "VRcontroller"+id
    controller.userData.controllerID = id;
    scene.add(controller);
    return controller;
}


function serverConnect() {
    try {
        if (window.location.hostname/* == "localhost"*/) {
            sock = new Socket({
                reload_on_disconnect: true,
                reconnect_period: 1000,
                onopen: function () {
                    //this.send({ cmd: "getdata", date: Date.now() });
                    log("connected to server");
                    // request scene:
                    this.send({
                        cmd: "get_scene",
                        date: Date.now()
                    });
                },
                onmessage: function (m) {
                    onServerMessage(m, this);
                },
                onbuffer(data, byteLength) {
                    log("received binary:", byteLength);
                },
            });
        }
    } catch (e) {
        console.error(e);
    }
}

//////////////////////////////////////////////////////////////////////////////////////////
// EDITING
//////////////////////////////////////////////////////////////////////////////////////////

function enactDelta(world, delta) {
    if (Array.isArray(delta)) {
        for (let d of delta) {
            enactDelta(world, d);
        }
    } else {
        switch(delta.op) {
            case "propchange": {
                switch(delta.name) {
                    case "pos": {
                        enactDeltaObjectPos(world, delta);
                    } break;
                    case "orient": {
                        enactDeltaObjectOrient(world, delta);
                    } break; 
                    case "value": {
                        enactDeltaObjectValue(world, delta);
                    } break;
                    // handle other types, e.g. param value
                    default: {
                        log("unknown propchange delta kind", delta)
                    }
                }
            } break;
            case "connect": {
                enactDeltaConnect(world, delta);
            } break;
            case "disconnect": {
                enactDeltaDisconnect(world, delta);
            } break;
            case "newnode": {
                enactDeltaNewNode(world, delta);
            } break;
            case "delnode": {
                enactDeltaDeleteNode(world, delta);
            } break;
            case "repath": {
                enactDeltaRepath(world, delta);
            } break;
            default: {
                log("unknown delta kind", delta)
            }
        }
    }
}

function enactDeltaNewNode(world, delta) {
    // TODO: identify which world to add it to
    let parent = world;

    // first, find parent.
    let path = delta.path;
    let name, parentpath;
    let pathlastdot = path.lastIndexOf(".")
    if (pathlastdot >= 0) {
        parentpath = path.substring(0, pathlastdot);
        name = path.substring(pathlastdot+1);
        parent = getObjectByPath(world, parentpath);

    } else {
        name = delta.path;
    }

    let container;
    switch(delta.kind){
        case "inlet": {
            container = new THREE.Mesh(boxGeom, boxMat);
            container.scale.set(NLET_RADIUS, NLET_RADIUS, NLET_HEIGHT);
            container.userData.color = [0, 1, 0, 1];
            container.userData.shape = SHAPE_CYLINDER;
        } break;
        case "outlet":{
            container = new THREE.Mesh(boxGeom, boxMat);
            container.scale.set(NLET_RADIUS, NLET_RADIUS, NLET_HEIGHT);
            container.userData.color = [1, 0, 0, 1];
            container.userData.shape = SHAPE_CYLINDER;
        } break;
        case "large_knob":{
            container = new THREE.Mesh(boxGeom, boxMat);
            container.scale.set(LARGE_KNOB_RADIUS, LARGE_KNOB_RADIUS, NLET_HEIGHT);
            container.userData.shape = SHAPE_CYLINDER
            container.userData.color = [Math.random(), Math.random(), Math.random(), 1];
            container.userData.turnable = true;
        }break;
        case "small_knob":{
            container = new THREE.Mesh(boxGeom, boxMat);
            container.scale.set(SMALL_KNOB_RADIUS, SMALL_KNOB_RADIUS, NLET_HEIGHT);
            container.userData.shape = SHAPE_CYLINDER
            container.userData.color = [Math.random(), Math.random(), Math.random(), 1];
            container.userData.turnable = true;
        }break;
        case "n_switch": {
            container = new THREE.Mesh(boxGeom, boxMat);
            container.scale.set(NSWITCH_WIDTH, NSWITCH_HEIGHT, NSWITCH_DEPTH);
            container.userData.color = [Math.random(), Math.random(), Math.random(), 1];
            container.userData.slideable = true;
        } break;
        case "group": {
            alert("TODO GROUP")
        } break;
        default: {
            //log("KIND", delta.kind)
            container = new THREE.Group();
            container.userData.moveable = true;
            container.userData.isModule = true;

            let box = new THREE.Mesh(boxGeom, boxMat);
            box.userData.isBackPanel = true;
            box.userData.color = [Math.random(), Math.random(), Math.random(), 1];
            box.userData.shape = SHAPE_BOX
            box.name = "_box_"+name
            container.add(box);

        }
    }

    container.name = name;
    container.userData.path = delta.path;
    container.userData.kind = delta.kind;
    container.userData.isDirty = true;
    if (delta.pos) {
        container.position.fromArray(delta.pos);
    } else {
        container.position = parent.position.clone();
    }
    if (delta.orient) {
        container.quaternion.fromArray(delta.orient);
    } else {
        container.quaternion = parent.quaternion.clone();
    }
    parent.add(container);

    //log("new node", container.name, container.userData.isDirty)
}

function enactDeltaConnect(world, delta) {

}

//////////////////////////////////////////////////////////////////////////////////////////
// DYNAMICS
//////////////////////////////////////////////////////////////////////////////////////////

function animate() {
    //renderer.setAnimationLoop(render);
    requestAnimationFrame( animate );

    // handle incoming deltas:
    while (incomingDeltas.length > 0) {
        let delta = incomingDeltas.shift();
        // TODO: derive which world to add to:
        enactDelta(ghostWorld, delta);
        //log("incoming deltas")
        once = true;
    }

    updateDirty(ghostScene, false);

    // ? are we in VR?
    if (!renderer.vr.isPresenting()){
        orbitControls.update();
        renderer.vr.enabled = false;
    } else {
        renderer.vr.enabled = true;
    }
    //log("renderer.vr.enabled", renderer.vr.enabled)

    try {
        VRcontrollers[0].update();
        VRcontrollers[1].update();
    } catch(e) {
        console.warn(e)
    }

    stats.begin();
    // draw everything
    renderer.render(scene, camera);
    stats.end();

    if (sock && sock.socket && sock.socket.readyState === 1) {
        // send state back to server

    }
}

function doModuleLayout(mod) {

    // skip the backpanel:
    // TODO: also need to skip the label...
    let widgets = mod.children.slice(1);
    let backpanel = mod.children[0];
    let numchildren = widgets.length;

    let numcols = Math.ceil(Math.sqrt(numchildren));
    let numrows = Math.ceil(numchildren / numcols);
    // special-case small modules:
    if (numchildren <= 4) {
        numcols = numchildren;
        numrows = 1;
    }
    let LARGEST_MODULE = LARGE_KNOB_RADIUS;
    let widget_diameter = LARGEST_MODULE;
    let widget_padding = LARGEST_MODULE / 2;
    let grid_spacing = widget_diameter + widget_padding;

    if (!numcols) log(grid_spacing, numchildren, numrows, numcols)

    backpanel.scale.set(grid_spacing * numcols, grid_spacing * numrows, 0.02);
    // reset anchor to top left corner:
    backpanel.position.set(((grid_spacing * numcols) /2) - (grid_spacing /2) ,(-(grid_spacing * numrows) /2) + (grid_spacing /2), NLET_HEIGHT);

    for (let r = 0, i=0; r<numrows; r++) {
        for (let c=0; c<numcols && i < numchildren; c++, i++) {
            //log("adding child " + i + " of " + numchildren + " at ", c, r)
            let widget = widgets[i];
            widget.position.x = ((grid_spacing * c));
            widget.position.y = (-(grid_spacing * r));
            widget.position.z = NLET_HEIGHT * 1.5;
        }
    }
}

function updateDirty(parent, isDirty) {
    
    for (let o of parent.children) {

        // on the way down
        if (o.userData.isDirty) {
            isDirty = true;
            //log("isDirty", o.name, o.userData.kind)
        }

        // recurse to children
        updateDirty(o, isDirty);

        // on the way back up
        if (isDirty) {
            // layout for modules:
            if (o.userData.isModule) {
                // layout module
                doModuleLayout(o);
            }
        }

        o.userData.isDirty = false;
    }
}

function onServerMessage(msg, sock) {
    switch (msg.cmd) {
        case "deltas": {
            // insert into our TODO list:
            incomingDeltas.push.apply(incomingDeltas, msg.data);
        } break;
        default:
           // log("received JSON", msg, typeof msg);
    }
}