
//////////////////////////////////////////////////////////////////////////////////////////
// COMMON GEOMETRIES
//////////////////////////////////////////////////////////////////////////////////////////

let geometry = new THREE.BoxBufferGeometry(0.2, 0.2, 0.2);
let geometry2 = new THREE.BoxBufferGeometry(0.1, 0.1, 0.1);

let fontFile = 'js/three-r102/examples/fonts/helvetiker_regular.typeface.json';
let loadedFont;

let viveControllerPath = 'js/three-r102/examples/models/obj/vive-controller/';
let loadedController;

let viveHeadsetModelPath = "models/viveHeadset/"
let loadedHeadsetModel;

let texturesPath = "textures/";

// turn FontLoader into something we can await:
async function loadFont(fontFile) {
    return new Promise(resolve => new THREE.FontLoader().load(fontFile, resolve));
}

async function loadOBJ(path) {
    return new Promise(resolve => new THREE.OBJLoader().load(path, resolve));
}

let viveTextureLoader = new THREE.TextureLoader();
//viveTextureLoader.setPath(viveControllerPath);
let viveTexturePNG, viveSpecularPNG;
async function loadTexture(filename) {
    return new Promise(resolve => viveTextureLoader.load(filename, resolve));
}

let floorTexture;
let floorTextureLoader = new THREE.TextureLoader();
async function loadFloorTexture(filename) {
    return new Promise(resolve => floorTextureLoader.load(filename, resolve));
}
//////////////////////////////////////////////////////////////////////////////////////////
// COMMON MATERIALS
//////////////////////////////////////////////////////////////////////////////////////////

const LABEL_SIZE = .03;
// how far the control poitns for cables are from the inlets outlets
// effects how 'straight' the cables are as come out of inlets/outlets
const CABLE_CONTROL_POINT_DISTANCE = 0.1;
// how many line segments in each patch cable
const NUM_CABLE_SEGMENTS = 128;
// how tall the cable jack cylinders are
const CABLE_JACK_HEIGHT = 0.03;
const CABLE_JACK_RADIUS = CABLE_JACK_HEIGHT * 0.4;

const NLET_RADIUS = 0.025;
const NLET_HEIGHT = 0.01;

const LARGE_KNOB_RADIUS = 0.055;
const LARGE_KNOB_HEIGHT = 0.02;

const SMALL_KNOB_RADIUS = 0.035;
const SMALL_KNOB_HEIGHT = 0.02;

const CONTROLLER_HIT_DISTANCE = 0.03;

const FRAME_WAIT_AMOUNT = 0;

const GRID_DIVISIONS = 60;

let inlet_geometry = new THREE.CylinderGeometry(NLET_RADIUS, NLET_RADIUS, NLET_HEIGHT, 8);
let outlet_geometry = inlet_geometry;
inlet_geometry.rotateX(Math.PI/2)
inlet_geometry.computeBoundingBox();

let inlet_backplate_geometry = new THREE.BoxBufferGeometry(NLET_RADIUS * 2, NLET_RADIUS * 2, NLET_HEIGHT, 8);
let outlet_backplate_geometry = inlet_backplate_geometry;
//inlet_backplate_geometry.rotateX(Math.PI/2)
inlet_backplate_geometry.computeBoundingBox();

let small_knob_geometry = new THREE.CylinderGeometry(SMALL_KNOB_RADIUS, SMALL_KNOB_RADIUS, SMALL_KNOB_HEIGHT, 8);
small_knob_geometry.rotateX(Math.PI/2)
small_knob_geometry.computeBoundingBox();

let large_knob_geometry = new THREE.CylinderGeometry(LARGE_KNOB_RADIUS, LARGE_KNOB_RADIUS, LARGE_KNOB_HEIGHT, 8);
large_knob_geometry.rotateX(Math.PI/2)
large_knob_geometry.computeBoundingBox();

let plug_geometry = new THREE.CylinderGeometry(CABLE_JACK_RADIUS, CABLE_JACK_RADIUS, CABLE_JACK_HEIGHT, 8);
// fix anchor point
plug_geometry.translate(0, CABLE_JACK_HEIGHT/2, 0);
plug_geometry.rotateX(Math.PI/2)
plug_geometry.computeBoundingBox();

let n_switch_geometry = new THREE.BoxGeometry( LARGE_KNOB_RADIUS + 0.03, LARGE_KNOB_RADIUS  + 0.03, LARGE_KNOB_HEIGHT, 8 );
n_switch_geometry.computeBoundingBox();

let n_switch_slider_geometry = new THREE.BoxGeometry( NLET_HEIGHT + .01 , NLET_HEIGHT+ .01 , NLET_HEIGHT, 8 );
n_switch_slider_geometry.computeBoundingBox();

let generic_geometry = new THREE.BoxBufferGeometry(0.6, 0.2, 0.05);
generic_geometry.translate(generic_geometry.parameters.width/2, -generic_geometry.parameters.height/2, -generic_geometry.parameters.depth/2);

let op_geometry = new THREE.BoxBufferGeometry(0.2, 0.2, 0.05);
op_geometry.translate(op_geometry.parameters.width/2, -op_geometry.parameters.height/2, -op_geometry.parameters.depth/2);

let label_material = new THREE.MeshStandardMaterial({
    color: 0x000000,
    transparent: true,
    opacity: 0.4,
    side: THREE.DoubleSide
    //, blending: THREE.AdditiveBlending

});

