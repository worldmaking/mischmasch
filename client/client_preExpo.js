
//////////////////////////////////////////////////////////////////////////////////////////
// COMMON GEOMETRIES
//////////////////////////////////////////////////////////////////////////////////////////

//THREE JS is now r105

let geometry = new THREE.BoxBufferGeometry(0.2, 0.2, 0.2);
let geometry2 = new THREE.BoxBufferGeometry(0.1, 0.1, 0.1);

let fontFile = 'js/three-r102/examples/fonts/helvetiker_regular.typeface.json';
//let fontFile = 'shaders/distanceConsolasNEHE.fnt';
let loadedFont;

let viveControllerPath = 'js/three-r102/examples/models/obj/vive-controller/';
let loadedController;

let viveHeadsetModelPath = "models/viveHeadset/"
let loadedHeadsetModel;

let texturesPath = "textures/";

let instBoxVShaderFile = 'shaders/instBoxShader.vert';
let instBoxFShaderFile = 'shaders/instBoxShader.frag';
let fontVShaderFile = 'shaders/font.vert';
let fontFShaderFile = 'shaders/font.frag';

let loadedInstBoxVShader;
let loadedInstBoxFShader;

let loadedFontVShader;
let loadedFontFShader

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

const GEN_GEOM_WIDTH = 0.6;
const GEN_GEOM_HEIGHT = 0.2;
const GEN_GEOM_DEPTH = 0.05;

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
   // roughness: 0.7,
    //metalness: 0.0,
   // opacity: 1,
   // transparent: false,
  //  side: THREE.DoubleSide,
   // depthWrite: false,
    blending: THREE.AdditiveBlending

    
});;

let outline_material = new THREE.MeshStandardMaterial({
    color: 0x888888,
    side: THREE.BackSide,
    blending: THREE.NormalBlending
});

let shaderMat;

let textMaterial;


/////////////////////////////////////////////
// instance globals:
/////////////////////////////////////////////
let instBoxLocationAttr, instBoxOrientationAttr, instBoxScaleAttr, instBoxColorAttr, instBoxEmissionAttr, instBoxShapeAttr;
let instBoxGeometry // a VBO really
let maxInstances = 0;
let grabbedInstances = 0;
let grabbedInstances2 = 0;
let updatingC1 = false;
let updatingC2 = false;
let grabbingC1 = false;
let grabbingC2 = false;
let instances = 50000;

//////////////////////////////////////////////////////////////////////////////////////////
// SCENE COMPONENTS
//////////////////////////////////////////////////////////////////////////////////////////


let camera, scene, renderer;
let world = new THREE.Group();
let controls;

let menu = new THREE.Group();
let ghostMeshes = new THREE.Group();
let ghostCables = new THREE.Group();
let ghostLabels = new THREE.Group();
let ghost = new THREE.Group();

let controller1, controller_1;
let ghostController1 = new THREE.Object3D();
let ghostcontroller_1 = new THREE.Object3D();
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

