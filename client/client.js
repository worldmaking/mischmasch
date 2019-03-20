//////////////////////////////////////////////////////////////////////////////////////////
// MODULES DEFINITIONS
//////////////////////////////////////////////////////////////////////////////////////////

// couldn't figure out how to properly load the modules.json file in js in browser, sorry! Did this below for now...

let UI = {
        "range":["small_knob", "large_knob", "tuning_knob", "slider"],
        "switches":["momentary","n_switch"],
        "input":["inlet","trigger"],
        "output":["outlet","line_level"],
        "led":"led"    
      }
let modules = {
        "comparator": {
          "A": "inlet", "B": "inlet", "max": "outlet", "min":"outlet"
        },
        "noise": {
          "noise":"outlet"
        },
        "vca": {
          "in":"inlet","cv":"inlet","trim":"small_knob","bias":"small_knob"
        },
        "lfo": {
          "rate":"small_knob", "sine":"outlet","phasor":"outlet","pulse":"outlet"
        },
        "ffm":{
          "cv1":"inlet","index_cv":"inlet","cv2":"inlet","feedback_cv":"inlet","vco1":"large_knob","waveform1":{"n_switch":["Sine","Phasor","Triangle"]}, "vco2":"large_knob", "waveform2":{"n_switch":["Sine","Phasor","Triangle"]},"index":"small_knob","feedback":"small_knob","vco_1":"outlet","vco_2":"outlet","master":"outlet"
        },
        "outs":{
          "in_1(mono)":"inlet", "in_2(stereo)":"inlet","volume":"large_knob","left":"outlet","right":"outlet"
        },
        "sample_and_hold":{
          "in":"inlet","trigger":"inlet","small_knob":"threshold"
        },
        "freevoib":{
          "feedback1":"small_knob","feedback2":"small_knob","damping":"small_knob","spread":"small_knob","in":"inlet","out":"outlet"
        },"foldcomb":{"signal":"inlet","delay_cv":"inlet","a_cv":"inlet","b_cv":"inlet","c_cv":"inlet","out":"outlet"
        },
        "logic":{
          "A":"inlet","B":"inlet","not_A":"outlet","not_B":"outlet","and":"outlet","bool_A":"outlet","bool_B":"outlet","or":"outlet","xor":"outlet"
        },"shaper":{
          "signal":"inlet","min_cv":"inlet","max_cv":"inlet","fold":"outlet","wrap":"outlet","clip":"outlet"
        },"complex_compare":{
          "A":"inlet","B":"inlet","bias_cv":"inlet","bias":"small_knob","max":"outlet","min":"outlet","diff":"outlet"
  
        }
    
  }



//////////////////////////////////////////////////////////////////////////////////////////
// COMMON GEOMETRIES
//////////////////////////////////////////////////////////////////////////////////////////

let geometry = new THREE.BoxBufferGeometry(0.2, 0.2, 0.2);
let geometry2 = new THREE.BoxBufferGeometry(0.1, 0.1, 0.1);

let fontFile = 'js/three-r102/examples/fonts/helvetiker_regular.typeface.json';
let loadedFont;

let viveControllerPath = 'js/three-r102/examples/models/obj/vive-controller/';
let loadedController;

// turn FontLoader into something we can await:
async function loadFont(fontFile) {
    return new Promise(resolve => new THREE.FontLoader().load(fontFile, resolve));
}

async function loadOBJ(path){
    return new Promise(resolve => new THREE.OBJLoader().load(path, resolve));
}

let viveTextureLoader = new THREE.TextureLoader();
viveTextureLoader.setPath(viveControllerPath);
let viveTexturePNG, viveSpecularPNG;
async function loadViveTexture(filename){
    return new Promise(resolve => viveTextureLoader.load(filename, resolve));
}

//////////////////////////////////////////////////////////////////////////////////////////
// COMMON MATERIALS
//////////////////////////////////////////////////////////////////////////////////////////

const LABEL_SIZE = .05;
const CONTROL_POINT_DISTANCE = 0.03;
const NUM_CABLE_SEGMENTS = 40;

const NLET_RADIUS = 0.025;
const NLET_HEIGHT = 0.01;

