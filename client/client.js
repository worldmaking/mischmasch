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
let loadedHeadsetModel

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

const CONTROLLER_HIT_DISTANCE = 0.03;

// let inlet_geometry = new THREE.BoxBufferGeometry(0.05, 0.03, 0.05);
// let outlet_geometry = new THREE.BoxBufferGeometry(0.05, 0.03, 0.05);

let inlet_geometry = new THREE.CylinderGeometry(NLET_RADIUS, NLET_RADIUS, NLET_HEIGHT, 8);
let outlet_geometry = inlet_geometry;
inlet_geometry.computeBoundingBox();

let small_knob_geometry = new THREE.CylinderGeometry(SMALL_KNOB_RADIUS, SMALL_KNOB_RADIUS, SMALL_KNOB_HEIGHT, 8);
small_knob_geometry.computeBoundingBox();

let large_knob_geometry = new THREE.CylinderGeometry(LARGE_KNOB_RADIUS, LARGE_KNOB_RADIUS, LARGE_KNOB_HEIGHT, 8);
large_knob_geometry.computeBoundingBox();

let plug_geometry = new THREE.CylinderGeometry(CONTROL_POINT_DISTANCE * 0.2, CONTROL_POINT_DISTANCE * 0.2, CONTROL_POINT_DISTANCE, 8);
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

//////////////////////////////////////////////////////////////////////////////////////////
// SCENE COMPONENTS
//////////////////////////////////////////////////////////////////////////////////////////


let camera, scene, renderer;
let world = new THREE.Group();
// temp hack
//world.position.set(-2, 0, -1);
//world.rotateY(-Math.PI/2.)

let controller1, controller2;
let controllerMesh;

//////////////////////////////////////////////////////////////////////////////////////////
// OTHER GLOBALS
//////////////////////////////////////////////////////////////////////////////////////////

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

let sock
let userPose = createUserPose();
let otherUsers = {};


let allNodes = {};
let allCables = [];

let raycaster = new THREE.Raycaster(),
    intersected = [];

// temp variables to save allocations
let tempMatrix = new THREE.Matrix4();
let point = new THREE.Vector3();
let delta;

let localPatch;
let spawn = false;

let subObjCount = 0;
let subInletCount = 0;
let subOutletCount = 0;

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
        console.log(loadedHeadsetModel)
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
        //pivot.position.z = - 0.043;
        //pivot.rotation.x = Math.PI / 5.5;
        controllerMesh.add(pivot);
        controller1.add(controllerMesh.clone());
        controller2.add(controllerMesh.clone());
        // pivot.material = pivot.material.clone();

        //Extra Controllers
        // let controllers = controllerMesh.clone();
        // controllers.position.fromArray([
        //     1.0056755443927932,
        //     1.5397452991727987,
        //     0.054924342380011204
        // ]);
        // scene.add(controllers);
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

    // hook up server:
    connect_to_server();

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

        this.srcCtrlPt = new THREE.Mesh(plug_geometry, outlet_material);
        this.dstCtrlPt = new THREE.Mesh(plug_geometry, inlet_material);
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
        world.add(curve.mesh)
    }

    update() {

        if (this.src) {
            this.src.getWorldQuaternion(this.srcCtrlPt.quaternion);
            this.src.getWorldPosition(this.positions[0]);
            this.positions[1]
                .set(0, -(NLET_HEIGHT + CONTROL_POINT_DISTANCE) / 2, 0)
                .applyQuaternion(this.srcCtrlPt.quaternion)
                .add(this.positions[0]);
            this.srcCtrlPt.position.copy(this.positions[1]);
            //Color Set
            this.curve.mesh.material.color.copy(this.src.material.color);
        } else {
            let q = new THREE.Quaternion();
            this.srcCtrlPt.getWorldQuaternion(q);
            // derive positions[0] from the srcCtrlPt
            this.srcCtrlPt.getWorldPosition(this.positions[1]);
            this.positions[0]
                .set(0, (NLET_HEIGHT + CONTROL_POINT_DISTANCE) / 2, 0)
                .applyQuaternion(q)
                .add(this.positions[1]);
            //Reset Color
             this.curve.mesh.material.color.setRGB(211,211,211);
        }

        if (this.dst) {
            this.dst.getWorldPosition(this.positions[3]);
            this.dst.getWorldQuaternion(this.dstCtrlPt.quaternion);
            this.positions[2]
                .set(0, (NLET_HEIGHT + CONTROL_POINT_DISTANCE) / 2, 0)
                .applyQuaternion(this.dstCtrlPt.quaternion)
                .add(this.positions[3]);

            this.dstCtrlPt.position.copy(this.positions[2]);
        } else {
            let q = new THREE.Quaternion();
            this.dstCtrlPt.getWorldQuaternion(q);
            // derive positions[3] from the srcCtrlPt
            this.dstCtrlPt.getWorldPosition(this.positions[2]);
            this.positions[3]
                .set(0, -(NLET_HEIGHT + CONTROL_POINT_DISTANCE) / 2, 0)
                .applyQuaternion(q)
                .add(this.positions[2])
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
            allCables.push(cable);
            controller.add(object); //removes from previous parent

        } else if (kind == "inlet") {
            //...
            let cable = new Cable(null, object);
            object = cable.srcCtrlPt;
            controller.userData.selected = object;
            allCables.push(cable);
            controller.add(object); //removes from previous parent
        }

        controller.userData.selected = object;
    }
}