let user_acc = window.localStorage.getItem("user_acc");
let connectAccount = 1;

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
        controller_1: {
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

let mouse = new THREE.Vector2();

//Simple debug hack
let once = true;

let testCube = new THREE.Mesh(generic_geometry, generic_material);



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

    loadedInstBoxVShader = await loadShaders(instBoxVShaderFile);
    loadedInstBoxFShader = await loadShaders(instBoxFShaderFile);

    loadedFontVShader = await loadShaders(fontVShaderFile);
    loadedFontFShader = await loadShaders(fontFShaderFile);

    // build up the scene
    scene = new THREE.Scene();
    scene.background = new THREE.Color(0x20ff80);
    camera = new THREE.PerspectiveCamera(
        70,
        window.innerWidth / window.innerHeight,
        0.1,
        10
    );

    scene.add(camera)
    camera.position.set(0, 1.5, 0)

    //world.add(ghostMeshes);

    // Buffer Visualization

    {
        let bufferMat = new THREE.LineBasicMaterial({
            color: 0x0000ff
        });

        let bufferGeometry = new THREE.Geometry();
        // x: need to calculate y: value, z: Channel
       // +-
        bufferGeometry.vertices.push();

        let bufferLine = new THREE.Line( bufferGeometry, bufferMat );
        //scene.add( line );
    }

    /// instanceBox
    {
        
        // box spans signed-normalized range of -1..1 in each axis
        // with subdivisions in each axis
        let bufferGeometry = new THREE.BoxBufferGeometry( 1,1,1,  3,3,1 );
        
        // copying data from a simple box geometry, but you can specify a custom geometry if you want
        instBoxGeometry = new THREE.InstancedBufferGeometry();
        instBoxGeometry.index = bufferGeometry.index;
        instBoxGeometry.attributes.normal = bufferGeometry.attributes.normal;
        instBoxGeometry.attributes.position = bufferGeometry.attributes.position;
        instBoxGeometry.attributes.uv = bufferGeometry.attributes.uv;
        console.log("box", bufferGeometry)
        
        // per instance data
        let offsets = [];
        let orientations = [];
        let scales = [];
        let colors = [];
        let emission = [];
        let shapes = []; // 0==box, 1== cylinder
        let vector = new THREE.Vector4();
        let x, y, z, w;
        for ( let i = 0; i < instances; i ++ ) {
            // locations
            x = 0;
            y = 0;
            z = 0;
            //vector.set( x, y, z, 0 ).normalize();
            offsets.push( x + vector.x, y + vector.y, z + vector.z );
            // orientations
            x = 0;
            y = 0;
            z = 0;
            w = 1;
            vector.set( x, y, z, w ).normalize();
            orientations.push( vector.x, vector.y, vector.z, vector.w );

            scales.push(0,0,0)
            colors.push(0,0,0, 1);
            emission.push(1.,1.,1.,1.);

            shapes.push(0.);
        }
        instBoxLocationAttr = new THREE.InstancedBufferAttribute( new Float32Array( offsets ), 3 ).setDynamic( true );
        instBoxOrientationAttr = new THREE.InstancedBufferAttribute( new Float32Array( orientations ), 4 ).setDynamic( true );
        instBoxScaleAttr = new THREE.InstancedBufferAttribute( new Float32Array( scales ), 3 ).setDynamic( true );
        instBoxColorAttr = new THREE.InstancedBufferAttribute( new Float32Array( colors ), 4 ).setDynamic( true );
        instBoxEmissionAttr = new THREE.InstancedBufferAttribute( new Float32Array( emission ), 4 ).setDynamic( true );
        instBoxShapeAttr = new THREE.InstancedBufferAttribute( new Float32Array( shapes ), 1 ).setDynamic( true );

        instBoxGeometry.addAttribute( 'location', instBoxLocationAttr );
        instBoxGeometry.addAttribute( 'orientation', instBoxOrientationAttr );
        instBoxGeometry.addAttribute( 'scale', instBoxScaleAttr );
        instBoxGeometry.addAttribute( 'color', instBoxColorAttr );
        instBoxGeometry.addAttribute( 'emission', instBoxEmissionAttr );
        instBoxGeometry.addAttribute( 'shape', instBoxShapeAttr );
        
        let material = new THREE.RawShaderMaterial( {
            uniforms: {
                map: { value: new THREE.TextureLoader().load( 'textures/crate.gif' ) }
            },
            vertexShader: loadedInstBoxVShader,
            fragmentShader: loadedInstBoxFShader
        } );

        instBoxMesh = new THREE.Mesh( instBoxGeometry, material );
        instBoxMesh.frustumCulled = false;
	    world.add( instBoxMesh );
    }
    ///

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
    controller_1 = new THREE.ViveController(1);
    controller1.standingMatrix = renderer.vr.getStandingMatrix();
    controller_1.standingMatrix = renderer.vr.getStandingMatrix();
    controller1.addEventListener("triggerdown", onSelectStart);
    controller1.addEventListener("triggerup", onSelectEnd);
    controller_1.addEventListener("triggerdown", onSelectStart);
    controller_1.addEventListener("triggerup", onSelectEnd);
    controller1.addEventListener("gripsdown", onGrips);
    controller_1.addEventListener("gripsdown", onGrips);
    controller1.addEventListener("thumbpadup", onSpawn);
    controller_1.addEventListener("thumbpaddown", onMenuSpawn);
    controller1.addEventListener("thumbpaddown", onMenuSpawn);
    controller_1.addEventListener("thumbpadup", onSpawn);
    //document.addEventListener("keydown", onKeypress, false);
    //document.addEventListener( 'mousemove', onDocumentMouseMove, false );
   // document.addEventListener( 'mousedown', onDocumentMouseDown, false );
    scene.add(controller1);
    scene.add(controller_1);

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
        controller_1.add(controllerMesh.clone());
        // pivot.material = pivot.material.clone();
    }

    ghost.add(ghostController1);
    ghost.add(ghostcontroller_1);
    ghost.add(ghostMeshes);
    world.add(ghost);
    testCube.position.set(0,1,0);
    world.add(testCube);

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
    controller_1.add(line.clone());

    let lineGeom = new THREE.Geometry();
    lineGeom.vertices.push(new THREE.Vector3());
    lineGeom.vertices.push(new THREE.Vector3());
    let lineMat = new THREE.LineBasicMaterial({
        color: "yellow"
    });
    // uiLine = new THREE.Line(lineGeom, lineMat);
    // uiLine.name = "uiLine";

    // 'world' represents the root node of the patch:
    scene.add(world);

    // floor
    let floorGrid = new THREE.GridHelper(10, GRID_DIVISIONS);
    floorGrid.position.y = 0;
    floorGrid.material.opacity = 0.25;
    floorGrid.material.transparent = true;
   // scene.add(floorGrid);


   //Stupid hack just to get it load in the buffer

	floorTexture.wrapS = floorTexture.wrapT = THREE.RepeatWrapping; 
	floorTexture.repeat.set( 10, 10 );
	let floorMaterial = new THREE.MeshBasicMaterial( { map: floorTexture, side: THREE.DoubleSide, transparent: false, opacity: .1, } );
    let floorGeometry = new THREE.PlaneBufferGeometry(10, 10, 10, 10);
    let uvs = floorGeometry.attributes.uv.array;
    let uvscale = 2;
    for ( let i = 0, len=uvs.length; i<len; i++ ) { uvs[i] *= uvscale; }

   // makeMenu();
    //Stupid hack just to get it load in the buffer
   // world.add(menu);
    //world.remove(menu);

	let floor = new THREE.Mesh(floorGeometry, floorMaterial);
	// floor.position.y = -0.5;
	floor.rotation.x = Math.PI / 2;
    scene.add(floor);
    
    //Add Text for now
    for(let i =0; i < 1; i++){
        createLabel('Hello 00000',"center", Math.random(), Math.random(), 0.002);
    }

     createLabel('what up1!', "center", 0.5, 2);

    for(let i =0, j=0; i < 2; i++, j+=3){
        let ori = new THREE.Quaternion();
        ori.fromArray([Math.random(),Math.random(),Math.random(),Math.random()]);
        ori.normalize();

        let deltas = spawnRandomModule([0 ,0+(Math.random() * 4),0], [0,0,0,1]);
        clientSideDeltas(deltas);
    }


    // hook up server:
    connect_to_server();

    visualFeedbackSocket();

    // now we can start rendering:
    animate();

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

        // this.srcJackMesh = new THREE.Mesh(plug_geometry, outlet_material);
        // this.dstJackMesh = new THREE.Mesh(plug_geometry, inlet_material);
        this.srcJackMesh = new THREE.Mesh(boxGeom, boxMat);
        this.dstJackMesh = new THREE.Mesh(boxGeom, boxMat);
        ghostCables.add(this.srcJackMesh);
        ghostCables.add(this.dstJackMesh);
        this.srcJackMesh.userData.kind = "jack_outlet";
        this.srcJackMesh.userData.moveable = true;
        this.srcJackMesh.userData.selectable = true;
        this.srcJackMesh.userData.cable = this;
        this.srcJackMesh.userData.color = [1, 0, 0, 1];
        this.srcJackMesh.userData.shape = 1.;
        this.srcJackMesh.scale.set(CABLE_JACK_RADIUS, CABLE_JACK_RADIUS, CABLE_JACK_HEIGHT);
        this.dstJackMesh.userData.kind = "jack_inlet";
        this.dstJackMesh.userData.moveable = true;
        this.dstJackMesh.userData.selectable = true;
        this.dstJackMesh.userData.cable = this;
        this.dstJackMesh.userData.color = [0, 1, 0, 1];
        this.dstJackMesh.userData.shape = 1.;
        this.dstJackMesh.scale.set(CABLE_JACK_RADIUS, CABLE_JACK_RADIUS, CABLE_JACK_HEIGHT);

        // this.srcJackMesh.scale.set(CABLE_JACK_RADIUS*3, CABLE_JACK_RADIUS*3, CABLE_JACK_HEIGHT*3);
        // this.dstJackMesh.scale.set(CABLE_JACK_RADIUS*3, CABLE_JACK_RADIUS*3, CABLE_JACK_HEIGHT*3);

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
            linewidth: 1
        }));
        curve.mesh.castShadow = true;
        this.curve = curve;
        // TODO: this shouldn't be needed
        curve.mesh.frustumCulled = false;
        
        this.update();

        curve.mesh.userData.selectable = false;
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

    // ? are we in VR?
     if (!renderer.vr.isPresenting()){
        controls.update();
        renderer.vr.enabled = false;
     } else {
        renderer.vr.enabled = true;
     }

    if (textMaterial != undefined) {
        textMaterial.uniforms.u_time.value = performance.now() * 0.001;
    }
    // console.log(raycaster)

    render();
}
function updateUserAcc(){
    window.localStorage.setItem("user_acc", document.getElementById("formUsername").value);
    connectAccount = 1;
}
// TODO: temp, delete these:
var lastTime = 0;
var moveQ = ( new THREE.Quaternion( .5, .5, .5, 0.0 ) ).normalize();
var tmpQ = new THREE.Quaternion();
var currentQ = new THREE.Quaternion();

