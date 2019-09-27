const url = window.location.href.split('//')[1].split(':')[0];
console.log('url', url)
let once = 1;
let vrContextID;
let audioContextID;
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

function hashCode(str) { // java String#hashCode
    var hash = 0;
    for (var i = 0; i < str.length; i++) {
       hash = str.charCodeAt(i) + ((hash << 5) - hash);
    }
    return hash;
} 

function intToRGB(i){
    var c = (i & 0x00FFFFFF)
        .toString(16)
        .toUpperCase();

    return "00000".substring(0, 6 - c.length) + c;
}

function colorFromString(str) {
    let int = Math.abs(hashCode(str));
    let hue = int % 360;
    let result = [];
    new THREE.Color(`hsl(${hue}, 35%, 50%)`).toArray(result);
    return result;
}

function hexColorFromString(str) {
    return "#" + intToRGB(hashCode(str));
}


///////////////////////////////////////////
// Globals
///////////////////////////////////////////

// Editing
let incomingDeltas = [];
let outgoingDeltas = [];

let editEvents = [];

let userPose = createUserPose();

// Virtual scene
let ghostScene = new THREE.Group();
ghostScene.name = "ghostScene"

let ghostControllers = []

let ghostWorld = new THREE.Group();
ghostWorld.name = "ghostWorld"
//ghostWorld.rotation.set(0, Math.PI, 0, "XYZ")
ghostScene.add(ghostWorld);

let ghostMenu = new THREE.Group();
ghostScene.add(ghostMenu);
ghostMenu.name = "ghostMenu"

// Networking
let sock;

// Three.js components
let camera, scene, renderer;
let orbitControls;

// Instancing components
const MAX_BOX_INSTANCE_CAPACITY = 10000;
let currentBoxInstanceCount = 0;
let instBoxGeometry;
let instBoxLocationAttr, instBoxOrientationAttr, instBoxScaleAttr, instBoxColorAttr, instBoxEmissionAttr, instBoxShapeAttr;
let instBoxMesh;

const MAX_QUAD_INSTANCE_CAPACITY = 10000;
let currentQuadInstanceCount = 1;
let instQuadGeometry;
let instQuadLocationAttr, instQuadOrientationAttr, instQuadScaleAttr, instQuadTexcoordAttr;
let instQuadMesh;

// VR components
let VRcontrollers = [];

// STYLES
const NUM_CABLE_SEGMENTS = 30;
// how tall the cable jack cylinders are
const CABLE_JACK_HEIGHT = 0.03;
const CABLE_JACK_RADIUS = CABLE_JACK_HEIGHT * 0.4;
// how far the control poitns for cables are from the inlets outlets
// effects how 'straight' the cables are as come out of inlets/outlets
const CABLE_CONTROL_POINT_DISTANCE = 0.1;

const BACKPANEL_DEPTH = 0.02
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

let label_material = new THREE.MeshStandardMaterial({
    color: 0x000000,
    transparent: true,
    opacity: 0.4,
    side: THREE.DoubleSide
    //, blending: THREE.AdditiveBlending

});
// let fontFile = 'js/three-r102/examples/fonts/helvetiker_regular.typeface.json';
// let loadedFont;
let fontTexture;
let fontData;
let textMaterial;
const LABEL_Z_OFFSET = 0.001;
const LABEL_SCALING_FACTOR = 0.001;

// let plug_geometry = new THREE.CylinderBufferGeometry(CABLE_JACK_RADIUS, CABLE_JACK_RADIUS, CABLE_JACK_HEIGHT, 8);
// // fix anchor point
// plug_geometry.translate(0, CABLE_JACK_HEIGHT/2, 0);
// plug_geometry.rotateX(Math.PI/2)
// plug_geometry.computeBoundingBox();

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