const LARGE_KNOB_RADIUS = 0.055;
const LARGE_KNOB_HEIGHT = 0.02;

const SMALL_KNOB_RADIUS = 0.035;
const SMALL_KNOB_HEIGHT = 0.02;

// let inlet_geometry = new THREE.BoxBufferGeometry(0.05, 0.03, 0.05);
// let outlet_geometry = new THREE.BoxBufferGeometry(0.05, 0.03, 0.05);

let inlet_geometry = new THREE.CylinderGeometry( NLET_RADIUS, NLET_RADIUS, NLET_HEIGHT, 8 );
let outlet_geometry = inlet_geometry;
inlet_geometry.computeBoundingBox();

let small_knob_geometry = new THREE.CylinderGeometry( SMALL_KNOB_RADIUS, SMALL_KNOB_RADIUS, SMALL_KNOB_HEIGHT, 8 );
small_knob_geometry.computeBoundingBox();

let large_knob_geometry = new THREE.CylinderGeometry( LARGE_KNOB_RADIUS, LARGE_KNOB_RADIUS, LARGE_KNOB_HEIGHT, 8 );
large_knob_geometry.computeBoundingBox();

let plug_geometry = new THREE.CylinderGeometry( CONTROL_POINT_DISTANCE*0.2, CONTROL_POINT_DISTANCE*0.2, CONTROL_POINT_DISTANCE, 8 );
plug_geometry.computeBoundingBox();

let generic_geometry = new THREE.BoxBufferGeometry(0.4, 0.2, 0.05);
generic_geometry.translate(generic_geometry.parameters.width/2, -generic_geometry.parameters.height/2, -generic_geometry.parameters.depth/2);

let label_material = new THREE.MeshStandardMaterial({
    color: 0x000000,
    transparent: true,
    opacity: 0.4,
    side: THREE.DoubleSide
    //, blending: THREE.AdditiveBlending
        
});

//////////////////////////////////////////////////////////////////////////////////////////
// SCENE COMPONENTS
//////////////////////////////////////////////////////////////////////////////////////////


let camera, scene, renderer;
let world = new THREE.Group();
// temp hack
//world.position.set(-2, 0, -1);
//world.rotateY(-Math.PI/2.)

let controller1, controller2;


//////////////////////////////////////////////////////////////////////////////////////////
// OTHER GLOBALS
//////////////////////////////////////////////////////////////////////////////////////////

let allNodes = {};
let allCables = [];

let raycaster = new THREE.Raycaster(), intersected = [];

// temp variables to save allocations
let tempMatrix = new THREE.Matrix4();
let point = new THREE.Vector3();
let delta;



//////////////////////////////////////////////////////////////////////////////////////////
// BOOT SEQUENCE
//////////////////////////////////////////////////////////////////////////////////////////

