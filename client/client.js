
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

let vShaderFile = 'shaders/shader.vert';
let fShaderFile = 'shaders/shader.frag';

let loadedVShader;
let loadedFShader;

let renderBypass = false;

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

let shaderLoader = new THREE.FileLoader();
async function loadShaders(filename) {
    return new Promise(resolve => shaderLoader.load(filename, resolve));
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

const KNOB_SWEEP = -Math.PI * 0.75;

const KNOB_TWIST_DISTANCE = 0.3;
const KNOB_SWING_DISTANCE = 0.2;

const CONTROLLER_HIT_DISTANCE = 0.03;

const FRAME_WAIT_AMOUNT = 0;

const GRID_DIVISIONS = 60;

let inlet_geometry = new THREE.CylinderBufferGeometry(NLET_RADIUS, NLET_RADIUS, NLET_HEIGHT, 8);
let outlet_geometry = inlet_geometry;
inlet_geometry.rotateX(Math.PI/2)
inlet_geometry.computeBoundingBox();

let inlet_backplate_geometry = new THREE.BoxBufferGeometry(NLET_RADIUS * 2, NLET_RADIUS * 2, NLET_HEIGHT, 8);
let outlet_backplate_geometry = inlet_backplate_geometry;
//inlet_backplate_geometry.rotateX(Math.PI/2)
inlet_backplate_geometry.computeBoundingBox();

let small_knob_geometry = new THREE.CylinderBufferGeometry(SMALL_KNOB_RADIUS, SMALL_KNOB_RADIUS, SMALL_KNOB_HEIGHT, 8);
small_knob_geometry.rotateX(Math.PI/2)
small_knob_geometry.computeBoundingBox();

let large_knob_geometry = new THREE.CylinderBufferGeometry(LARGE_KNOB_RADIUS, LARGE_KNOB_RADIUS, LARGE_KNOB_HEIGHT, 8);
large_knob_geometry.rotateX(Math.PI/2)
large_knob_geometry.computeBoundingBox();

let plug_geometry = new THREE.CylinderBufferGeometry(CABLE_JACK_RADIUS, CABLE_JACK_RADIUS, CABLE_JACK_HEIGHT, 8);
// fix anchor point
plug_geometry.translate(0, CABLE_JACK_HEIGHT/2, 0);
plug_geometry.rotateX(Math.PI/2)
plug_geometry.computeBoundingBox();

let n_switch_geometry = new THREE.BoxBufferGeometry( LARGE_KNOB_RADIUS + 0.03, LARGE_KNOB_RADIUS  + 0.03, LARGE_KNOB_HEIGHT, 8 );
n_switch_geometry.computeBoundingBox();

let n_switch_slider_geometry = new THREE.BoxBufferGeometry( NLET_HEIGHT + .01 , NLET_HEIGHT+ .01 , NLET_HEIGHT, 8 );
n_switch_slider_geometry.computeBoundingBox();

let knob_point_geometry = new THREE.BoxBufferGeometry( NLET_HEIGHT + .001 , NLET_HEIGHT+.001 , NLET_HEIGHT, 8 );
knob_point_geometry.computeBoundingBox();

let generic_geometry = new THREE.BoxBufferGeometry(0.6, 0.2, 0.05);
generic_geometry.translate(generic_geometry.parameters.width/2, -generic_geometry.parameters.height/2, -generic_geometry.parameters.depth/2);

let instancedGeometry = new THREE.InstancedBufferGeometry();
instancedGeometry.index = generic_geometry.index;
instancedGeometry.attributes.position = generic_geometry.attributes.position;


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

    
});;

let outline_material = new THREE.MeshStandardMaterial({
    color: 0x888888,
    side: THREE.BackSide,
    blending: THREE.NormalBlending
});

let shaderMat;

//////////////////////////////////////////////////////////////////////////////////////////
// SCENE COMPONENTS
//////////////////////////////////////////////////////////////////////////////////////////


let camera, scene, renderer;
let world = new THREE.Group();
let controls;

let menu = new THREE.Group();

let controller1, controller2;
let controllerMesh;

//////////////////////////////////////////////////////////////////////////////////////////
// OTHER GLOBALS
//////////////////////////////////////////////////////////////////////////////////////////


let sock;
let userPose = createUserPose();
let otherUsers = {};

let incomingDeltas = [];
let outgoingDeltas = [];

let allNodes = {};
let allCables = [];
let uiLine;
let getControllerLineLength;

let createObjFromMenu = true;
let menuNames = [];
let menuScaleSize = .4;

/**
 * Find an object in allNodes via a path
 * @param {PATH} path - path to object
 */
function getObjectByPath(path) {
    return allNodes[path];
}

// function deleteObjectByName(name){
//     //need to also remove from the world...
//     delete allNodes[name];
//     world.remove(world.children[name]);
// }

function getContainingModule(object){
    if(object.userData.isBox == true) {
        return object;
    } 
    return getContainingModule(object.parent)
}

/**
 * Adding object to allNodes[] via a path
 * @param {PATH} path - the path location of the object being added
 * @param {OBJECT} object - object to add to allNodes[]
 */