let generic_material = new THREE.MeshStandardMaterial({
    color: 0x888888,
    roughness: 0.7,
    metalness: 0.0,
    opacity: 0.3,
    transparent: true,
    side: THREE.DoubleSide,
    depthWrite: false,
    blending: THREE.AdditiveBlending

    
});

let outline_material = new THREE.MeshStandardMaterial({
    color: 0x888888,
    side: THREE.BackSide,
    blending: THREE.NormalBlending
});

//////////////////////////////////////////////////////////////////////////////////////////
// SCENE COMPONENTS
//////////////////////////////////////////////////////////////////////////////////////////


let camera, scene, renderer;
let world = new THREE.Group();

let menu = new THREE.Group();

let controller1, controller2;
let controllerMesh;

//////////////////////////////////////////////////////////////////////////////////////////
// OTHER GLOBALS
//////////////////////////////////////////////////////////////////////////////////////////


let sock
let userPose = createUserPose();
let otherUsers = {};

let incomingDeltas = [];
let outgoingDeltas = [];

let clientDeltas = [];

let allNodes = {};
let allCables = [];
let uiLine;
let grabLineLength;

let currentKnobValue = 0;
let frames = 0;

let createObjFromMenu = true;
let menuPos = 0;

function getObjectByPath(path) {
    return allNodes[path];
}

function addObjectByPath(path, object) {
    allNodes[path] = object;
}

// TODO: iterator over all nodes 
function iterateAllNodes(fun) {
    for (let node of allNodes) {
        fun(node);
    }
}


function createUserPose(id=0) {
    return {
        id: id,
        head: {
            pos: new THREE.Vector3(),
            orient: new THREE.Quaternion()
        },
        controller1: {
            pos: new THREE.Vector3(),
            orient: new THREE.Quaternion()
        },
        controller2: {
            pos: new THREE.Vector3(),
            orient: new THREE.Quaternion()
        },
    }
}

// generate a random name for new object:
let gensym = (function() {
    let nodeid = 0;
    return function (prefix="node") {
        return `${prefix}_${userPose.id}_${nodeid++}`
    }
})();

let raycaster = new THREE.Raycaster(),
    intersected = [];

// temp variables to save allocations
let tempMatrix = new THREE.Matrix4();
let point = new THREE.Vector3();
let delta;

let localPatch;
let spawn = false;
let controllerPrevPos;

let subObjCount = 0;
let subInletCount = 0;
let subOutletCount = 0;

//Simple debug hack
let once = true;

//////////////////////////////////////////////////////////////////////////////////////////
// BOOT SEQUENCE
//////////////////////////////////////////////////////////////////////////////////////////