function render() {
    stats.begin();

    // handle incoming deltas:
    while (incomingDeltas.length > 0) {
        let delta = incomingDeltas.shift();
        enactDelta(delta);
        //console.log("incoming deltas")
    }

    updateDirty();

    // ? make sure all objects' matrices are up to date (TODO: might not be needed?)
    scene.updateMatrixWorld();

    for (let cable of allCables) {
        cable.update();
    }

    let blankPos = new THREE.Vector3();
    let blankQuat = new THREE.Quaternion();
    ghostController1.position.x = controller1.getWorldPosition(blankPos).x;
    ghostController1.position.y = controller1.getWorldPosition(blankPos).y;
    ghostController1.position.z = controller1.getWorldPosition(blankPos).z;
    
    ghostController1.quaternion.x = controller1.getWorldQuaternion(blankQuat).x;
    ghostController1.quaternion.y = controller1.getWorldQuaternion(blankQuat).y;
    ghostController1.quaternion.z = controller1.getWorldQuaternion(blankQuat).z;
    ghostController1.quaternion.w = controller1.getWorldQuaternion(blankQuat).w;

    for(let i in controller1.matrixWorld.elements){
        ghostController1.matrixWorld.elements[i] = controller1.matrixWorld.elements[i];
    }

    for(let j in controller1.matrix.elements){
        ghostController1.matrix.elements[j] = controller1.matrix.elements[j];
    }
    
    ghostController1.matrixWorldNeedsUpdate = true;

    //Objects
    cleanIntersected();

    try {

        controller1.update();
        controller_1.update();
    } catch(e) {
        //console.warn(e)
    }

    controllerGamepadControls(controller1);
    controllerGamepadControls(controller_1);

    highlightNlet(controller1);
    highlightNlet(controller_1);

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

        if(connectAccount > 0){
            let userPopup = document.getElementById("userPopup");
            
            if(user_acc == null){

                userPopup.style.display = "block";
            } else {
                userPopup.style.display = "none";
                userPose = createUserPose(user_acc);
                let message = {
                    cmd: "user_acc",
                    date: Date.now(),
                    data: user_acc
                };
                sock.send(message);
            }
            
         
            connectAccount = 0;

        }
        
        // send VR poses to the server:
        if (controller1 && controller_1) {

            // TODO: camera is probably not the right point to grab -- maybe there's somethign in the vive handling that is head position
            camera.getWorldPosition(userPose.head.pos);
            camera.getWorldQuaternion(userPose.head.orient);
            controller1.getWorldPosition(userPose.controller1.pos);
            controller1.getWorldQuaternion(userPose.controller1.orient);
            controller_1.getWorldPosition(userPose.controller_1.pos);
            controller_1.getWorldQuaternion(userPose.controller_1.orient);

            sock.send({
                cmd: "user_pose",
                date: Date.now(),
                pose: userPose
            });
        }
    }

    intersectObjects(controller1);
    intersectObjects(controller_1);
    
    var time = performance.now();
    let delta = ( time - lastTime ) / 5000;
    lastTime = time;
    tmpQ.set( moveQ.x * delta, moveQ.y * delta, moveQ.z * delta, 1 ).normalize();

    instBoxLocationAttr.needsUpdate = true;
    instBoxOrientationAttr.needsUpdate = true;
    instBoxScaleAttr.needsUpdate = true;
    instBoxColorAttr.needsUpdate = true;
    instBoxShapeAttr.needsUpdate = true;
    instBoxEmissionAttr.needsUpdate = true;
    instBoxGeometry.maxInstancedCount = maxInstances//Math.ceil(Math.random() * 5000);

    maxInstances -= grabbedInstances;
    maxInstances -= grabbedInstances2;
    grabbedInstances = 0;
    grabbedInstances2 = 0;

    


    if (!renderBypass) renderer.render(scene, camera);

    stats.end();
}