init();
async function init() {

    // load & wait for required resources:
    loadedFont = await loadFont(fontFile);
    loadedController = await loadOBJ(viveControllerPath + "vr_controller_vive_1_5.obj");
    viveTexturePNG = await loadViveTexture('onepointfive_texture.png');
    viveSpecularPNG = await loadViveTexture('onepointfive_spec.png');

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
    controller1 = new THREE.ViveController( 0 );
    controller2 = new THREE.ViveController( 1 );
    controller1.standingMatrix = renderer.vr.getStandingMatrix();
    controller2.standingMatrix = renderer.vr.getStandingMatrix();
    controller1.addEventListener("triggerdown", onSelectStart);
    controller1.addEventListener("triggerup", onSelectEnd);
    controller2.addEventListener("triggerdown", onSelectStart);
    controller2.addEventListener("triggerup", onSelectEnd);
    controller1.addEventListener("thumbpadup", onSpawn);
    controller2.addEventListener("thumbpadup", onSpawn);
    scene.add(controller1);
    scene.add(controller2);

    {
        let controllerMesh = loadedController.children[0];
        controllerMesh.material.map = viveTexturePNG;
        controllerMesh.material.specularMap = viveSpecularPNG;
        controllerMesh.castShadow = true;
        controllerMesh.receiveShadow = true;
    
        let pivot = new THREE.Mesh( new THREE.IcosahedronBufferGeometry( 0.01, 2 ) );
        pivot.name = 'pivot';
        //pivot.position.y = - 0.016;
        //pivot.position.z = - 0.043;
        //pivot.rotation.x = Math.PI / 5.5;
        controllerMesh.add( pivot );
        controller1.add( controllerMesh.clone() );
        controller2.add( controllerMesh.clone() );
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
    let floorGrid = new THREE.GridHelper(10, 10);
    floorGrid.position.y = 0;
    floorGrid.material.opacity = 0.25;
    floorGrid.material.transparent = true;
    scene.add(floorGrid);


    //Input JSON files to be parsed on generations
    generateScene(patch1);

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
            color: 0x00ff00,
            roughness: 0.7,
            metalness: 0.0,
            opacity: 0.3,
            transparent: true,
            side: THREE.DoubleSide,
            depthWrite: false,
            blending: THREE.AdditiveBlending
            
        });

        this.srcCtrlPt = new THREE.Mesh( plug_geometry, outlet_material );
        this.dstCtrlPt = new THREE.Mesh( plug_geometry, inlet_material );
        world.add(this.srcCtrlPt);
        world.add(this.dstCtrlPt);
        this.srcCtrlPt.userData.moveable = true;
        this.srcCtrlPt.userData.selectable = true;
        this.srcCtrlPt.userData.cable = this;
        this.srcCtrlPt.userData.kind = "jack_outlet";
        this.dstCtrlPt.userData.moveable = true;
        this.dstCtrlPt.userData.selectable = true;
        this.dstCtrlPt.userData.cable = this;
        this.dstCtrlPt.userData.kind = "jack_inlet";

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
            color: 0x00ff00,
            opacity: 1,
            linewidth: 2
        }));
        curve.mesh.castShadow = true;
        this.curve = curve;
        // TODO: this shouldn't be needed
        curve.mesh.frustumCulled = false;
        
        this.update();
        
        curve.mesh.userData.moveable = true;
        world.add(curve.mesh)
    }

    update() {

        if (this.src) {
            this.src.getWorldPosition(this.positions[0]);
            this.positions[1]
                .set(0, -(NLET_HEIGHT + CONTROL_POINT_DISTANCE)/2, 0)
                .applyQuaternion(this.src.getWorldQuaternion())
                .add(this.positions[0]);
            this.srcCtrlPt.position.copy(this.positions[1]);
            this.srcCtrlPt.quaternion.copy(this.src.getWorldQuaternion());
        } else {
            // derive positions[0] from the srcCtrlPt
            this.srcCtrlPt.getWorldPosition(this.positions[1]);
            this.positions[0]
                .set(0, (NLET_HEIGHT + CONTROL_POINT_DISTANCE)/2, 0)
                .applyQuaternion(this.srcCtrlPt.getWorldQuaternion())
                .add(this.positions[1])
        }

        if (this.dst) {
            this.dst.getWorldPosition(this.positions[3]);
            this.positions[2]
                .set(0, (NLET_HEIGHT + CONTROL_POINT_DISTANCE)/2, 0)
                .applyQuaternion(this.dst.getWorldQuaternion())
                .add(this.positions[3]);

            this.dstCtrlPt.position.copy(this.positions[2]);
            this.dstCtrlPt.quaternion.copy(this.dst.getWorldQuaternion());
        } else {
            // derive positions[3] from the srcCtrlPt
            this.dstCtrlPt.getWorldPosition(this.positions[2]);
            this.positions[3]
                .set(0, -(NLET_HEIGHT + CONTROL_POINT_DISTANCE)/2, 0)
                .applyQuaternion(this.dstCtrlPt.getWorldQuaternion())
                .add(this.positions[2])
        }
        ////////////////////

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
        if (kind == "jack_outlet") {
            object.userData.cable.src = null;
        } else if (kind == "jack_inlet") {
            object.userData.cable.dst = null;
        } 

        tempMatrix.getInverse(controller.matrixWorld);
        let parent = object.parent;
        object.matrix.premultiply(parent.matrixWorld);
        object.matrix.premultiply(tempMatrix);
        object.matrix.decompose(object.position, object.quaternion, object.scale);
        if (object.material)
        object.material.emissive.b = 1;
        
        controller.userData.selected = object;
        controller.userData.parent = parent;
        controller.add(object); //removes from previous parent
    }

    
    if (object && !object.userData.moveable) {
        let kind = object.userData.kind;
        if (kind == "outlet") {
            // create a new line
            // line's src == object
            // now set object = line.dstCtrlPt
            let cable = new Cable(object, null);
            object = cable.dstCtrlPt;
            controller.userData.selected = object;
            allCables.push(cable);

        } else if (kind == "inlet") {
            //...
            let cable = new Cable(null, object);
            object = cable.srcCtrlPt;
            controller.userData.selected = object;
            allCables.push(cable);
        }
        controller.add(object); //removes from previous parent
    }
}