init();
async function init() {

    // load & wait for required resources:
    loadedFont = await loadFont(fontFile);
    loadedController = await loadOBJ(viveControllerPath + "vr_controller_vive_1_5.obj");
    viveTexturePNG = await loadTexture(viveControllerPath + 'onepointfive_texture.png');
    viveSpecularPNG = await loadTexture(viveControllerPath + 'onepointfive_spec.png');
    loadedHeadsetModel = await loadOBJ(viveHeadsetModelPath + "V2.obj");
    let viveHeadsetPNGs = [
        await loadTexture(viveHeadsetModelPath + 'base.png'),
        await loadTexture(viveHeadsetModelPath + 'strap.png'),
        await loadTexture(viveHeadsetModelPath + 'logo.png'),
        await loadTexture(viveHeadsetModelPath + 'lens.png'),
        await loadTexture(viveHeadsetModelPath + 'black.png'), //await loadTexture(viveHeadsetModelPath + 'dots.png'),
        await loadTexture(viveHeadsetModelPath + 'black.png'),
        await loadTexture(viveHeadsetModelPath + 'noise.png'),
        await loadTexture(viveHeadsetModelPath + 'foam.png'),
        await loadTexture(viveHeadsetModelPath + 'black.png'), //await loadTexture(viveHeadsetModelPath + 'screen.png')
    ];

    // floorTexture = await loadFloorTexture( texturesPath + "checkerboard.jpg");
    // floorTexture = await loadFloorTexture( texturesPath + "noise_pattern_6.jpg");
    floorTexture = await loadFloorTexture( texturesPath + "rubber1.jpg");
    // floorTexture = await loadFloorTexture( texturesPath + "carpet1.jpg");
    // floorTexture = await loadFloorTexture( texturesPath + "carpet2.jpg");
    
    // TODO: where do these normal maps apply?
    //let viveHeadsetNormalsPNG = await loadTexture(viveHeadsetModelPath + 'normals.png');

    // build up the scene
    scene = new THREE.Scene();
    scene.background = new THREE.Color(0x20ff80);
    camera = new THREE.PerspectiveCamera(
        70,
        window.innerWidth / window.innerHeight,
        0.1,
        10
    );

    renderer = new THREE.WebGLRenderer({
        antialias: true,
        canvas: canvas
    });
    renderer.setPixelRatio(window.devicePixelRatio);
    renderer.setSize(window.innerWidth, window.innerHeight);
    renderer.gammaInput = true;
    renderer.gammaOutput = true;
    renderer.shadowMap.enabled = true;
    renderer.vr.enabled = true;
    document.body.appendChild(WEBVR.createButton(renderer));
    window.addEventListener("resize", onWindowResize, false);

    // basic lighting:
    scene.add(new THREE.HemisphereLight(0x808080, 0x606060));
    scene.background = new THREE.Color(0x000000);
    let light = new THREE.DirectionalLight(0xffffff);
    light.position.set(0, 6, 0);
    light.castShadow = true;
    light.shadow.camera.top = 2;
    light.shadow.camera.bottom = -2;
    light.shadow.camera.right = 2;
    light.shadow.camera.left = -2;
    light.shadow.mapSize.set(4096, 4096);
    scene.add(light);

    // VR controllers
    controller1 = new THREE.ViveController(0);
    controller2 = new THREE.ViveController(1);
    controller1.standingMatrix = renderer.vr.getStandingMatrix();
    controller2.standingMatrix = renderer.vr.getStandingMatrix();
    controller1.addEventListener("triggerdown", onSelectStart);
    controller1.addEventListener("triggerup", onSelectEnd);
    controller2.addEventListener("triggerdown", onSelectStart);
    controller2.addEventListener("triggerup", onSelectEnd);
    controller1.addEventListener("thumbpadup", onSpawn);
    controller2.addEventListener("thumbpadup", onSpawn);
    controller1.addEventListener("gripsdown", onGrips);
    controller2.addEventListener("gripsdown", onGrips);
    scene.add(controller1);
    scene.add(controller2);


    //Keypress
    document.addEventListener("keyup", onKeyPress);

    {
        
        headsetMesh = loadedHeadsetModel.children[0]
        const inch2m = 0.0254;
        headsetMesh.geometry.scale(-inch2m, inch2m, -inch2m); // convert cm to m
        for (let i in headsetMesh.material) {
            if (viveHeadsetPNGs[i]) {
                headsetMesh.material[i].map = viveHeadsetPNGs[i];
            }
        }
        headsetMesh.castShadow = true;
        headsetMesh.receiveShadow = true;
        console.log("HEADSET MODEL VVVVVVVV",loadedHeadsetModel)
    }

    {
        controllerMesh = loadedController.children[0];
        controllerMesh.material.map = viveTexturePNG;
        controllerMesh.material.specularMap = viveSpecularPNG;
        controllerMesh.castShadow = true;
        controllerMesh.receiveShadow = true;

        let pivot = new THREE.Mesh(new THREE.IcosahedronBufferGeometry(0.01, 2));
        pivot.name = 'pivot';
        //pivot.position.y = - 0.016;
        pivot.position.z = - 0.043;
        pivot.rotation.x = Math.PI / 5.5;
        controllerMesh.add(pivot);
        controller1.add(controllerMesh.clone());
        controller2.add(controllerMesh.clone());
        // pivot.material = pivot.material.clone();
    }
    
    controller1.userData.thumbpadDX = 0;
    controller1.userData.thumbpadDY = 0;




    // controllers geometry
    let geometry = new THREE.BufferGeometry().setFromPoints([
        new THREE.Vector3(0, 0, 0),
        new THREE.Vector3(0, 0, -1)
    ]);
    let line = new THREE.Line(geometry);
    line.name = "line";
    line.scale.z = 1;
    controller1.add(line.clone());
    controller2.add(line.clone());

    // 'world' represents the root node of the patch:
    scene.add(world);


    // floor
    let floorGrid = new THREE.GridHelper(10, GRID_DIVISIONS);
    floorGrid.position.y = 0;
    floorGrid.material.opacity = 0.25;
    floorGrid.material.transparent = true;
   // scene.add(floorGrid);

   //MakeMenu
   makeMenu();

	floorTexture.wrapS = floorTexture.wrapT = THREE.RepeatWrapping; 
	floorTexture.repeat.set( 10, 10 );
	let floorMaterial = new THREE.MeshBasicMaterial( { map: floorTexture, side: THREE.DoubleSide, transparent: false, opacity: .1, } );
    let floorGeometry = new THREE.PlaneBufferGeometry(10, 10, 10, 10);
    let uvs = floorGeometry.attributes.uv.array;
    let uvscale = 2;
    for ( var i = 0, len=uvs.length; i<len; i++ ) { uvs[i] *= uvscale; }



	let floor = new THREE.Mesh(floorGeometry, floorMaterial);
	//floor.position.y = -0.5;
	floor.rotation.x = Math.PI / 2;
	scene.add(floor);

    // hook up server:
    connect_to_server();

    // now we can start rendering:
    animate();

    // outgoingDeltas.push(spawnRandomModule([1, 2, 3], [4, 5, 6, 7]))
}



function onWindowResize() {
    camera.aspect = window.innerWidth / window.innerHeight;
    camera.updateProjectionMatrix();
    renderer.setSize(window.innerWidth, window.innerHeight);
}