function onGrips(event) {
    let controller = event.target;
    if (controller.getButtonState("grips")) {

    }
}

function onDocumentMouseMove( event ) {
    event.preventDefault();
    mouse.x = ( event.clientX / window.innerWidth ) * 2 - 1;
    mouse.y = - ( event.clientY / window.innerHeight ) * 2 + 1;
}

function onDocumentMouseDown(event){
    event.preventDefault();
    if(event.button == 2){

    raycaster.setFromCamera(mouse, camera);
    intersects = raycaster.intersectObjects(ghostMeshes.children, true);

        if ( intersects.length > 0 ) {
            console.log("Intersected");
            let intersection = intersects[0];
            let object = intersection.object;

            outgoingDeltas.push(
                { op:"delnode", path:object.userData.path, kind:object.userData.name}
            );
        }
    }
    if(event.button == 1){
        let deltas = spawnRandomModule([0 + Math.random(), 0 + Math.random(), 0+ Math.random()], [0,0,0,1]);
        clientSideDeltas(deltas);
        //spoofList();
    }
 
}

function onKeypress(e){
    if (!renderer.vr.isPresenting()){

        let keyCode = e.which;
        if(keyCode == 83){
            for(let i =0; i < 1000; i++){
                let deltas = spawnRandomModule([0 + Math.random(), 0 + Math.random(), 0+ Math.random()], [0,0,0,1]);
                clientSideDeltas(deltas);
            }
            //spoofList();

        }    
          
        if(keyCode == 68){
            for(let i=0; i< 1; i++){

    
            let deltas = spawnRandomModule([0 + Math.random(), 0 + Math.random(), 0+ Math.random()], [0,0,0,1]);
            outgoingDeltas(deltas);
            }
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

function visualFeedbackSocket() {
    console.log('Creating socket');
    // TODO: Do not hardcode the IP 
    let vsSocket = new WebSocket('ws://localhost:8084/');
    vsSocket.onopen = function() {
           console.log('Socket open.');
        //   socket.send(JSON.stringify({message: 'What is the meaning of life, the universe and everything?'}));
        //   console.log('Message sent.')
    };
    vsSocket.onmessage = function(message) {

     //console.log('Socket server message: ', message.data);
     let ledJSON = JSON.parse(message.data);
     let ledInterleaved = ledJSON.visualFeedback;
        for(let i =0; i < 2; i+=2){ //ledInterleaved.length;
            let colorPath = ledInterleaved[i];
            let colorVal = ledInterleaved[i+1];
            console.log(colorPath);
            console.log(colorVal);

            let vsColorChager = clampTo(colorVal, -1, 1, 0, 255);

            //TODO: Take path and add value directly to outlet color

            console.log(vsColorChager); 
        }
    };
  }


/**
 * 
 * @param {Value} input value being clamped
 * @param {int} curRangeMin current range of value coming in Min
 * @param {int} curRangeMax current range of value coming in Max
 * @param {int} clampRangeMin clamp range Min
 * @param {int} clampRangeMax clamp range Max
 */

function clampTo(input, curRangeMin, curRangeMax, clampRangeMin, clampRangeMax) {
    xMax = clampRangeMax;
    xMin = clampRangeMin;
    yMax = curRangeMax;
    yMin = curRangeMin;
    percent = (input - yMin) / (yMax - yMin);

    let output = percent * (xMax - xMin) + xMin;
    return output;
}

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
           // console.log(id);

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
                other.controller_1 = controllerMesh.clone();
                scene.add(other.controller_1);
                other.head = headsetMesh.clone();
                scene.add(other.head);
                
                console.log("Created Controller");
            }
            // now copy msg.pose pos/orient etc. into other
            // ghostController1.position.copy(msg.pose.controller1.pos);
            // ghostController1.quaternion._x = msg.pose.controller1.orient._x;
            // ghostController1.quaternion._y = msg.pose.controller1.orient._y;
            // ghostController1.quaternion._z = msg.pose.controller1.orient._z;
            // ghostController1.quaternion._w = msg.pose.controller1.orient._w;
            // ghostController1.matrixWorldNeedsUpdate = true;

            other.controller1.position.copy(msg.pose.controller1.pos);
            other.controller1.quaternion._x = msg.pose.controller1.orient._x;
            other.controller1.quaternion._y = msg.pose.controller1.orient._y;
            other.controller1.quaternion._z = msg.pose.controller1.orient._z;
            other.controller1.quaternion._w = msg.pose.controller1.orient._w;
            other.controller1.matrixWorldNeedsUpdate = true;
            
            other.controller_1.position.copy(msg.pose.controller_1.pos);
            other.controller_1.quaternion._x = msg.pose.controller_1.orient._x;
            other.controller_1.quaternion._y = msg.pose.controller_1.orient._y;
            other.controller_1.quaternion._z = msg.pose.controller_1.orient._z;
            other.controller_1.quaternion._w = msg.pose.controller_1.orient._w;
            other.controller_1.matrixWorldNeedsUpdate = true;
            
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