function onSelectEnd(event) {
    let controller = event.target;
    if (controller.userData.selected !== undefined) {
        let parent = controller.userData.parent;
        let object = controller.userData.selected;

        object.matrix.premultiply(controller.matrixWorld);
        tempMatrix.getInverse(parent.matrixWorld);
        object.matrix.premultiply(tempMatrix);
        object.matrix.decompose(object.position, object.quaternion, object.scale);
        object.material.emissive.b = 0;
        //world.add(object);
        parent.add(object);
        controller.userData.selected = undefined;

        // if it is a jack, see if we can hook up?
        if (object.userData.kind == "jack_outlet") {

            let intersections = getIntersections(object, 0, 1, 0);
            if (intersections.length > 0) {
                let intersection = intersections[0];
                let o = intersection.object;
                if (o.userData.kind == "outlet") {
                    // we have a hit! disconnect
                    object.userData.cable.src = o;
                }
            }
    

        } else if (object.userData.kind == "jack_inlet") {
            
            let intersections = getIntersections(object, 0, -1, 0);
            if (intersections.length > 0) {
                let intersection = intersections[0];
                let o = intersection.object;
                if (o.userData.kind == "inlet") {
                    // we have a hit! disconnect
                    object.userData.cable.dst = o;
                } 
            }
        }

    }
}

function onSpawn(event){
    let controller = event.target;
    if(controller.getButtonState('thumbpad') === undefined) return;
    if(controller.getButtonState('trigger') == false){
        generateNode(world); 
    }
     
}


function getIntersections(controller, x, y, z) {
    tempMatrix.identity().extractRotation(controller.matrixWorld);
    raycaster.ray.origin.setFromMatrixPosition(controller.matrixWorld);
    raycaster.ray.direction.set(x, y, z).applyMatrix4(tempMatrix);
    // argument here is just any old array of objects
    // 2nd arg is recursive (recursive breaks grabbing)
    let intersections = raycaster.intersectObjects(world.children, true);
    while(intersections.length > 0 && !intersections[0].object.userData.selectable) intersections.shift();
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
        if(object.material.emissive)
        object.material.emissive.r = 1;
        intersected.push(object);
        line.scale.z = intersection.distance;
    } else {
        line.scale.z = 1;
    }
}

function cleanIntersected() {
    while (intersected.length) {
        let object = intersected.pop();
        if(object.material.emissive)
        object.material.emissive.r = 0;
    }
}
        
function generateLabel(message) {
    let shapes = loadedFont.generateShapes(message, LABEL_SIZE);
    let shapeGeometry = new THREE.ShapeBufferGeometry(shapes);
    shapeGeometry.computeBoundingBox();

    text = new THREE.Mesh(shapeGeometry, label_material);
    
    return text;
}