class Cable {
    constructor(src, dst) {
        this.src = src;
        this.dst = dst;
     
   
        let inlet_material = new THREE.MeshStandardMaterial({
            color: 0x00ff00,
            roughness: 0.7,
            metalness: 0.0,
            opacity: 0.3,
            transparent: true,
            side: THREE.DoubleSide,
            depthWrite: false,
            blending: THREE.AdditiveBlending

        });
        let outlet_material = new THREE.MeshStandardMaterial({
            color: 0xff0000,
            roughness: 0.7,
            metalness: 0.0,
            opacity: 0.3,
            transparent: true,
            side: THREE.DoubleSide,
            depthWrite: false,
            blending: THREE.AdditiveBlending

        });

        this.srcJackMesh = new THREE.Mesh(plug_geometry, outlet_material);
        this.dstJackMesh = new THREE.Mesh(plug_geometry, inlet_material);
        world.add(this.srcJackMesh);
        world.add(this.dstJackMesh);
        this.srcJackMesh.userData.moveable = true;
        this.srcJackMesh.userData.selectable = true;
        this.srcJackMesh.userData.cable = this;
        this.srcJackMesh.userData.kind = "jack_outlet";
        this.dstJackMesh.userData.moveable = true;
        this.dstJackMesh.userData.selectable = true;
        this.dstJackMesh.userData.cable = this;
        this.dstJackMesh.userData.kind = "jack_inlet";

        this.positions = [
            new THREE.Vector3(),
            new THREE.Vector3(),
            new THREE.Vector3(),
            new THREE.Vector3() 
        ];

        this.geometry = new THREE.BufferGeometry();
        let vertices = new Float32Array(NUM_CABLE_SEGMENTS * 3);
        this.geometry.addAttribute('position', new THREE.BufferAttribute(vertices, 3));
        let curve = new THREE.CatmullRomCurve3(this.positions);
        //curve.curveType = 'catmullrom'; //
        //curve.curveType = 'centripetal'; 
        curve.curveType = 'chordal';
        curve.mesh = new THREE.Line(this.geometry, new THREE.LineBasicMaterial({
            color: 0xD3D3D3,
            opacity: 1,
            linewidth: 2
        }));
        curve.mesh.castShadow = true;
        this.curve = curve;
        // TODO: this shouldn't be needed
        curve.mesh.frustumCulled = false;
        
        this.update();

        curve.mesh.userData.moveable = true;
        world.add(curve.mesh);

        allCables.push(this);
    }

    update() {

        if (this.src) {
            // cable is connected to a source
            // use src (outlet) orientation for our cable orientation 
            this.src.getWorldQuaternion(this.srcJackMesh.quaternion);
            // use src (outlet) position for our start point (position[0])
            this.src.getWorldPosition(this.positions[0]);
            // set positions[1] control point accordingly:
            this.positions[1]
                .set(0, 0, (NLET_HEIGHT + CABLE_CONTROL_POINT_DISTANCE) / 2)
                .applyQuaternion(this.srcJackMesh.quaternion)
                .add(this.positions[0]);
            // set source jack position accordingly
            this.srcJackMesh.position
                .copy(this.positions[0])
            //Color Set
            this.curve.mesh.material.color.copy(this.src.material.color);
        } else {
            // dangling jack case
            let q = new THREE.Quaternion();
            // get the jack's orientation
            this.srcJackMesh.getWorldQuaternion(q);
            // derive the cable start point from the jack's position
            this.srcJackMesh.getWorldPosition(this.positions[0]);
            // derive positions[1] (cable control point)
            this.positions[1]
                .set(0, 0, (NLET_HEIGHT + CABLE_CONTROL_POINT_DISTANCE) / 2)
                .applyQuaternion(q)
                .add(this.positions[0]);
            //Reset Color
             this.curve.mesh.material.color.setRGB(211,211,211);
        }

        if (this.dst) {
            this.dst.getWorldPosition(this.positions[3]);
            this.dst.getWorldQuaternion(this.dstJackMesh.quaternion);
            this.positions[2]
                .set(0, 0, (NLET_HEIGHT + CABLE_CONTROL_POINT_DISTANCE) / 2)
                .applyQuaternion(this.dstJackMesh.quaternion)
                .add(this.positions[3]);

            this.dstJackMesh.position
                .copy(this.positions[3])
        } else {
            let q = new THREE.Quaternion();
            this.dstJackMesh.getWorldQuaternion(q);
            // get cable end point from the srcJackMesh
            this.dstJackMesh.getWorldPosition(this.positions[3]);
            // derive positions[2] (cable control point)
            this.positions[2]
                .set(0, 0, (NLET_HEIGHT + CABLE_CONTROL_POINT_DISTANCE) / 2)
                .applyQuaternion(q)
                .add(this.positions[3])
        }

        let curve = this.curve;
        let mesh = this.curve.mesh;
        let position = mesh.geometry.attributes.position;
        for (let i = 0; i < NUM_CABLE_SEGMENTS; i++) {
            let t = i / (NUM_CABLE_SEGMENTS - 1);
            curve.getPoint(t, point);
            // if (i==0) console.log(point)
            position.setXYZ(i, point.x, point.y, point.z);
        }
        position.needsUpdate = true;

        //this.geometry.computeBoundingBox();
    }

    destroy() {

        // destroy the cable and its objects
        // and remove it from allCables
        world.remove(this.srcJackMesh);
        world.remove(this.dstJackMesh);
        world.remove(this.curve.mesh);

        allCables = allCables.filter(value => {
            // keep cables that are not us:
            return value != this;
        });
    }
}

function randomIntFromInterval(min,max) // min and max included
{
    return Math.floor(Math.random()*(max-min+1)+min);
}