function onSelectEnd(event) {
    let controller = event.target;
    if (controller.userData.selected !== undefined) {
        let parent = controller.userData.parent;
        let object = controller.userData.selected;
        controller.userData.selected = undefined;
        if (object && object.userData.moveable) {
            object.matrix.premultiply(controller.matrixWorld);
            tempMatrix.getInverse(parent.matrixWorld);
            object.matrix.premultiply(tempMatrix);
            object.matrix.decompose(object.position, object.quaternion, object.scale);
            object.material.emissive.b = 0;
            //world.add(object);
            parent.add(object);
        }
        // if it is a jack, see if we can hook up?
        if (object.userData.kind == "jack_outlet") {

            let intersections = getIntersections(object, 0, 1, 0);
            if (intersections.length > 0) {
                let intersection = intersections[0];
                let o = intersection.object;
                if (o.userData.kind == "outlet") {
                    // we have a hit! disconnect
                    object.userData.cable.src = o;
                
                  // object.userData.cable.curve.mesh.material.color = o.material.color;
                    
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

    syncLocalPatch();
}

function onSpawn(event) {
    let controller = event.target;
    if(controller.getButtonState('thumbpad') === undefined) return;
    if(controller.getButtonState('trigger') == false){
        
        let rand = [];
        for (let k in localPatch.nodes) {
            rand.push(k);
        }
        spawn = true;
        let nodeNum = randomIntFromInterval(0, rand.length -1);
        generateNode(world, 
            localPatch.nodes[rand[nodeNum]], 
            rand[nodeNum]); 

            //console.log(randomIntFromInterval(0, rand.length))
    
        // request scene:
        //sock.send({ cmd: "get_scene", date: Date.now() });
    }

}

function randomIntFromInterval(min,max) // min and max included
{
    return Math.floor(Math.random()*(max-min+1)+min);
}

function getIntersections(controller, x, y, z) {
    tempMatrix.identity().extractRotation(controller.matrixWorld);
    raycaster.ray.origin.setFromMatrixPosition(controller.matrixWorld);
    raycaster.ray.direction.set(x, y, z).applyMatrix4(tempMatrix);
    // argument here is just any old array of objects
    // 2nd arg is recursive (recursive breaks grabbing)
    let intersections = raycaster.intersectObjects(world.children, true);
    while (intersections.length > 0 && !intersections[0].object.userData.selectable) intersections.shift();
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
        if (object.material.emissive)
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
        if (object.material.emissive)
            object.material.emissive.r = 0;
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

function generateNode(parent, node, name) {
    if(node === undefined || name === undefined){
        let pos = controller1.getWorldPosition();
        let quat = new THREE.Quaternion();
        controller1.getWorldQuaternion(quat);
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
    let n_switch_material = generic_material
    
    

    let props = node._props;

    let type = props.kind;
    let container;
    // TODO this switch needs to operate on "UI_Type" ^^^, NOT "props.kind"
    switch(type) {
        case "large_knob": {
            container = new THREE.Mesh(large_knob_geometry, knob_material);
            container.castShadow = true;
            container.receiveShadow = true;
            //generic_geometry.parameters.width
            container.position.fromArray([
                (subObjCount / 8) + .065, 
                -generic_geometry.parameters.height/2 - LARGE_KNOB_HEIGHT/2, 
                generic_geometry.parameters.depth/2 - LARGE_KNOB_HEIGHT]);
            //Takes Radians
            container.rotation.x = 1.5708;
           
            let label = generateLabel(name, LARGE_KNOB_HEIGHT/2);
            label.position.y = 0.01;
            label.position.x = -LARGE_KNOB_RADIUS /2;
            label.rotation.x = -1.5708;
            container.add(label);

            container.userData.turnable = true;
            subObjCount++;
            break;
        }
        case "small_knob": {
            container = new THREE.Mesh(small_knob_geometry, knob_material);
            container.castShadow = true;
            container.receiveShadow = true;
            container.position.fromArray([
                (subObjCount / 8) + .065, 
                -generic_geometry.parameters.height/2 - SMALL_KNOB_HEIGHT/2, 
                generic_geometry.parameters.depth/2 - SMALL_KNOB_HEIGHT]);
            container.rotation.x = 1.5708;
            //Label
            let label = generateLabel(name, SMALL_KNOB_HEIGHT/2.7);
            label.position.y = 0.01;
            label.position.x = -SMALL_KNOB_RADIUS /2;
            label.rotation.x = -1.5708;
            container.add(label);

            container.userData.turnable = true;
            subObjCount++;
            break;
        }
        case "outlet": {
            container = new THREE.Mesh(outlet_geometry, outlet_material);
            container.castShadow = true;
            container.receiveShadow = true;
            container.position.fromArray([
                NLET_RADIUS + (subOutletCount / 10), 
                -generic_geometry.parameters.height - NLET_HEIGHT/2, 
                -NLET_RADIUS]);
           
            let label = generateLabel(name, SMALL_KNOB_HEIGHT/2.7);
            label.position.y = -0.01;
            label.position.x = -NLET_RADIUS /2;
            label.rotation.x = 1.5708;
            container.add(label);
                
            //container.userData.moveable = true;
            subOutletCount++;
            break;
        }
        case "inlet": {
            container = new THREE.Mesh(inlet_geometry, inlet_material);
            container.castShadow = true;
            container.receiveShadow = true;
            container.position.fromArray([
                NLET_RADIUS + (subInletCount / 10), 
                NLET_HEIGHT/2, 
                -NLET_RADIUS]);
    
            let label = generateLabel(name, NLET_HEIGHT);
            label.position.y = 0.01;
            label.position.x = -NLET_RADIUS /2;
            label.rotation.x = -1.5708;
            container.add(label);
            
            // container.userData.moveable = true;
            subInletCount++;
            break;
        }
        case "n_switch": {
            container = new THREE.Mesh(n_switch_geometry, n_switch_material);
            container.castShadow = true;
            container.receiveShadow = true;
            container.position.fromArray([
                (subObjCount / 8) + .065,
                -generic_geometry.parameters.height/2 - LARGE_KNOB_HEIGHT/2, 
                generic_geometry.parameters.depth/2 - LARGE_KNOB_HEIGHT]);
            
                //Draw N_SWTICH Label name itself
            // let label = generateLabel(parent.userData.name, .01);
            // label.position.y =  0;
            // label.position.z = 0;
            // container.add(label);
            if(props.throws !== undefined){
                let y = -container.position.y / 2;
                for(let l =0; l < props.throws.length; l++){
                    let labelN = generateLabel(props.throws[l], .01);
                    labelN.position.y = y - container.geometry.parameters.height / 3.5;
                    y = labelN.position.y;
                    labelN.position.z = 0;
                    labelN.position.x = -0.01;
                    
                    if(props.value !== undefined && props.value === l){
                        n_switch_slider = new THREE.Mesh(n_switch_slider_geometry, inlet_material);
                        n_switch_slider.castShadow = true;
                        n_switch_slider.receiveShadow = true;
                        n_switch_slider.position.fromArray([
                            labelN.position.x + -0.02,
                            labelN.position.y,
                            labelN.position.z+ -0.005,
                        ]);
                        container.add(n_switch_slider);
                    }
                    container.add(labelN);
                }

            }
            subObjCount++;
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
            let labelName;
            if(props.kind.substring(0,3) == "op_") {
                // use a square shape
                // trim "op_" from the label
                container = new THREE.Mesh(op_geometry, generic_material);
                container.castShadow = true;
                container.receiveShadow = true;
                labelName = props.kind.substring(3);

            } else if(props.kind == "param"){
                container = new THREE.Mesh(op_geometry, generic_material);
                container.castShadow = true;
                container.receiveShadow = true;
                let n = name.split('_');
                n.shift();
                n.pop();
                let w = n.join("");
                // let n = name.split("_")
                // .shift()
                // .pop()
                // .join("");

                labelName = w;
            } else {
            // generic object:
            container = new THREE.Mesh(generic_geometry, generic_material);
            container.castShadow = true;
            container.receiveShadow = true;
            labelName = props.kind;
                
            }

            if(spawn === true){
                let pos = controller1.getWorldPosition();
                let quat = new THREE.Quaternion();
                controller1.getWorldQuaternion(quat);
                let tilt = new THREE.Quaternion();
                tilt.setFromAxisAngle(new THREE.Vector3(1., 0., 0.), -0.25);
                quat.multiply(tilt);
                let rel = new THREE.Vector3(-generic_geometry.parameters.width/2, generic_geometry.parameters.height*1.2, -.1);
                pos.add(rel.applyQuaternion(quat));
                let arr = [pos.x, pos.y, pos.z];
                container.position.fromArray(arr);
                spawn = false;
            } else if (props.pos){
                container.position.fromArray(props.pos);
            } else{
                container.position = parent.position.clone();
            }
            let label = generateLabel(labelName);
            label.position.y = -LABEL_SIZE;
            label.position.z += 0.01;
            label.position.x = 0.005;
            container.add(label);
            container.userData.moveable = true; 
            subObjCount = 0;   
            subInletCount = 0;
            subOutletCount = 0;
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
    container.userData.localPatchNode = node;

    allNodes[path] = container;

    //console.log("added ", path, container)

    // add to proper parent:
    parent.add(container);

    for (let k in node) {
        if (k == "_props") continue;
            
        generateNode(container, node[k], k);
    }

}
function generateScene(patch) {

    clearScene();
    
    localPatch = patch;

    let nodes = patch.nodes;
    for (let k in nodes) {
        generateNode(world, nodes[k], k);
    }

    for (let arc of patch.arcs) {
        let src = allNodes[arc[0]];
        let dst = allNodes[arc[1]];

        if (!src || !dst) {
            console.log(arc[0], src)
            console.log(arc[1], dst)
            console.error("arc with unmatchable paths")
            continue;
        }

        let cable = new Cable(src, dst);
        allCables.push(cable);
    }
}


function syncLocalPatchNode(obj) {
    let v = new THREE.Vector3();
    let q = new THREE.Quaternion();
    
    obj.getWorldPosition(v);
    obj.getWorldQuaternion(q);
    // update the pos and orient props in the corresponding object in the localPatch
    let props = obj.userData.localPatchNode._props;
    if(props.pos && props.orient){
        props.pos[0] = v.x;
        props.pos[1] = v.y;
        props.pos[2] = v.z;
        props.orient[0] = q.x;
        props.orient[1] = q.y;
        props.orient[2] = q.z;
        props.orient[3] = q.w;
    }

    if (sock) {
        sock.send({
            cmd: "updated_scene",
            date: Date.now(),
            scene: localPatch,
        });
    }
}

function syncLocalPatch() {
    for (let path in allNodes) {
        syncLocalPatchNode(allNodes[path])
    }
}


function onKeyPress(e) {

    if (e.keyCode == 13) {
        syncLocalPatch();
        console.log(localPatch)
    }
    if (e.keyCode == 83){
        console.log("saving image")
        webutils.saveCanvasToPNG(canvas);
    }
}

function animate() {
    renderer.setAnimationLoop(render);
}


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

    // for(let u in otherUsers){
    //     otherUsers[u].controller1.update();
    // }

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

        // if what we have selected is a jack,
        // then do ray intersection as usual
        // if ray target is inlet/outlet (appropriately)
        // locate jack at ray target

        if (object.userData.moveable) {
            let s = 1. + (controller1.userData.thumbpadDY);
            let r = 1. + (controller1.userData.thumbpadDX);
            object.position.multiplyScalar(s);
            
            let rot = new THREE.Vector3(object.rotation.x, object.rotation.y, object.rotation.z);
            rot.multiplyScalar(r);
            //object.rotation.x = rot.x;
            object.rotation.y = rot.y;
            //object.rotation.z = rot.z;
            //object.quaternion.multiply(r);

        } else if (object.userData.turnable) {
            // do UI effeect
            object.rotateY(Math.PI / 90);
        }

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

    } else {
        let targetPos = new THREE.Vector3();
        let controllerPos = new THREE.Vector3();
        controller1.getWorldPosition(controllerPos);

        for (let name in allNodes) {
            let target = allNodes[name];
            target.getWorldPosition(targetPos);

            let d = targetPos.distanceTo(controllerPos);
            if (d < CONTROLLER_HIT_DISTANCE) {
                console.log(name, target.userData.kind);

                // if kind is outlet/inlet, start a patch coord
            }
        }
    }

    if (sock && sock.socket && sock.socket.readyState === 1 && controller1 && controller2) {

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
        case "patch":
            {
                userPose.id = msg.id;

   
                // lazy deep copy:
                patch = JSON.parse(JSON.stringify(msg.value));
                write("received patch for user " +  userPose.id);


                //Input JSON files to be parsed on generations
                generateScene(patch);
            }
            break;
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
        default:
            console.log("received JSON", msg, typeof msg);
    }
}