function generateNode(parent, node, name) {
    let container;

    if(node === undefined || name === undefined){
        let pos = controller1.getWorldPosition();
        let quat = controller1.getWorldQuaternion();
        let tilt = new THREE.Quaternion();
        tilt.setFromAxisAngle(new THREE.Vector3(1., 0., 0.), -0.25);
        quat.multiply(tilt);
        let rel = new THREE.Vector3(-generic_geometry.parameters.width/2, generic_geometry.parameters.height*1.2, -.1);
        pos.add(rel.applyQuaternion(quat));
        node = { 
                "_props": { "kind": "blank", 
                "pos": [pos.x, pos.y, pos.z],
                "orient": [quat.x, quat.y, quat.z, quat.w]}      
        }
    }

    //Having Materials inside styles at the top causes it use the same mess across all objects
    let generic_material = new THREE.MeshStandardMaterial({
        color: Math.random() * 0xffffff,
        roughness: 0.7,
        metalness: 0.0,
        opacity: 0.3,
        transparent: true,
        side: THREE.DoubleSide,
        depthWrite: false,
        blending: THREE.AdditiveBlending
        
    });

    let knob_material = new THREE.MeshStandardMaterial({
        color: Math.random() * 0xf44242,
        roughness: 0.7,
        metalness: 0.0,
        opacity: 0.3,
        transparent: true,
        side: THREE.DoubleSide,
        depthWrite: false,
        blending: THREE.AdditiveBlending
        
    });
    let inlet_material = generic_material
    let outlet_material = generic_material
    
    
    let props = node._props;

    let type = props.kind



    //console.log(props.kind)
/*
    for (var elements in modules){
        let type = props.kind   
        //console.log(type)
        if (type === elements)
        console.log(type,modules[type])

        // let label = Object.keys(modules[type])

        // console.log(label)


        // console.log(Object.keys(modules[type]))
        console.log(Object.values(modules[type]))

        // for (var elements in type){
        //     console.log(modules[type])
        // }
    }

    */


    // if(props.kind ){
    //     let type = props.kind;
    //     console.log(type)


    //     for (var elements in modules){

    //         if (type = elements)
    //         console.log(elements)
    //     }

    // }

    // for (var type in props) {
  
    //     // let moduleType = type.kind
    //     console.log(type)
      
    //     let moduleSpec = modules.modules[type]
    //     console.log(moduleSpec)
      
      
    //   }

    if (modules.hasOwnProperty(props.kind)){

        for (var parameter in modules[type])
        let UI_Type = modules[type][parameter];
    }

    // TODO this switch needs to operate on "UI_Type" ^^^, NOT "props.kind"
    switch(props.kind) {
        case "large_knob": {
            container = new THREE.Mesh(large_knob_geometry, knob_material);
            container.castShadow = true;
            container.receiveShadow = true;
            container.position.fromArray([
                LARGE_KNOB_RADIUS, 
                -generic_geometry.parameters.height - LARGE_KNOB_HEIGHT/2, 
                -LARGE_KNOB_RADIUS]);
            let label = generateLabel(parameter);
            label.position.y = -LABEL_SIZE;
            label.position.z += 0.01;
            container.add(label);
            container.userData.moveable = true;

            break;
        }
        case "small_knob": {
            container = new THREE.Mesh(small_knob_geometry, knob_material);
            container.castShadow = true;
            container.receiveShadow = true;
            container.position.fromArray([
                SMALL_KNOB_RADIUS, 
                -generic_geometry.parameters.height - SMALL_KNOB_HEIGHT/2, 
                -SMALL_KNOB_RADIUS]);
            let label = generateLabel(parameter);
            label.position.y = -LABEL_SIZE;
            label.position.z += 0.01;
            container.add(label);
            container.userData.moveable = true;

            break;
        }
        case "outlet": {
            container = new THREE.Mesh(outlet_geometry, outlet_material);
            container.castShadow = true;
            container.receiveShadow = true;
            container.position.fromArray([
                NLET_RADIUS, 
                -generic_geometry.parameters.height - NLET_HEIGHT/2, 
                -NLET_RADIUS]);
            let label = generateLabel(parameter);
            label.position.y = -LABEL_SIZE;
            label.position.z += 0.01;
            container.add(label);
            container.userData.moveable = true;

            break;
        }
        case "inlet": {
            container = new THREE.Mesh(inlet_geometry, inlet_material);
            container.castShadow = true;
            container.receiveShadow = true;
            container.position.fromArray([
                NLET_RADIUS, 
                NLET_HEIGHT/2, 
                -NLET_RADIUS]);
            let label = generateLabel(parameter);
            label.position.y = -LABEL_SIZE;
            label.position.z += 0.01;
            container.add(label);
            container.userData.moveable = true;
            break;
        }
        case "group": {
            container = new THREE.Mesh(generic_geometry, generic_material);
            container.castShadow = true;
            container.receiveShadow = true;
            container.position.fromArray(props.pos);
            container.userData.moveable = true;
          
            break;
        }
        default: {
            // generic object:
            container = new THREE.Mesh(generic_geometry, generic_material);
            container.castShadow = true;
            container.receiveShadow = true;
            container.position.fromArray(props.pos);
            let label = generateLabel(props.kind);
            label.position.y = -LABEL_SIZE;
            label.position.z += 0.01;
            container.add(label);
            container.userData.moveable = true;
            
        }
    
    }

    let path = "";
    if (parent.userData.path) path = parent.userData.path + ".";
    path += name;

    if (props.orient) container.quaternion.fromArray(props.orient);

    container.userData.name = name;
    container.userData.path = path;
    container.userData.kind = props.kind;
    container.userData.selectable = true;

    allNodes[path] = container;

    // add to proper parent:
    parent.add(container);

    for (let k in node) {
        if (k == "_props") continue;
        
        generateNode(container, node[k], k);
    }
    
}