function onSelectStart(event) {
    let controller = event.target;
    let intersections = getIntersections(controller, 0, 0, -1);
    if (intersections.length < 1) return;
    let intersection = intersections[0];

    let object = intersection.object;



    // while (object && !object.userData.moveable) {
    //     object = object.parent;
    // }

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
        tempMatrix.getInverse(controller.matrixWorld);
        let parent = object.parent;
        object.matrix.premultiply(parent.matrixWorld);
        object.matrix.premultiply(tempMatrix);
        object.matrix.decompose(object.position, object.quaternion, object.scale);
        if (object.material){
            object.material.emissive.r = .2;
            object.material.emissive.g = .2;
            object.material.emissive.b = .2;
        }


        controller.userData.selected = object;
        object.userData.originalParent = parent;
        
        controller.add(object); //removes from previous parent
    }

    if (object && !object.userData.moveable) {
        let kind = object.userData.kind;
        if (kind == "outlet") {
            // create a new line
            // line's src == object
            // now set object = line.dstJackMesh
            let cable = new Cable(object, null);
            object = cable.dstJackMesh;
            object.position.z = -0.07;
            controller.add(object); //removes from previous parent

        } else if (kind == "inlet") {
            //...
            let cable = new Cable(null, object);

            object = cable.srcJackMesh;
            object.position.z = -0.07;
            controller.add(object); //removes from previous parent
        }
        controller.userData.selected = object;
    }

    controller.userData.rotation = controller.rotation.clone();
    object.userData.rotation = object.rotation.clone();
   
    if(object && object.userData.turnable){
        let line = controller.getObjectByName("line");
        grabLineLength = line.scale.z;
    
        let lineGeom = new THREE.Geometry();
        lineGeom.vertices.push(new THREE.Vector3());
        lineGeom.vertices.push(new THREE.Vector3());
        let lineMat = new THREE.LineBasicMaterial({
            color: "yellow"
        });
        uiLine = new THREE.Line(lineGeom, lineMat);
        uiLine.name = "uiLine";
        world.add(uiLine);
    }

}

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
function enactDeltaNewNode(delta) {
    // create new object etc.

    //console.log(delta)

    let parent = (delta.menu == true) ? menu : world;
    
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
    
    switch(delta.kind){
        case "inlet": {
            inlet_material.blending = THREE.NormalBlending;
            container = new THREE.Mesh(inlet_geometry, inlet_material);
            container.castShadow = true;
            container.receiveShadow = true;
            container.position.fromArray([
                0, 
                0,
                generic_geometry.parameters.depth/2 - NLET_HEIGHT]);
            //Outline
            outline_mat.color.set(0x00ff00);    
            let outline = new THREE.Mesh(inlet_geometry, outline_mat);
            outline.scale.multiplyScalar(1.28);
            outline.castShadow = true;
            outline.receiveShadow = true;
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
            container.castShadow = false;
            container.receiveShadow = false;
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
            container.castShadow = true;
            container.receiveShadow = true;
            //generic_geometry.parameters.width
            container.position.fromArray([
                0, 
                0,
                generic_geometry.parameters.depth/2 - LARGE_KNOB_HEIGHT]);
            let label = generateLabel(name, LARGE_KNOB_HEIGHT/2);
            label.position.z = 0.01;
            label.position.x = -LARGE_KNOB_RADIUS /2;
            container.add(label);
            container.userData.turnable = true;
            container.userData.selectable = true;
          
        } break;
        case "small_knob": {
            container = new THREE.Mesh(small_knob_geometry, knob_material);
            container.castShadow = true;
            container.receiveShadow = true;
            container.position.fromArray([
                0, 
                0,
                generic_geometry.parameters.depth/2 - SMALL_KNOB_HEIGHT]);
            //Label
            let label = generateLabel(name, SMALL_KNOB_HEIGHT/2.7);
            label.position.z = 0.01;
            label.position.x = -SMALL_KNOB_RADIUS /2;
            container.add(label);

            container.userData.turnable = true;
            container.userData.selectable = true;
            
        } break;
        case "n_switch": {
            container = new THREE.Mesh(n_switch_geometry, n_switch_material);
            container.castShadow = true;
            container.receiveShadow = true;
            container.position.fromArray([
                (subObjCount / 8) + 0.25,
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
        default: {
            container = new THREE.Mesh(generic_geometry, material);
            container.castShadow = true;
            container.receiveShadow = true;
            
            let label = generateLabel(labelName);
            label.position.y = -LABEL_SIZE;
            label.position.z += 0.01;
            label.position.x = 0.005;
            container.add(label);

            container.userData.moveable = true; 
            container.userData.selectable = true;
            container.userData.dirty = true;
        } break;
    }    

    container.name = name;
    container.userData.name = name;
    container.userData.path = path;
    container.userData.kind = delta.kind;
    if(delta.value){
        container.userData.value = delta.value;
    } 

    if(delta.menu == true){
        container.userData.menu = delta.menu;
        container.scale.set(.2,.2,.2);

    }

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
    // add to our library of nodes:
    addObjectByPath(path, container);
    // add to proper parent:
    parent.add(container);
    


    
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
    console.log(delta)
    let src = getObjectByPath(delta.paths[0]);
    let dst = getObjectByPath(delta.paths[1]);
    if (!src || !dst) {
        console.log(arc[0], src)
        console.log(arc[1], dst)
        console.error("arc with unmatchable paths")
        return;
    }

    // find any matching cables and destroy them!!
    console.log("disconnecting", delta.paths)

    let found = allCables.filter(cable => {
        return cable.src == src && cable.dst == dst;
    });

    console.log("found matches:", found.length)

    found.forEach(cable => {
        console.log("removing cable", cable);
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
    console.log(delta.to)
    console.log(delta)
    let value = delta.to;
    switch(kind){
        case "small_knob":
        case "large_knob": {
            object.userData.value = value;
            //Update once server says:
            let derived_angle = (value * Math.PI * 2) - Math.PI;
            
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

function onSelectEnd(event) {
    let controller = event.target;
    if (controller.userData.selected !== undefined) {
        let object = controller.userData.selected;
        let parent = object.userData.originalParent;
        if (parent == undefined) parent = world; //object.parent;
        controller.userData.selected = undefined;

        object.material.emissive.r = 0;
        object.material.emissive.g = 0;
        object.material.emissive.b = 0;

       
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
                //world.add(object);
                parent.add(object);

                if (intersections.length > 0) {
                    let intersection = intersections[0];
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
                                
                    } else if (object.userData.kind == "jack_inlet" && o.userData.kind == "inlet") {
                        // we have a hit! connect
                        cable.dst = o;

                        // send a delta:
                        outgoingDeltas.push(
                            { op:"connect", paths:[cable.src.userData.path, cable.dst.userData.path] }
                        );

                        // destroy the arc
                        cable.destroy();
                    }
                }

                if(cable.src == null && cable.dst == null){
                    cable.destroy();
                }

                if(cable.src == null || cable.dst == null){
                    if(objPos.y < 0){
                        cable.destroy();
                    }
                }
                

            } else {

                let pos = new THREE.Vector3();
                let orient = new THREE.Quaternion();
                object.getWorldPosition(pos);
                object.getWorldQuaternion(orient);
                let path = object.userData.path;

                outgoingDeltas.push(
                    { op:"propchange", path:path, name:"pos", from:[0, 0, 0], to:[pos.x, pos.y, pos.z] }, 
                    { op:"propchange", path:path, name:"orient", from:[0, 0, 0, 1], to:[orient._x, orient._y, orient._z, orient._w] }
                );
            }


            if(objPos.y < 0){
                outgoingDeltas.push(
                    { op:"delnode", path:object.userData.path, kind:object.userData.name}
                );
            }

        }
        if(object && object.userData.turnable){
            let line = controller.getObjectByName("line");
            line.scale.z = 1;

            world.remove(world.getObjectByName("uiLine"));
        }
    }
}


function onSpawn(event) {
    let controller = event.target;
    if(controller.getButtonState('thumbpad') === undefined) return;

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
    if(controller.getButtonState('trigger') == false){
        let deltas = spawnRandomModule([pos.x, pos.y, pos.z], [orient._x, orient._y, orient._z, orient._w]);
        outgoingDeltas = outgoingDeltas.concat(deltas);
    } else {
        let deltas = copyModule([pos.x, pos.y, pos.z], [orient._x, orient._y, orient._z, orient._w], controller);
        outgoingDeltas = outgoingDeltas.concat(deltas);
    }
    
}

function copyModule(pos, orient, controller){
    let module_names = Object.keys(module_constructors)
    let object = controller.userData.selected;
    let opname, ctor;

    for(let i in module_names){

        if(module_names[i] == object.userData.kind){
            opname = module_names[i];
            ctor = module_constructors[opname];
        }
    }

    for(let j in operator_names){

        if(operator_names[j] == object.userData.kind){
            opname = operator_names[j];
            ctor = operator_constructors[opname];
        }
    }

    let path = gensym(opname);
    let deltas = ctor(path);
    deltas[0].pos = pos;
    deltas[0].orient = orient;
    return deltas;
}

//copy's a module (but this takes the object from an interestection instead of from controller.userdata.selected)
function cloneModuleMenu(pos, orient, object){
    let module_names = Object.keys(module_constructors)
    let opname, ctor;

    for(let i in module_names){

        if(module_names[i] == object.userData.kind){
            opname = module_names[i];
            ctor = module_constructors[opname];
        }
    }

    for(let j in operator_names){

        if(operator_names[j] == object.userData.kind){
            opname = operator_names[j];
            ctor = operator_constructors[opname];
        }
    }

    let path = gensym(opname);
    let deltas = ctor(path);
    deltas[0].pos = pos;
    deltas[0].orient = orient;
    return deltas;

   
}

//Generates a new Module inside the radial Menu (Honestly need to probably refarctor this so it isn't so redundant to other code)
function generateNewModule(pos, orient, name){
    //let module_names = Object.keys(module_constructors)
    let opname, ctor;


    ctor = module_constructors[name];

    // for(let j in operator_names){

    //     if(operator_names[j] == object.userData.kind){
    //         opname = operator_names[i];
    //         ctor = operator_constructors[opname];
    //     }
    // }

    let path = gensym(opname);
    let deltas = ctor(path);
    deltas[0].pos = pos;
    deltas[0].orient = orient;
    deltas[0].menu = true;

    return deltas;
}

//send delta's client side only (No round trip)
function clientSideDeltas(){
    while (clientDeltas.length > 0) {
        let delta = clientDeltas.shift();
        enactDelta(delta);
    }
}

function makeMenu(){
    let opname = ["sample_and_hold", "freevoib", "shifter", "constant", "lfo", "dualvco", "vca", "comparator", "outs"];
    for(let i of opname){

        //NEED TO REARRANGE MENU AND FIGURE OUT WHICH OBJECTS otherwise code is working!!!
        let deltas = generateNewModule([0 - .6 + menuPos, 0 + .1, 0 - .1], [0, 0, 0, 1], i);
        clientDeltas = clientDeltas.concat(deltas);
        clientSideDeltas(clientDeltas);
        touched = false;
        menuPos += .15;
    }
    menuPos = 0;
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
                        object.material.emissive.r = .5;
                        object.material.emissive.g = .5;
                        object.material.emissive.b = .5;
                    } else {
                        object.material.emissive.r = 0;
                        object.material.emissive.g = 0;
                        object.material.emissive.b = 0;
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
    let intersections = raycaster.intersectObjects(world.children, true);
    while (intersections.length > 0 && !intersections[0].object.userData.selectable) intersections.shift();
    return intersections;
}


function getIntersectionsWithKind(controller, x, y, z, offset =0, kind) {
    tempMatrix.identity().extractRotation(controller.matrixWorld);
    let origin = new THREE.Vector3(0, 0, offset).applyMatrix4(tempMatrix);
    raycaster.ray.origin.setFromMatrixPosition(controller.matrixWorld).add(origin);
    raycaster.ray.direction.set(x, y, z).applyMatrix4(tempMatrix);
    // argument here is just any old array of objects
    // 2nd arg is recursive (recursive breaks grabbing)
    let intersections = raycaster.intersectObjects(world.children, true);
    while (intersections.length > 0 && !intersections[0].object.userData.selectable && kind != intersections[0].object.userData.kind) intersections.shift();
    return intersections;
}

function intersectObjects(controller) {
    // Do not highlight when already selected
    if (controller.userData.selected !== undefined) return;
    let line = controller.getObjectByName("line");
    let intersections = getIntersections(controller, 0, 0, -1);
    if (intersections.length > 0) {
        let intersection = intersections[0];
        let object = intersection.object;
        if (object.material.emissive){
            object.material.emissive.r = .15;
            object.material.emissive.g = .15;
            object.material.emissive.b = .15;
        }

        intersected.push(object);
        line.scale.z = intersection.distance;
    } else {
        line.scale.z = 1;
    }
}

function cleanIntersected() {
    while (intersected.length) {
        let object = intersected.pop();
        if (object.material.emissive){
            object.material.emissive.r = 0;
            object.material.emissive.g = 0;
            object.material.emissive.b = 0;
        }
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

function onKeyPress(e) {

    if (e.keyCode == 13) {
        //syncLocalPatch();
        console.log(localPatch)
    }
    if (e.keyCode == 83){
        console.log("saving image")
        webutils.saveCanvasToPNG(canvas);
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

    if(controller.userData.selected === undefined){
        let controllerPos = new THREE.Vector3();
        controller.getWorldPosition(controllerPos);
        let controllerQuat = new THREE.Quaternion();    
        controller.getWorldQuaternion(controllerQuat);

        if (controller.userData.touched){
            createObjFromMenu = true;
            //create objects to choose from
            if(touched){
                menu.position.fromArray([controllerPos.x, controllerPos.y, controllerPos.z]);
                menu.rotation.fromArray([0, -controller.rotation.y, 0]);
                world.add(menu);

            }

        } else if(controller.userData.touched == false){
           
            let intersections = getIntersections(controller, 0, 0, -1);
            if (intersections.length > 0) {
                if(createObjFromMenu){
                let intersection = intersections[0];
                let object = intersection.object;
                    //need to always get the top node otherwise CTOR throws error cause it doesn't know the object to clone
                    for(let name of module_names){
                        let obj = object;
                        //N_Switch slider only doesn't have a kind so this will never be true (only object without a kind) probably should add a kind????
                        while(obj.userData.kind !== name && obj.userData.kind !== undefined){
                            obj = obj.parent;
                        }
                        if(obj.userData.kind === name){
                            let deltas = cloneModuleMenu([controllerPos.x, controllerPos.y, controllerPos.z], [controllerQuat._x, controllerQuat._y, controllerQuat._z, controllerQuat._w], obj);
                            outgoingDeltas = outgoingDeltas.concat(deltas);
                        }

                    } 
                }
            }
            createObjFromMenu = false;
            world.remove(menu);
        }
    }

    if (controller.userData.selected) {
        let object = controller.userData.selected;
        
      
        // if what we have selected is a jack,
        // then do ray intersection as usual
        // if ray target is inlet/outlet (appropriately)
        // locate jack at ray target

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
            if(controllerPos.distanceTo(objectPos) > .3){
                

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
                let angle = Math.atan2(relPos.x, -relPos.y);
                // map this to a 0..1 range:
                value = (angle + Math.PI) / (2 * Math.PI);
                if(uiLine !== undefined){
                    uiLine.geometry.vertices[0] = controllerPos;
                    uiLine.geometry.vertices[1] = objectPos;
                    uiLine.geometry.verticesNeedUpdate = true;

                    line.scale.z = 0;
                }
                object.userData.rotation = object.rotation.clone();
                
            } else {
                controller.rotation.z += object.userData.rotation._z;
                object.rotation.z = controller.rotation.z - controller.userData.rotation.z;

                value =  (object.rotation.z + Math.PI) / (2 * Math.PI);

                if(uiLine !== undefined){
                    uiLine.geometry.vertices[0] = 0;
                    uiLine.geometry.vertices[1] = 0;
                    uiLine.geometry.verticesNeedUpdate = true;
                   
                    line.scale.z = grabLineLength;
                }
            }
            

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


function animate() {
   renderer.setAnimationLoop(render);
}



function render() {
    stats.begin();

    // handle incoming deltas:
    while (incomingDeltas.length > 0) {
        let delta = incomingDeltas.shift();
        enactDelta(delta);
        //console.log("incoming deltas")
    }
    
    updateDirty();


    // make sure all objects' matrices are up to date (TODO might not be needed?)
    scene.updateMatrixWorld();

    for (let cable of allCables) {
        cable.update();
    }

    //Objects
    cleanIntersected();

    try {

        controller1.update();
        controller2.update();
    } catch(e) {
        //console.warn(e)
    }

    controllerGamepadControls(controller1);
    controllerGamepadControls(controller2);
    highlightNlet(controller1);
    highlightNlet(controller2);

    if (sock && sock.socket && sock.socket.readyState === 1) {

        // send any edits to the server:
        if (outgoingDeltas.length > 0) {
            let message = {
                cmd: "deltas",
                date: Date.now(),
                data: outgoingDeltas
            };
            sock.send(message);
            outgoingDeltas.length = 0;
            //console.log("Sending Deltas")
        }
        
        // send VR poses to the server:
        if (controller1 && controller2) {

            // TODO: camera is probably not the right point to grab -- maybe there's somethign in the vive handling that is head position
            camera.getWorldPosition(userPose.head.pos);
            camera.getWorldQuaternion(userPose.head.orient);
            controller1.getWorldPosition(userPose.controller1.pos);
            controller1.getWorldQuaternion(userPose.controller1.orient);
            controller2.getWorldPosition(userPose.controller2.pos);
            controller2.getWorldQuaternion(userPose.controller2.orient);

            sock.send({
                cmd: "user_pose",
                date: Date.now(),
                pose: userPose
            });
        }
    }

    intersectObjects(controller1);
    intersectObjects(controller2);
    renderer.render(scene, camera);

    stats.end();
}

function onGrips(event) {
    let controller = event.target;
    if (controller.getButtonState("grips")) {

    }
}

function clearScene() {
    while (world.children.length > 0) {
        world.remove(world.children[0]);
    }
    allNodes = {};
    allCables = [];

}


/////////////////////////////////////////////////////
// Websocket handling
/////////////////////////////////////////////////////


function connect_to_server() {
    try {
        if (window.location.hostname/* == "localhost"*/) {
            sock = new Socket({
                reload_on_disconnect: true,
                reconnect_period: 1000,
                onopen: function () {
                    //this.send({ cmd: "getdata", date: Date.now() });
                    write("connected to server");
                    // request scene:
                    this.send({
                        cmd: "get_scene",
                        date: Date.now()
                    });
                },
                onmessage: function (m) {
                    handlemessage(m, this);
                },
                onbuffer(data, byteLength) {
                    console.log("received binary:", byteLength);
                },
            });
        }
    } catch (e) {
        console.error(e);
    }
}
let count = 0;
function handlemessage(msg, sock) {
    switch (msg.cmd) {

        case "clear_scene":
            clearScene();
        break;
        case "deltas": {
            //console.log('deltas',msg.data)
            //console.log("got deltas", msg.data)

            // insert into our TODO list:
            incomingDeltas.push.apply(incomingDeltas, msg.data);
        } break;

        case "playback": {
            console.log('playback',msg.data)

            incomingDeltas.push.apply(incomingDeltas, msg.data);

        } break;
        case "user_pose": {
            let id = msg.pose.id;

            // ignore our self!
            if (id == userPose.id) break;
    
            // now add another user pose for this ID.
            // if msg.pos.id != userPose.id, then draw it
            // check if we have a userPose already set up for this id.
            //write(msg.pose)

            let other = otherUsers[id];
           
            if (!other) {
                // create it
                other = createUserPose(id);
                otherUsers[id] = other;
                other.controller1 = controllerMesh.clone();
                scene.add(other.controller1);
                other.controller2 = controllerMesh.clone();
                scene.add(other.controller2);
                other.head = headsetMesh.clone();
                scene.add(other.head);
                
                console.log("Created Controller");
            }
            // now copy msg.pose pos/orient etc. into other

            other.controller1.position.copy(msg.pose.controller1.pos);
            other.controller1.quaternion._x = msg.pose.controller1.orient._x;
            other.controller1.quaternion._y = msg.pose.controller1.orient._y;
            other.controller1.quaternion._z = msg.pose.controller1.orient._z;
            other.controller1.quaternion._w = msg.pose.controller1.orient._w;
            other.controller1.matrixWorldNeedsUpdate = true;
            
            other.controller2.position.copy(msg.pose.controller2.pos);
            other.controller2.quaternion._x = msg.pose.controller2.orient._x;
            other.controller2.quaternion._y = msg.pose.controller2.orient._y;
            other.controller2.quaternion._z = msg.pose.controller2.orient._z;
            other.controller2.quaternion._w = msg.pose.controller2.orient._w;
            other.controller2.matrixWorldNeedsUpdate = true;
            
            other.head.position.copy(msg.pose.head.pos);
            other.head.quaternion._x = msg.pose.head.orient._x;
            other.head.quaternion._y = msg.pose.head.orient._y;
            other.head.quaternion._z = msg.pose.head.orient._z;
            other.head.quaternion._w = msg.pose.head.orient._w;
            other.head.matrixWorldNeedsUpdate = true;

        } break;
        case "scene_files":
        case "initController":
        case "sessionRecordings":
        case "record":
        case "stopRecord":
        case "loadScene": {

        } break;
        default:
            console.log("received JSON", msg, typeof msg);
    }
}