function addObjectByPath(path, object) {
    allNodes[path] = object;
}

// TODO: iterator over all nodes 
function iterateAllNodes(fun) {
    for (let node of allNodes) {
        fun(node);
    }
}

/**
 * Generate a random integer between a range (min, max)
 * @param {INT} min - minimum value for random int
 * @param {INT} max - maximum value for random int
 */
function randomIntFromInterval(min,max) // min and max included
{
    return Math.floor(Math.random()*(max-min+1)+min);
}
/**
 * Keep a value between two amounts and wrap excess
 * @param {NUMBER} n - Value to wrap
 * @param {NUMBER} m - Top value to wrap around
 */
function wrap(n,m){
    return ((n%m)+m)%m;
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

    loadedVShader = await loadShaders(vShaderFile);
    loadedFShader = await loadShaders(fShaderFile);
    console.log(loadedVShader, loadedFShader)

    shaderMat = new THREE.ShaderMaterial( {
        uniforms: {
            "mRefractionRatio": { value: 1.02 },
            "mFresnelBias": { value: 0.1 },
            "mFresnelPower": { value: 2.0 },
            "mFresnelScale": { value: 1.0 },
            "tCube": { value: null },
            "emissive": {value: 0}
        },
        vertexShader: loadedVShader,
        fragmentShader: loadedFShader,
        side: THREE.DoubleSide,
        transparent: true
    } );



    // build up the scene
    scene = new THREE.Scene();
    scene.background = new THREE.Color(0x20ff80);
    camera = new THREE.PerspectiveCamera(
        70,
        window.innerWidth / window.innerHeight,
        0.1,
        10
    );
    // TODO: does this break VR????
   

    scene.add(camera)
    camera.position.set(0, 1.5, 0)

    renderer = new THREE.WebGLRenderer({
        antialias: true,
        canvas: canvas});
    renderer.setPixelRatio(window.devicePixelRatio);
    renderer.setSize(window.innerWidth, window.innerHeight);
    renderer.gammaInput = true;
    renderer.gammaOutput = true;
    renderer.shadowMap.enabled = true;

    document.body.appendChild(renderer.domElement);
    document.body.appendChild(WEBVR.createButton(renderer));

    controls = new THREE.OrbitControls( camera, renderer.domElement );
    controls.enableDamping = true; // an animation loop is required when either damping or auto-rotation are enabled
    controls.dampingFactor = 0.25;
    controls.screenSpacePanning = false;
    controls.minDistance = 0;
    controls.maxDistance = 500;
    controls.maxPolarAngle = Math.PI / 2;

    //console.log(controls)

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
    controller2.addEventListener("thumbpaddown", onMenuSpawn);
    controller1.addEventListener("thumbpaddown", onMenuSpawn);
    controller2.addEventListener("thumbpadup", onSpawn);
    controller1.addEventListener("gripsdown", onGrips);
    controller2.addEventListener("gripsdown", onGrips);
    document.addEventListener("keydown", onKeypress, false);
    scene.add(controller1);
    scene.add(controller2);

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
        console.log("HEADSET MODEL VVVVVVVV", loadedHeadsetModel)
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

    let lineGeom = new THREE.Geometry();
    lineGeom.vertices.push(new THREE.Vector3());
    lineGeom.vertices.push(new THREE.Vector3());
    let lineMat = new THREE.LineBasicMaterial({
        color: "yellow"
    });
    uiLine = new THREE.Line(lineGeom, lineMat);
    uiLine.name = "uiLine";

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

   //Stupid hack just to get it load in the buffer
   world.add(menu);
   world.remove(menu);

	floorTexture.wrapS = floorTexture.wrapT = THREE.RepeatWrapping; 
	floorTexture.repeat.set( 10, 10 );
	let floorMaterial = new THREE.MeshBasicMaterial( { map: floorTexture, side: THREE.DoubleSide, transparent: false, opacity: .1, } );
    let floorGeometry = new THREE.PlaneBufferGeometry(10, 10, 10, 10);
    let uvs = floorGeometry.attributes.uv.array;
    let uvscale = 2;
    for ( let i = 0, len=uvs.length; i<len; i++ ) { uvs[i] *= uvscale; }



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

          

function animate() {
  //renderer.setAnimationLoop(render);

   requestAnimationFrame( animate );

    // are we in VR?
     if (!renderer.vr.isPresenting()){
        controls.update();
        renderer.vr.enabled = false;
     } else {
        renderer.vr.enabled = true;
     }

    render();
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
    if (!renderBypass) renderer.render(scene, camera);

    //console.log("hi")

    stats.end();
}

function onGrips(event) {
    let controller = event.target;
    if (controller.getButtonState("grips")) {

    }
}

function onKeypress(e){
    if (!renderer.vr.isPresenting()){

        let keyCode = e.which;
        if(keyCode == 83){
            let deltas = spawnRandomModule([0 + Math.random(), 0 + Math.random(), 0+ Math.random()], [0,0,0,1]);
            clientSideDeltas(deltas);
        }       
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