function generateScene(patch) {
    /** Going to use this to search through the patch JSON coming in from max */
    allNodes = {};
    allCables = [];

    let nodes = patch.nodes;
    for (let k in nodes) {
        generateNode(world, nodes[k], k);
    }

    for (let arc of patch.arcs) {
        let src = allNodes[arc[0]];
        let dst = allNodes[arc[1]];

        if (!src || !dst) {
            console.error("arc with unmatchable paths")
            continue;
        }


        let cable = new Cable(src, dst);
        allCables.push(cable);
    }
}

function animate() {
    renderer.setAnimationLoop(render);
}


let once = 1



function render() {
    stats.begin();

    // make sure all objects' matrices are up to date (TODO might not be needed?)
    scene.updateMatrixWorld();

    for (let cable of allCables) {
        cable.update();
    }

    //Objects
    cleanIntersected();

    controller1.update();
    controller2.update();

    let gamepad = controller1.getGamepad();
    if (gamepad) {
        let button0 = gamepad.buttons[0];
        // consider the thumbpad state:
        if (button0.touched) {
            if (!controller1.userData.touched) {
                controller1.userData.touched = true;
                //console.log("touchstart", gamepad.axes[1])
                controller1.userData.thumbpadDX = 0;
                controller1.userData.thumbpadDY = 0;

            } else {
                //console.log("drag", gamepad.axes[1])
                controller1.userData.thumbpadDX = gamepad.axes[0] - controller1.userData.thumbpadX;
                controller1.userData.thumbpadDY = gamepad.axes[1] - controller1.userData.thumbpadY;
            }
            
            controller1.userData.thumbpadX = gamepad.axes[0];
            controller1.userData.thumbpadY = gamepad.axes[1];


        } else if (controller1.userData.touched) {
            controller1.userData.touched = false;
            controller1.userData.thumbpadDX = 0;
            controller1.userData.thumbpadDY = 0;
            // touch release event
            //console.log("release")
        }
    }

    if (controller1.userData.selected) {
        let object = controller1.userData.selected;
        let s = 1. + (controller1.userData.thumbpadDY);
        object.position.multiplyScalar(s);

        // // if it is a jack, see if we can hook up?
        // if (object.userData.kind == "jack_outlet") {

        //     let intersections = getIntersections(object, 0, 1, 0);
        //     if (intersections.length > 0) {
        //         let intersection = intersections[0];
        //         let o = intersection.object;
        //         if (o.userData.kind == "outlet") {
        //             // we have a hit! disconnect
        //             //object.userData.cable.src = o;
        //             o.getWorldPosition(object.userData.positions[0])
        //         }
        //     }
        

    

        // } else if (object.userData.kind == "jack_inlet") {
        //     object.userData.cable.dst = null;
        // }

    }


    intersectObjects(controller1);
    intersectObjects(controller2);
    renderer.render(scene, camera);
    
    stats.end();
}