function createUserPose(id=0) {
    return {
        id: id,
        head: {
            pos: new THREE.Vector3(),
            orient: new THREE.Quaternion()
        },
        // TODO: make this moer generic
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

let tempMatrix = new THREE.Matrix4()
function reparentWithTransform(object, oldparent, newparent) {
    tempMatrix.getInverse(newparent.matrixWorld);
    tempMatrix.premultiply(oldparent.matrixWorld);
    object.applyMatrix(tempMatrix)
    newparent.add(object)
}

//////////////////////////////////////////////////////////////////////////////////////////
// LOADERS
//////////////////////////////////////////////////////////////////////////////////////////

async function loadShader(filename) {
    return new Promise(resolve => new THREE.FileLoader().load(filename, resolve));
}

async function loadTexture(filename) {
    return new Promise(resolve => new THREE.TextureLoader().load(filename, resolve));
}

async function loadFont(fontFile) {
    return new Promise(resolve => new THREE.FontLoader().load(fontFile, resolve));
}

async function loadDistanceFont(fontFile) {
    return new Promise(resolve => bm_loadFont(fontFile, function(err, font) {
        resolve(font);
    }));
}

async function loadOBJ(path) {
    return new Promise(resolve => new THREE.OBJLoader().load(path, resolve));
}

//////////////////////////////////////////////////////////////////////////////////////////
// BOOT SEQUENCE
//////////////////////////////////////////////////////////////////////////////////////////

init();
async function init() {


    // init 3D world
    await init_threejs();
    addFloorGrid();
    
    await initFont();
    await initInstanceBoxMesh();

    scene.add(ghostScene)
    ghostScene.visible = false;

    await init_steamvr();


    document.addEventListener("keydown", onKeypress, false);
    document.addEventListener( 'mousemove', onDocumentMouseMove, false );
    document.addEventListener( 'mousedown', onDocumentMouseDown, false );

    // now we can start rendering:
    animate();

    // connect to server
    serverConnect();
}

async function init_threejs() {
    scene = new THREE.Scene();

    camera = new THREE.PerspectiveCamera(
        70,
        window.innerWidth / window.innerHeight,
        0.1,
        10
    );
    camera.position.set(0, 1.5, 2);
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
    orbitControls.target.set(0, 1.5, 0)
    orbitControls.update();

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
    floorGrid.name ="floorGrid"
    scene.add(floorGrid);

    floorGrid.add(new THREE.AxesHelper( 0.1 ));
}

async function initFont() {
   // loadedFont = await loadFont(fontFile);
    let fontVShaderFile = 'shaders/font.vert';
    let fontFShaderFile = 'shaders/font.frag';
    let loadedFontVShader = await loadShader(fontVShaderFile);
    let loadedFontFShader = await loadShader(fontFShaderFile);
    fontTexture = await loadTexture('shaders/CONSOLATTF.png');
    fontData = await loadDistanceFont('shaders/CONSOLA.TTF-msdf.json');
    textMaterial = new THREE.ShaderMaterial( {
        uniforms: {
            "u_texture": { value: fontTexture },
            //"u_time": { value: 0 },
            //"u_color": {value: 0 }
        },
        vertexShader: loadedFontVShader,
        fragmentShader: loadedFontFShader,
        side: THREE.DoubleSide,
        transparent: true,
        blending:THREE.AdditiveBlending, depthWrite: false,
        derivatives: true,
    } );
}

async function initInstanceBoxMesh() {

    let quadGeometry = new THREE.PlaneBufferGeometry(1,1, 1,1);
    instQuadGeometry = new THREE.InstancedBufferGeometry();
    instQuadGeometry.index = quadGeometry.index;
    instQuadGeometry.attributes.normal = quadGeometry.attributes.normal;
    instQuadGeometry.attributes.position = quadGeometry.attributes.position;
    instQuadGeometry.attributes.uv = quadGeometry.attributes.uv;

    instQuadLocationAttr = new THREE.InstancedBufferAttribute( new Float32Array( MAX_QUAD_INSTANCE_CAPACITY * 3 ), 3 ).setDynamic( true );
    instQuadOrientationAttr = new THREE.InstancedBufferAttribute( new Float32Array( MAX_QUAD_INSTANCE_CAPACITY * 4 ), 4 ).setDynamic( true );
    instQuadScaleAttr = new THREE.InstancedBufferAttribute( new Float32Array( MAX_QUAD_INSTANCE_CAPACITY * 3 ), 3 ).setDynamic( true );
    instQuadTexcoordAttr = new THREE.InstancedBufferAttribute( new Float32Array( MAX_QUAD_INSTANCE_CAPACITY * 4 ), 4 ).setDynamic( true );

    // initialize instance buffer:
    for ( let i = 0; i < MAX_QUAD_INSTANCE_CAPACITY; i ++ ) {
        // set some sane defaults for attrs:
        // set W component of orientations:
        instQuadOrientationAttr.array[i * instQuadOrientationAttr.itemSize + 3] = 1;
        
        instQuadTexcoordAttr.array[i * instQuadTexcoordAttr.itemSize + 0] = 0.;
        instQuadTexcoordAttr.array[i * instQuadTexcoordAttr.itemSize + 1] = 0.;
        instQuadTexcoordAttr.array[i * instQuadTexcoordAttr.itemSize + 2] = 1.;
        instQuadTexcoordAttr.array[i * instQuadTexcoordAttr.itemSize + 3] = 1.;

        instQuadScaleAttr.array[i * instQuadScaleAttr.itemSize + 0] = 0.1;
        instQuadScaleAttr.array[i * instQuadScaleAttr.itemSize + 1] = 0.1;
        instQuadScaleAttr.array[i * instQuadScaleAttr.itemSize + 2] = 0.1;
    }

    // add these attrs to the instaned buffer:
    instQuadGeometry.addAttribute( 'location', instQuadLocationAttr );
    instQuadGeometry.addAttribute( 'orientation', instQuadOrientationAttr );
    instQuadGeometry.addAttribute( 'scale', instQuadScaleAttr );
    instQuadGeometry.addAttribute( 'texcoord', instQuadTexcoordAttr );

    let instQuadMaterial = new THREE.RawShaderMaterial( {
        uniforms: {
            u_texture: { value: fontTexture }
        },
        vertexShader: await loadShader('shaders/instQuadShader.vert'),
        fragmentShader: await loadShader('shaders/instQuadShader.frag'),

        side: THREE.DoubleSide,
        transparent: true,
        blending:THREE.AdditiveBlending, depthWrite: false,
        derivatives: true,
    } );

    instQuadMesh = new THREE.Mesh( instQuadGeometry, instQuadMaterial );
    instQuadMesh.frustumCulled = false;
    scene.add( instQuadMesh );

    // box spans signed-normalized range of -1..1 in each axis
    // with subdivisions in each axis
    let bufferGeometry = new THREE.BoxBufferGeometry( 1,1,1,  3,3,1 );

    instBoxGeometry = new THREE.InstancedBufferGeometry();
    instBoxGeometry.index = bufferGeometry.index;
    instBoxGeometry.attributes.normal = bufferGeometry.attributes.normal;
    instBoxGeometry.attributes.position = bufferGeometry.attributes.position;
    instBoxGeometry.attributes.uv = bufferGeometry.attributes.uv;

    instBoxLocationAttr = new THREE.InstancedBufferAttribute( new Float32Array( MAX_BOX_INSTANCE_CAPACITY * 3 ), 3 ).setDynamic( true );
    instBoxOrientationAttr = new THREE.InstancedBufferAttribute( new Float32Array( MAX_BOX_INSTANCE_CAPACITY * 4 ), 4 ).setDynamic( true );
    instBoxScaleAttr = new THREE.InstancedBufferAttribute( new Float32Array( MAX_BOX_INSTANCE_CAPACITY * 3 ), 3 ).setDynamic( true );
    instBoxColorAttr = new THREE.InstancedBufferAttribute( new Float32Array( MAX_BOX_INSTANCE_CAPACITY * 4 ), 4 ).setDynamic( true );
    //instBoxEmissionAttr = new THREE.InstancedBufferAttribute( new Float32Array( emission ), 4 ).setDynamic( true );
    instBoxShapeAttr = new THREE.InstancedBufferAttribute( new Float32Array( MAX_BOX_INSTANCE_CAPACITY * 1 ), 1 ).setDynamic( true );

    // initialize instance buffer:
    for ( let i = 0; i < MAX_BOX_INSTANCE_CAPACITY; i ++ ) {
        // set some sane defaults for attrs:

        // set W component of orientations:
        instBoxOrientationAttr.array[i * instBoxOrientationAttr.itemSize + 3] = 1;
        
        instBoxColorAttr.array[i * instBoxColorAttr.itemSize + 3] = 1;

        instBoxScaleAttr.array[i * instBoxScaleAttr.itemSize + 0] = 1;
        instBoxScaleAttr.array[i * instBoxScaleAttr.itemSize + 1] = 1;
        instBoxScaleAttr.array[i * instBoxScaleAttr.itemSize + 2] = 1;
    }

    // add these attrs to the instaned buffer:
    instBoxGeometry.addAttribute( 'location', instBoxLocationAttr );
    instBoxGeometry.addAttribute( 'orientation', instBoxOrientationAttr );
    instBoxGeometry.addAttribute( 'scale', instBoxScaleAttr );
    instBoxGeometry.addAttribute( 'color', instBoxColorAttr );
    // instBoxGeometry.addAttribute( 'emission', instBoxEmissionAttr );
    instBoxGeometry.addAttribute( 'shape', instBoxShapeAttr );

    
    let instBoxVShaderFile = 'shaders/instBoxShader.vert';
    let instBoxFShaderFile = 'shaders/instBoxShader.frag';
    let loadedInstBoxVShader = await loadShader(instBoxVShaderFile);
    let loadedInstBoxFShader = await loadShader(instBoxFShaderFile);
    let material = new THREE.RawShaderMaterial( {
        uniforms: {
            //map: { value: new THREE.TextureLoader().load( 'textures/crate.gif' ) }
        },
        vertexShader: loadedInstBoxVShader,
        fragmentShader: loadedInstBoxFShader
    } );

    instBoxMesh = new THREE.Mesh( instBoxGeometry, material );
    instBoxMesh.frustumCulled = false;
    scene.add( instBoxMesh );
}


async function init_steamvr() {
    let viveControllerPath = 'js/three-r102/examples/models/obj/vive-controller/';
    let viveHeadsetModelPath = "models/viveHeadset/"
    let loadedControllerModel = await loadOBJ(viveControllerPath + "vr_controller_vive_1_5.obj");
    let viveTexturePNG = await loadTexture(viveControllerPath + 'onepointfive_texture.png');
    let viveSpecularPNG = await loadTexture(viveControllerPath + 'onepointfive_spec.png');
    let loadedHeadsetModel = await loadOBJ(viveHeadsetModelPath + "V2.obj");
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

    
    // init the input devices & their handlers:
    for (let i=0; i<2; i++) {
        VRcontrollers[i] = initVRController(i);
        ghostControllers[i] = initGhostController(i);

        VRcontrollers[i].userData.ghostController = ghostControllers[i]
    }

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
    }

    {
        let controllerMesh = loadedControllerModel.children[0];
        controllerMesh.material.map = viveTexturePNG;
        controllerMesh.material.specularMap = viveSpecularPNG;
        controllerMesh.castShadow = true;
        controllerMesh.receiveShadow = true;

        // let pivot = new THREE.Mesh(new THREE.IcosahedronBufferGeometry(0.01, 2));
        // pivot.name = 'pivot';
        // //pivot.position.y = - 0.016;
        // pivot.position.z = - 0.043;
        // pivot.rotation.x = Math.PI / 5.5;
        // controllerMesh.add(pivot);
        // // pivot.material = pivot.material.clone();

        // beam:
        let geometry = new THREE.BufferGeometry().setFromPoints([
            new THREE.Vector3(0, 0, 0),
            new THREE.Vector3(0, 0, -1)
        ]);
        let line = new THREE.Line(geometry);
        line.name = "VRControllerBeam";
        line.scale.z = 1;

        for (let i=0; i<2; i++) {
            VRcontrollers[i].add(controllerMesh.clone());
            VRcontrollers[i].add(line.clone());
        }
    }
}


function initVRController(id=0) {
    

    function onVRControllerTriggerDown(event) {
        let controller = event.target; 
        controller.userData.isTriggerDown = true;
    }

    function onVRControllerTriggerUp(event) {
        let controller = event.target;
        controller.userData.isTriggerDown = false;
    }

    function onVRThumbPadDown(event) {
        let controller = event.target;
        controller.userData.isThumbPadDown = true;
    }

    function onVRThumbPadUp(event) {
        let controller = event.target;
        controller.userData.isThumbPadDown = false;
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

    controller.userData.state = "default"
    controller.userData.intersection = null;
    controller.userData.updateStateMachine = function() {
        let intersection = this.intersection;
        switch(this.state) {
            case "dragging": {

               // logonly("drag", this.dragState.target.name, this.dragState.target.matrix.elements)

               // TODO: twist & zoom according to the this.thumbPadDX etc.

                if (!this.isTriggerDown) {
                    // release 
                    let object = this.dragState.target
                    let parent = this.dragState.oldparent
                    this.state = "default";
                    log("back to default state")

                    // reparent target
                    reparentWithTransform(object, this.ghostController, parent)
                    this.dragState = null
                }
            } break;
            case "twiddling": {
                if (this.isTriggerDown) {
                    // do the twiddle
                    let object = this.twiddleState.target;


                    // modulate value based on relative poses of controller & object
                    // as well as this.thumbPadX etc.?
                    let controllerPos = new THREE.Vector3();
                    let objectPos = new THREE.Vector3();
                    controller.getWorldPosition(controllerPos);
                    object.getWorldPosition(objectPos); 

                    let value = 0;
                    let dist = controllerPos.distanceTo(objectPos);value

                    const KNOB_SWEEP = -Math.PI * 0.75;                  
                    const KNOB_TWIST_DISTANCE = 0.3;
                    const KNOB_SWING_DISTANCE = 0.2;

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

                    outgoingDeltas.push(
                        { op:"propchange", path: object.userData.path, name:"value", from: object.userData.value, to: value });

                } else {
                    // release 
                    this.state = "default";
                    this.twiddleState = null
                    log("back to default state")
                }

            } break;
            case "cabling": {
                if (this.isTriggerDown) {

                    let object = this.cablingState.target;
                    let parent = this.cablingState.oldparent;

                    if(object.kind == "outlet"){
                    //     outgoingDeltas.push(
                    //         { op:"connect", path: object.userData.path, src:, dst: });
                    }
                    

                    if(object.kind == "inlet"){

                    }
                    reparentWithTransform(object, this.ghostController, parent);

                    //check if jack is pointing at a valid point (aka inlet or outlet)
                    // if so disconnect from ghost controller and connect to object the ray interacts with
                    // else leave it dangling

                    //if inlet create new jack parented to controller
                    //else check for jack and pick up 

                    //if holding jack and intersects with outlet or inlet 
                    //connect
                    // else drop in space

                    
                   
                } else{
                     // release 
                     this.state = "default";
                     log("back to default state")
                }

            } break;
            case "menu": {
                if (!this.isTriggerDown) {
                    // release 
                    this.state = "default";
                    log("back to default state")
                }
            } break;
            // case "multiselect"
            // etc.
            default: {
                if (intersection) {
                    let object = intersection.object
                    let kind = object.userData.kind
                    let name = object.name
                    object.userData.isUnderCursor = true;

                    if (this.isTriggerDown) {
                        // did we select a knob, a cable, a port, or a box?

                        if (object.userData.isBackPanel) {
                            // switch context to parent:
                            object = object.parent;
                            kind = object.userData.kind
                            let parent = object.parent;

                            // enter "dragging mode"
                            this.state = "dragging"
                            this.dragState = {
                                target: object,
                                oldparent: object.parent,
                            }
                            // reparent target to controller:
                            reparentWithTransform(object, parent, this.ghostController)


                        } else if (object.userData.isTiddleable) {
                            // go into twidding mode

                            log("start twiddling", name)
                            this.twiddleState = {
                                target: object,
                            }
                            this.state = "twiddling"
                            
                            // cache current rotations so we can make it relative:
                            this.rotation = controller.rotation.clone();
                            object.userData.rotation = object.rotation.clone();

                        } else if (kind == "outlet") {
                            this.state = "cabling";
                            this.cablingState = {
                                target: object,
                                oldparent: object.parent, // aka SRC
                            }
                            // need to create new jacks
                            reparentWithTransform(object, parent, this.ghostController);
                        } else if (kind == "inlet") {
                            this.state = "cabling";
                            this.cablingState = {
                                target: object,
                                oldparent: object.parent, // aka DST
                            }
                            // need to create new jacks
                            reparentWithTransform(object, parent, this.ghostController);
                        } else if(kind == "jack_outlet"){
                            // needs to be a dragging state but also checking for interesections of inlets and outlets
                        } else if(kind == "jack_inlet"){

                        } else {

                            log("kind", object.userData.kind)
                        }

                    }
                } else if (this.isTriggerDown) {
                    // trigger squeeze but nothing selected. 
                    // Show menu?
                    this.state = "menu";
                    log("enter menu")
                }
            }
        }
    }

    return controller;
}

function initGhostController(id=0) {
    
    let ghostController = new THREE.Object3D();
    ghostController.name = "ghostController"+id
    ghostController.userData.controllerID = id
    // NOTE:  disable Three.js automatic matrix management
    // because we are going to set the matrix of these manually ourselves
    // (copying the matrix from the actual VR controllers)
    ghostController.matrixAutoUpdate = false;
    ghostScene.add(ghostController);

    let debugGeom = new THREE.Mesh(new THREE.BoxGeometry(0.01,0.01,0.2));
    debugGeom.name = 'ghostControllerDebugObject';
    ghostController.add(debugGeom);

    return ghostController;
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

                    // send to server that this client is a browser client
                    this.send({
                        cmd: 'clientType',
                        data: 'vrContext'
                    });
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


/**
 * create a label with 3D space
 * @param {VALUE} text - text for the label
 * @param {VALUE} x - x location
 * @param {VALUE} y - y location
 * @param {VALUE} z - z location
 * @param {value} scale - OPTIONAL: single scale size (default: 0.009)
 */
function createLabel(text, x=0, y=1.5, z=0, uniformScaling=1){
    uniformScaling *= LABEL_SCALING_FACTOR;
    let mesh;
    // a geometry of packed bitmap glyphs, 
    // word wrapped to 240px (10 characters) and center-aligned

    //default pixel width is 24px
    let wrapWidth = 240.0;

    //https://github.com/Jam3/three-bmfont-text
    let geometry = bm_createGeometry({
        width: wrapWidth,
        align: 'center',
        font: fontData
    })
    // change text and other options as desired
    // the options sepcified in constructor will
    // be used as defaults
    geometry.update({ text: text });
    // the resulting layout has metrics and bounds
    // console.log(geometry.layout.height)
    // console.log(geometry.layout.descender)
        
    // now do something with our mesh!
    mesh = new THREE.Mesh(geometry, textMaterial);
    mesh.name = "label_"+text
    mesh.userData.isLabel = true;

    mesh.scale.set(uniformScaling, uniformScaling, uniformScaling);

    //center text: scale * Wrap Width (width) /2 (ex. .009 * 240 / 2)
    let centerX = (wrapWidth * uniformScaling)/2.0;
    if (x=="center") {
        mesh.position.set(-centerX, y, z);
    } else {
        mesh.position.set(x,y,z);
    }
    return mesh;
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
            container.userData.instanceShape = SHAPE_CYLINDER;
            
            // label:
            let label = createLabel(name, -0.5, 0, 1+LABEL_Z_OFFSET, 4);
            container.add(label);

            
        } break;
        case "outlet":{
            container = new THREE.Mesh(boxGeom, boxMat);
            container.scale.set(NLET_RADIUS, NLET_RADIUS, NLET_HEIGHT);
            container.userData.color = [1, 0, 0, 1];
            container.userData.instanceShape = SHAPE_CYLINDER;
            
            // label:
            let label = createLabel(name, -0.5, 0, 1+LABEL_Z_OFFSET, 4);
            container.add(label);
        } break;
        case "large_knob":{
            container = new THREE.Mesh(boxGeom, boxMat);
            container.scale.set(LARGE_KNOB_RADIUS, LARGE_KNOB_RADIUS, NLET_HEIGHT);
            container.userData.instanceShape = SHAPE_CYLINDER
            container.userData.color = colorFromString(name);
            container.userData.isTiddleable = true;

            // label:
            let label = createLabel(name, -0.5, 0, 1+LABEL_Z_OFFSET, 4);
            container.add(label);
        }break;
        case "small_knob":{
            container = new THREE.Mesh(boxGeom, boxMat);
            container.scale.set(SMALL_KNOB_RADIUS, SMALL_KNOB_RADIUS, NLET_HEIGHT);
            container.userData.instanceShape = SHAPE_CYLINDER
            container.userData.color = colorFromString(name);
            container.userData.isTiddleable = true;

            // label:
            let label = createLabel(name, -0.5, 0, 1+LABEL_Z_OFFSET, 4);
            container.add(label);
        }break;
        case "n_switch": {
            container = new THREE.Mesh(boxGeom, boxMat);
            container.scale.set(NSWITCH_WIDTH, NSWITCH_HEIGHT, NSWITCH_DEPTH);
            container.userData.color = colorFromString(name);
            container.userData.slideable = true;
            container.userData.instanceShape = SHAPE_BOX;
            
            // label:
            let label = createLabel(name, -0.5, 0, 1+LABEL_Z_OFFSET, 4);
            container.add(label);
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
            box.userData.color = colorFromString(name);
            box.userData.instanceShape = SHAPE_BOX
            box.name = "_box_"+name
            container.add(box);

            // label:
            let label = createLabel(name, 0, 0, LABEL_Z_OFFSET, 1);
            container.add(label);
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

function cableUpdate(cableMesh) {
    let ud = cableMesh.userData;
    let src = ud.src;
    let dst = ud.dst;
    let srcJackMesh = ud.srcJackMesh, dstJackMesh = ud.dstJackMesh;
    let positions = ud.positions;
    let curve = ud.curve;


    // set up the positions array for the endpoitns and control points of the curve:
    
    if (src) {
        // cable is connected to a source
        // use src (outlet) orientation for our cable orientation 
        src.getWorldQuaternion(srcJackMesh.quaternion);
        // use src (outlet) position for our start point (position[0])
        src.getWorldPosition(positions[0]);
        // set positions[1] control point accordingly:
        positions[1]
            .set(0, 0, (NLET_HEIGHT + CABLE_CONTROL_POINT_DISTANCE) / 2)
            .applyQuaternion(srcJackMesh.quaternion)
            .add(positions[0]);
        // set source jack position accordingly
        srcJackMesh.position.copy(positions[0])
        //Color Set
        cableMesh.material.color.copy(src.material.color);
    } else {
        // dangling jack case
        let q = new THREE.Quaternion();
        // get the jack's orientation
        srcJackMesh.getWorldQuaternion(q);
        // derive the cable start point from the jack's position
        srcJackMesh.getWorldPosition(positions[0]);
        // derive positions[1] (cable control point)
        positions[1]
            .set(0, 0, (NLET_HEIGHT + CABLE_CONTROL_POINT_DISTANCE) / 2)
            .applyQuaternion(q)
            .add(positions[0]);
        //Reset Color
        cableMesh.material.color.setRGB(211,211,211);
    }

    if (dst) {
        dst.getWorldPosition(positions[3]);
        dst.getWorldQuaternion(dstJackMesh.quaternion);
        positions[2]
            .set(0, 0, (NLET_HEIGHT + CABLE_CONTROL_POINT_DISTANCE) / 2)
            .applyQuaternion(dstJackMesh.quaternion)
            .add(positions[3]);
        dstJackMesh.position.copy(positions[3])
    } else {
        let q = new THREE.Quaternion();
        dstJackMesh.getWorldQuaternion(q);
        // get cable end point from the srcJackMesh
        dstJackMesh.getWorldPosition(positions[3]);
        // derive positions[2] (cable control point)
        positions[2]
            .set(0, 0, (NLET_HEIGHT + CABLE_CONTROL_POINT_DISTANCE) / 2)
            .applyQuaternion(q)
            .add(positions[3])
    }

    // TODO There must be a better API for this!
    let position = cableMesh.geometry.attributes.position;
    let point = new THREE.Vector3()
    for (let i = 0; i < NUM_CABLE_SEGMENTS; i++) {
        let t = i / (NUM_CABLE_SEGMENTS - 1);
        curve.getPoint(t, point);
        // if (i==0) console.log(point)
        position.setXYZ(i, point.x, point.y, point.z);
    }
    position.needsUpdate = true;
}

function enactDeltaConnect(world, delta) {

    let src = getObjectByPath(world, delta.paths[0]);
    let dst = getObjectByPath(world, delta.paths[1]); 



    // make a cable:
    let geom = new THREE.BufferGeometry();
    let vertices = new Float32Array(NUM_CABLE_SEGMENTS * 3);
    geom.addAttribute('position', new THREE.BufferAttribute(vertices, 3));

    let positions = [
        new THREE.Vector3(),
        new THREE.Vector3(),
        new THREE.Vector3(),
        new THREE.Vector3() 
    ];
    let curve = new THREE.CatmullRomCurve3(positions);
    //curve.curveType = 'catmullrom'; //
    //curve.curveType = 'centripetal'; 
    curve.curveType = 'chordal';

    let cableMesh = new THREE.Line(geom, new THREE.LineBasicMaterial({
        color: 0xD3D3D3,
        opacity: 1,
        linewidth: 1
    }));
    cableMesh.castShadow = true;
    // TODO: this shouldn't be needed
    cableMesh.frustumCulled = false;

    
    let srcJackMesh = new THREE.Mesh(boxGeom, boxMat);
    let dstJackMesh = new THREE.Mesh(boxGeom, boxMat);
    srcJackMesh.userData.kind = "jack_outlet";
    // this.srcJackMesh.userData.moveable = true;
    // this.srcJackMesh.userData.selectable = true;
    // this.srcJackMesh.userData.cable = this;
    srcJackMesh.userData.color = [1, 0, 0, 1];
    srcJackMesh.userData.instanceShape = SHAPE_CYLINDER;
    srcJackMesh.scale.set(CABLE_JACK_RADIUS, CABLE_JACK_RADIUS, CABLE_JACK_HEIGHT);
    dstJackMesh.userData.kind = "jack_inlet";
    // this.dstJackMesh.userData.moveable = true;
    // this.dstJackMesh.userData.selectable = true;
    // this.dstJackMesh.userData.cable = this;
    dstJackMesh.userData.color = [0, 1, 0, 1];
    dstJackMesh.userData.instanceShape = SHAPE_CYLINDER;
    dstJackMesh.scale.set(CABLE_JACK_RADIUS, CABLE_JACK_RADIUS, CABLE_JACK_HEIGHT);
    cableMesh.add(srcJackMesh);
    cableMesh.add(dstJackMesh);


    cableMesh.userData.curve = curve;
    cableMesh.userData.positions = positions;
    cableMesh.userData.src = src;
    cableMesh.userData.dst = dst;
    cableMesh.userData.srcJackMesh = srcJackMesh;
    cableMesh.userData.dstJackMesh = dstJackMesh;
    cableMesh.userData.isCable = true;

    cableUpdate(cableMesh);

    scene.add(cableMesh); 
}



/*
    { op:"propchange", path:"x", name:"pos", from:[x, y, z], to:[x, y, z] }
*/
function enactDeltaObjectPos(delta) {
    // assert(delta.op == "propchange")
    // assert(delta.name == "pos")
    let object = getObjectByPath(ghostScene, delta.path);

    // TODO: are positions relative to parent or global?
    object.position.set(delta.to[0], delta.to[1], delta.to[2])

//     // assert (object, "path not found")
//     object.userData.fromPos = delta.to;
//     // TODO: assert delta.from is roughly equal to current object.position

//     // what the object should be part of:
//     let parent = object.userData.originalParent;
//     if (parent == undefined) parent = object.parent;
//     // temporarily move object to world space to set the position:
//     ghostMeshes.add(object);
//    // console.log(ghostMeshes)
//     // set the position & update matrices:
//     object.position.fromArray(delta.to);
//     object.matrixWorldNeedsUpdate = true;
//     object.updateMatrixWorld();
//     // now re-attach object to proper parent:
//     parent.add(object);
}

/*
    { op:"propchange", path:"x", name:"orient", from:[x, y, z, w], to:[x, y, z, w] }
*/
function enactDeltaObjectOrient(delta) {
    // assert(delta.op == "propchange")
    // assert(delta.name == "orient")

    let object = getObjectByPath(delta.path);
    
    object.quaternion.set(delta.to[0], delta.to[1], delta.to[2], delta.to[3])
    // // assert (object, "path not found")
    // object.userData.fromOri = delta.to;
    // // TODO: assert delta.from is roughly equal to current object.quaternion

    // // what the object should be part of:
    // let parent = object.userData.originalParent;
    // if (parent == undefined) parent = object.parent;
    // // temporarily move object to world space to set the position:
    // ghostMeshes.add(object);
    // // set the position & update matrices:
    // object.quaternion.fromArray(delta.to);
    // object.matrixWorldNeedsUpdate = true;
    // object.updateMatrixWorld();
    // // now re-attach object to proper parent:
    // parent.add(object);
}

/*
    { op:"propchange", path:"x", name:"value", from:x, to:y }
*/
function enactDeltaObjectValue(delta) {
    // let object = getObjectByPath(delta.path);
    // let kind = object.userData.kind; // small_knob, nswitch, etc.
    // let value = delta.to;
    // switch(kind){
    //     case "small_knob":
    //     case "large_knob": {
    //         value = value.toFixed(2);
    //         object.userData.value = value;
    //         //console.log("Back from server Value", value)
    //         //Update once server says:
            
    //         // if value == 0, angle should be -sweep
    //         // if value == 1, angle should be sweep 
    //         let derived_angle = KNOB_SWEEP * ((value*2) - 1);
            
    //         // set rotation of knob by this angle, and normal axis of knob:
    //         object.quaternion.setFromAxisAngle( new THREE.Vector3(0, 0, 1), derived_angle);
    //     } break;
    //     case "n_switch": {
    //         object.userData.value = value;
    //         for(let child of object.children){
    //             if(child.userData.selectable){
    //                 child.position.fromArray( object.userData.positions[value -1]);
    //             }
    //         }
    //     } break;
    //     default:{

    //     } break;
    // }
}

//////////////////////////////////////////////////////////////////////////////////////////
// DYNAMICS
//////////////////////////////////////////////////////////////////////////////////////////

function animate() {
    //renderer.setAnimationLoop(render);
    requestAnimationFrame( animate );

    // handle scene changes from server:
    {
        // handle incoming deltas:
        while (incomingDeltas.length > 0) {
            let delta = incomingDeltas.shift();
            //logonly(JSON.stringify(delta, null, ""))
            // TODO: derive which world to add to:
            enactDelta(ghostWorld, delta);
            //log("incoming deltas")
            once = true;
        }

        // re-layout:
        updateDirty(ghostScene, false);

        // TODO: delete once cables are instanced:
        updateDirty(scene, false);
    }

    // Interaction:
    try {
        for (let i=0; i<2; i++) {
            let controller = VRcontrollers[i]
            let ghostController = ghostControllers[i];
            // update VR controller pose:
            controller.update();
            // copy pose to ghostController:
            ghostController.matrix.copy(controller.matrix);

            {
                // get thumbpad state:
                let gamepad = controller.getGamepad();
                if (gamepad) {
                    let button0 = gamepad.buttons[0];
                    // consider the thumbpad state:
                    if (button0.touched) {
                        if (!controller.userData.isThumbPadTouched) {
                            controller.userData.isThumbPadTouched = true;
                            //console.log("touchstart", gamepad.axes[1])
                            controller.userData.thumbPadDX = 0;
                            controller.userData.thumbPadDY = 0;
            
                        } else {
                            //console.log("drag", gamepad.axes[1])
                            controller.userData.thumbPadDX = gamepad.axes[0] - controller.userData.thumbPadX;
                            controller.userData.thumbPadDY = gamepad.axes[1] - controller.userData.thumbPadY;
                        }
            
                        controller.userData.thumbPadX = gamepad.axes[0];
                        controller.userData.thumbPadY = gamepad.axes[1];
            
                    } else if (controller.userData.isThumbPadTouched) {
                        controller.userData.isThumbPadTouched = false;
                        controller.userData.thumbPadDX = 0;
                        controller.userData.thumbPadDY = 0;
                        // touch release event
                        //console.log("release")
                    }
                }
            }

            // handle interaction only if visible:
            if (controller.visible) {
                let beamIntersection = getFirstIntersection(controller);
                let beam = controller.getObjectByName("VRControllerBeam");
                if (beamIntersection && beamIntersection.object) {
                    //logonly("hit object", beamIntersection.object.name)

                    // stretch beam to fit:
                    beam.scale.z = beamIntersection.distance;

                    // what happens now depends on app state, button state, etc.
                    controller.userData.intersection = beamIntersection;

                } else {
                    // reset beam length:
                    beam.scale.z = 1;
                    controller.userData.intersection = null;
                }

                // check for overlap.
                {
                    // could do this while traversing the scene, checking for each geom if it overlaps with a bounding box/sphere of the controller
                    // see THREE.Box3.intersectsBox and THREE.Box3.intersectsSphere

                    // alternatively, could simply check if the raycaster's intersection distance is lower than a certain amount
                }

                // run the controller State Machine
                controller.userData.updateStateMachine();
            }
        }
    } catch(e) {
        console.warn(e)
    }

    // update GPU:
    {
        // update the instancing buffers
        currentBoxInstanceCount = 0;
        currentQuadInstanceCount = 0;
        copyGhostToInstances(ghostScene);

        instBoxLocationAttr.needsUpdate = true;
        instBoxOrientationAttr.needsUpdate = true;
        instBoxScaleAttr.needsUpdate = true;
        instBoxColorAttr.needsUpdate = true;
        instBoxShapeAttr.needsUpdate = true;
        //instBoxEmissionAttr.needsUpdate = true;


        instQuadLocationAttr.needsUpdate = true;
        instQuadOrientationAttr.needsUpdate = true;
        instQuadScaleAttr.needsUpdate = true;
        instQuadTexcoordAttr.needsUpdate = true;

        instBoxGeometry.maxInstancedCount = currentBoxInstanceCount;
        instQuadGeometry.maxInstancedCount = currentQuadInstanceCount;
    }
    {

    }

    // handle VR device state
    if (renderer.vr.isPresenting()){
        renderer.vr.enabled = true;
    } else {
        orbitControls.update();
        renderer.vr.enabled = false;
    }

    // draw:
    stats.begin();
    // draw everything
    renderer.render(scene, camera);
    stats.end();

    if (sock && sock.socket && sock.socket.readyState === 1) {
        // send state back to server

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

        // TODO: user account stuff

        // send VR poses to the server:
        if (renderer.vr.enabled) {
            camera.getWorldPosition(userPose.head.pos);
            camera.getWorldQuaternion(userPose.head.orient);
            VRcontrollers[0].getWorldPosition(userPose.controller1.pos);
            VRcontrollers[0].getWorldQuaternion(userPose.controller1.orient);
            VRcontrollers[1].getWorldPosition(userPose.controller2.pos);
            VRcontrollers[1].getWorldQuaternion(userPose.controller2.orient);

            sock.send({
                cmd: "user_pose",
                date: Date.now(),
                pose: userPose,
                id: vrContextID
            });
        }
    }
}

const vector3_unitX = new THREE.Vector3( 1, 0, 0 );
const vector3_unitY = new THREE.Vector3( 0, 1, 0 );
const vector3_unitZ = new THREE.Vector3( 0, 0, 1 );

// src and dst would, I presume, be direction vectors??
// vec3, vec3 -> quat
function getRotationTo(src, dst) {
    let q = new THREE.Quaternion();

    src = src.clone().normalize();
    dst = dst.clone().normalize();
    let d = src.dot(dst);

    if (d >= 1.0) {
        return q;
    }

    if (d < (1e-6 - 1.0)) {
        //                   // Generate an axis
        //                   Vector3 axis = Vector3::UNIT_X.crossProduct(*this);
        //                   if (axis.isZeroLength()) // pick another if colinear
        //                       axis = Vector3::UNIT_Y.crossProduct(*this);
        //                   axis.normalise();
        //                   q.FromAngleAxis(Radian(Math::PI), axis);

        // Generate an axis
        let axis = vector3_unitX.cross(src);
        if (axis.length() == 0.0) {
            axis = vector3_unitY.cross(src);
        }
        axis.normalize();

        q.fromAxisAngle(axis, Math.PI);
    } else {
        //               Real s = Math::Sqrt( (1+d)*2 );
        //               Real invs = 1 / s;

        //               Vector3 c = v0.crossProduct(v1);

        //               q.x = c.x * invs;
        //               q.y = c.y * invs;
        //               q.z = c.z * invs;
        //               q.w = s * 0.5;
        //               q.normalise();

        let s = Math.sqrt((1 + d) * 2);
        let invs = 1 / s;
        let c = src.cross(dst);

        q.x = (c.x * invs);
        q.y = (c.y * invs);
        q.z = (c.z * invs);
        q.w = (s * 0.5);
        q.normalize();

    }


    return q;
}

function copyGhostToInstances(parent) {
    
    let pos = new THREE.Vector3();
    let scale = new THREE.Vector3();
    let quat = new THREE.Quaternion();
    for (let o of parent.children) {

        // copy anything that is supposed to be instanced:
        if (o.userData.isCable) {
            let curve = o.userData.curve;
            let ts = 1 / (NUM_CABLE_SEGMENTS);
            let p0 = new THREE.Vector3();
            let p1 = new THREE.Vector3();
            let tangent = new THREE.Vector3();

            let points = curve.getSpacedPoints(NUM_CABLE_SEGMENTS+1);

            // turn each segment into a cylinder:
            for (let j=0; j<NUM_CABLE_SEGMENTS; j++) {
                let i = currentBoxInstanceCount;
                let i3 = i * 3;
                let i4 = i * 4;

                let t0 = j * ts;
                let t1 = (j + 1) * ts;
                let t = (j + 0.5) * ts;
                 curve.getPoint(t0, p0);
                 curve.getPoint(t1, p1);
                pos.lerpVectors(p0, p1, 0.5);

               // p0.copy(points[j])
               // p1.copy(points[j+1])
               // pos.copy(p0);

                let tan0 = curve.getTangent(t0);
                let tan1 = curve.getTangent(t1);

                quat = getRotationTo(tan0, tan1);

                // let length = p0.distanceTo(p1);


                // tangent.copy(p1).sub(p0).normalize();
                // let normal = new THREE.Vector3(tangent.y, tangent.z, tangent.x);
                // let cotangent = new THREE.Vector3();
                // cotangent.crossVectors(normal, tangent);
                // let mat = new THREE.Matrix4();
                // mat.makeBasis(cotangent, normal, tangent);


                // quat.setFromRotationMatrix(mat)
                // //quat.setFromAxisAngle(tangent, 0);
                // //if (j == 5) console.log(quat)



                // copy to instance:
                instBoxLocationAttr.array[i3 + 0] = pos.x;
                instBoxLocationAttr.array[i3 + 1] = pos.y;
                instBoxLocationAttr.array[i3 + 2] = pos.z;
                
                instBoxOrientationAttr.array[i4 + 0] = quat.x;
                instBoxOrientationAttr.array[i4 + 1] = quat.y;
                instBoxOrientationAttr.array[i4 + 2] = quat.z;
                instBoxOrientationAttr.array[i4 + 3] = quat.w;
                
                instBoxScaleAttr.array[i3 + 0] = CABLE_JACK_RADIUS;
                instBoxScaleAttr.array[i3 + 1] = CABLE_JACK_RADIUS;
                instBoxScaleAttr.array[i3 + 2] = CABLE_JACK_RADIUS;

                instBoxColorAttr.array[i4 + 0] = tan0.x+0.5;
                instBoxColorAttr.array[i4 + 1] = tan0.y+0.5;
                instBoxColorAttr.array[i4 + 2] = tan0.z+0.5; //o.material.color.b;
                instBoxColorAttr.array[i4 + 3] = o.material.color.a;

                instBoxShapeAttr.array[i] = SHAPE_CYLINDER;

                currentBoxInstanceCount++;
            }

        } 
        if (o.userData.isLabel) {
            //console.log(o)
            

            // get pose of object:
            o.matrixWorld.decompose(pos, quat, scale);

            // need to dig into the label geometry to figure out what to do with the quads... 
            let geom = o.geometry; // instance of TextGeometry
            // these arrays have 8 items per character in the string:
            let positions = geom.attributes.position.array;
            // they are the x,y coordinates of the four corners of the quad
            let uvs = geom.attributes.uv.array;
            // they are the texture coordinates of the glyph into the font atlas

            for (let q=0; q<positions.length; q+=8) {
                // a specific glyph, as 4 XY pairs
                // TODO: convert to a position & scale for instance
                // everything also needs to be transformed by the o.matrixWorld

                let i = currentQuadInstanceCount;
                let i3 = i * 3;
                let i4 = i * 4;

                let x0 = positions[q+0];
                let y0 = positions[q+5];
                let x1 = positions[q+4];
                let y1 = positions[q+1];
                let xdim = (x1-x0);
                let ydim = (y0-y1);

                instQuadLocationAttr.array[i3 + 0] = pos.x + x0*scale.x;
                instQuadLocationAttr.array[i3 + 1] = pos.y + -y0*scale.y;
                instQuadLocationAttr.array[i3 + 2] = pos.z + 0.001;
                
                instQuadOrientationAttr.array[i4 + 0] = quat.x;
                instQuadOrientationAttr.array[i4 + 1] = quat.y;
                instQuadOrientationAttr.array[i4 + 2] = quat.z;
                instQuadOrientationAttr.array[i4 + 3] = quat.w;

                instQuadTexcoordAttr.array[i4 + 0] = uvs[q+0]
                instQuadTexcoordAttr.array[i4 + 1] = uvs[q+5]
                instQuadTexcoordAttr.array[i4 + 2] = uvs[q+4]
                instQuadTexcoordAttr.array[i4 + 3] = uvs[q+1]
                
                instQuadScaleAttr.array[i3 + 0] = xdim*scale.x;
                instQuadScaleAttr.array[i3 + 1] = ydim*scale.y;
                instQuadScaleAttr.array[i3 + 2] = 1;

                currentQuadInstanceCount++;
            }
        }
        
        if (o.userData.instanceShape !== undefined) {
            let i = currentBoxInstanceCount;
            let i3 = i * 3;
            let i4 = i * 4;
            
            // get pose of object:
            o.matrixWorld.decompose(pos, quat, scale);
            
            // copy to instance:
            instBoxLocationAttr.array[i3 + 0] = pos.x;
            instBoxLocationAttr.array[i3 + 1] = pos.y;
            instBoxLocationAttr.array[i3 + 2] = pos.z;
            
            instBoxOrientationAttr.array[i4 + 0] = quat.x;
            instBoxOrientationAttr.array[i4 + 1] = quat.y;
            instBoxOrientationAttr.array[i4 + 2] = quat.z;
            instBoxOrientationAttr.array[i4 + 3] = quat.w;
            
            instBoxScaleAttr.array[i3 + 0] = scale.x;
            instBoxScaleAttr.array[i3 + 1] = scale.y;
            instBoxScaleAttr.array[i3 + 2] = scale.z;

            if (o.userData.color) {
                instBoxColorAttr.array[i4 + 0] = o.userData.color[0]
                instBoxColorAttr.array[i4 + 1] = o.userData.color[1]
                instBoxColorAttr.array[i4 + 2] = o.userData.color[2]
                instBoxColorAttr.array[i4 + 3] = o.userData.color[3]

                if (o.userData.isUnderCursor) {
                    // TODO: HACK!
                    // probaby want a separate instance attribute to handle things like this
                    instBoxColorAttr.array[i4 + 0] *= 2
                    instBoxColorAttr.array[i4 + 1] *= 2
                    instBoxColorAttr.array[i4 + 2] *= 2;
                }
            } else {
                instBoxColorAttr.array[i4 + 0] = 0.5
                instBoxColorAttr.array[i4 + 1] = 0.5
                instBoxColorAttr.array[i4 + 2] = 0.5
                instBoxColorAttr.array[i4 + 3] = 1
            }
            instBoxShapeAttr.array[i] = o.userData.instanceShape;

            currentBoxInstanceCount++;
        }

        copyGhostToInstances(o);
    }
}


// this function will re-layout any modules marked as dirty
function updateDirty(parent, isDirty) {
    
    for (let o of parent.children) {

        o.userData.isUnderCursor = false;

        // on the way down
        if (o.userData.isDirty) {
            isDirty = true;
            //log("isDirty", o.name, o.userData.kind)
        }

        if (o.userData.isCable) cableUpdate(o);

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

function doModuleLayout(mod) {

    // skip the backpanel:
    // TODO: also need to skip the label...
    let widgets = mod.children.slice(2);
    let backpanel = mod.children[0];
    let label = mod.children[1];
    let numchildren = widgets.length;

    let numcols = Math.ceil(Math.sqrt(numchildren));
    let numrows = Math.ceil(numchildren / numcols);
    // special-case small modules:
    if (numchildren <= 4) {
        numcols = numchildren;
        numrows = 1;
    }
    // extra row for label:
    numrows++;
    let LARGEST_MODULE = LARGE_KNOB_RADIUS;
    let widget_diameter = LARGEST_MODULE;
    let widget_padding = LARGEST_MODULE / 2;
    let grid_spacing = widget_diameter + widget_padding;

    if (!numcols) log(grid_spacing, numchildren, numrows, numcols)

    backpanel.scale.set(grid_spacing * numcols, grid_spacing * numrows, BACKPANEL_DEPTH);
    // reset anchor to top left corner:
    backpanel.position.set(
        ((grid_spacing * numcols) /2) - (grid_spacing /2) ,
        (-(grid_spacing * numrows) /2) + (grid_spacing /2), 
        -BACKPANEL_DEPTH/2);

    label.position.set(
            0,
            0, 
            0);

    for (let r = 1, i=0; r<numrows; r++) {
        for (let c=0; c<numcols && i < numchildren; c++, i++) {
            //log("adding child " + i + " of " + numchildren + " at ", c, r)
            let widget = widgets[i];
            widget.position.x = ((grid_spacing * c));
            widget.position.y = (-(grid_spacing * r));
            widget.position.z = NLET_HEIGHT/2;
        }
    }
}

function onServerMessage(msg, sock) {
    switch (msg.cmd) {
        case "deltas": {
            // insert into our TODO list:
            incomingDeltas.push.apply(incomingDeltas, msg.data);
        } break;

        // server assigns an iid for our session. use this to route controller and HMD data to local max client. 
        // case "assignID":{
             
        // }
        // break
        case "contexts":{
            console.log(msg.data)
            vrContextID = msg.data.vrContext
            audioContextID = msg.data.audioContext
            localHandshake()
        }
        break;
        default:
           // log("received JSON", msg, typeof msg);
    }
}

function onKeypress(e) {

    switch (e.which) {
        case 71: {
            ghostScene.visible = !ghostScene.visible;
        } break;
        default:
            log("key press", e.which)
    }

    if (!renderer.vr.isPresenting()){

    }
}

function onDocumentMouseMove(e) {
    //console.log(e);
    // note: can disable orbitControls with:
    // to disable zoom
    //orbitControls.enableZoom = false;
    // to disable rotation
    //orbitControls.enableRotate = false;
    // to disable pan
    //orbitControls.enablePan = false;
}
function onDocumentMouseDown(e) {

}


/// handshake with max_client running on the same machine
function localHandshake() {
    try {
        if (window.location.hostname/* == "localhost"*/) {
            sock = new Socket({
                reload_on_disconnect: true,
                reconnect_period: 1000,
                hostname: "localhost",
                port: 8083,
                onopen: function () {
                    //this.send({ cmd: "getdata", date: Date.now() });
                    log("connected to maxClient");

                    // send to server that this client is a browser client
                    this.send({
                        cmd: 'handshake',
                        data: vrContextID
                    });
                    // request scene:
                    // this.send({
                    //     cmd: "get_scene",
                    //     date: Date.now()
                    // });
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

localHandshake()
