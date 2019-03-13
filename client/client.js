var camera, scene, renderer;
var controller1, controller2;
var raycaster,
    intersected = [];
let tempMatrix = new THREE.Matrix4();
let world;

let ark = {
    positions: [new THREE.Vector3( 0.7, 0.5, 0.1),
    new THREE.Vector3(-0.5, 0.4, -0.09),
    new THREE.Vector3(-0.4, 0.4, -0.9),
    new THREE.Vector3(-0.7, 0.1, 0.8)
    ],
    splinePointsLength: 4,
    splineHelperObjects: [],
    splineData: {}

};

let synths = [{
}];

let texts = [{

}];


let point = new THREE.Vector3();
let geometry = new THREE.BoxBufferGeometry(0.2, 0.2, 0.2);
let geometry2 = new THREE.BoxBufferGeometry(0.1, 0.1, 0.1);


let ARC_SEGMENTS = 40;

let params = {
    uniform: true,
    tension: 0.5,
    centripetal: true,
    chordal: true
};


let fontFile = 'js/three-r102/examples/fonts/helvetiker_regular.typeface.json';
let fontLoader = new THREE.FontLoader;
let loadedFont;

// STYLES (Materials got moved because it is always using the same mesh across all objects)

let inlet_geometry = new THREE.BoxBufferGeometry(0.1, 0.03, 0.2);
let outlet_geometry = new THREE.BoxBufferGeometry(0.1, 0.03, 0.1);
let generic_geometry = new THREE.BoxBufferGeometry(0.4, 0.2, 0.2);



let label_material = new THREE.MeshStandardMaterial({
    color: 0x000000,
    transparent: true,
    opacity: 0.4,
    side: THREE.DoubleSide
});

//TODO: lazy hack, fix this with async/await or something smarter
fontLoader.load(fontFile, function (font) {
    loadedFont = font;
    init();
    animate();
});

function init() {

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
    //container.appendChild(renderer.domElement);
    document.body.appendChild(WEBVR.createButton(renderer));
    // controllers
    controller1 = renderer.vr.getController(0);
    controller1.addEventListener("selectstart", onSelectStart);
    controller1.addEventListener("selectend", onSelectEnd);
    scene.add(controller1);
    controller2 = renderer.vr.getController(1);
    controller2.addEventListener("selectstart", onSelectStart);
    controller2.addEventListener("selectend", onSelectEnd);
    scene.add(controller2);


    scene.add(new THREE.HemisphereLight(0x808080, 0x606060));
    scene.background = new THREE.Color(0xf0f0f0);
    let light = new THREE.DirectionalLight(0xffffff);
    light.position.set(0, 6, 0);
    light.castShadow = true;
    light.shadow.camera.top = 2;
    light.shadow.camera.bottom = -2;
    light.shadow.camera.right = 2;
    light.shadow.camera.left = -2;
    light.shadow.mapSize.set(4096, 4096);
    scene.add(light);
    world = new THREE.Group();
    scene.add(world);

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
    raycaster = new THREE.Raycaster();
    window.addEventListener("resize", onWindowResize, false);

    // floor
    let helper = new THREE.GridHelper(10, 10);
    helper.position.y = 0;
    helper.material.opacity = 0.25;
    helper.material.transparent = true;
    scene.add(helper);

    /****************************
     * Generate Different Parts *               Old Way
     ****************************/


    // generateText(fontFile, "Test");
    // generateText(fontFile, "BLLALALAL", 0x000ff0, .5, true);
    // generateSynths(true);
    // generateSynths(true, 0.9, 0.2, 0.7);
    generateSplines();
    //generateSplines();

    //console.log(ark)


    //Input JSON files to be parsed on generations
    generateScene(patch1);
}

function onWindowResize() {
    camera.aspect = window.innerWidth / window.innerHeight;
    camera.updateProjectionMatrix();
    renderer.setSize(window.innerWidth, window.innerHeight);
}

function onSelectStart(event) {
    let controller = event.target;
    let intersections = getIntersections(controller);
    if (intersections.length > 0) {
        let intersection = intersections[0];
        tempMatrix.getInverse(controller.matrixWorld);
        let object = intersection.object;
        object.matrix.premultiply(tempMatrix);
        object.matrix.decompose(object.position, object.quaternion, object.scale);
        object.material.emissive.b = 1;
        controller.add(object); //removes from previous parent
        controller.userData.selected = object;
        
    }
}

function onSelectEnd(event) {
    let controller = event.target;
    if (controller.userData.selected !== undefined) {
        let object = controller.userData.selected;
        object.matrix.premultiply(controller.matrixWorld);
        object.matrix.decompose(object.position, object.quaternion, object.scale);
        object.material.emissive.b = 0;
        world.add(object);
        controller.userData.selected = undefined;

    }
}

function getIntersections(controller) {
    tempMatrix.identity().extractRotation(controller.matrixWorld);
    raycaster.ray.origin.setFromMatrixPosition(controller.matrixWorld);
    raycaster.ray.direction.set(0, 0, -1).applyMatrix4(tempMatrix);
    // argument here is just any old array of objects
    // 2nd arg is recursive (recursive breaks grabbing)
    return raycaster.intersectObjects(world.children);
}

function intersectObjects(controller) {
    // Do not highlight when already selected
    if (controller.userData.selected !== undefined) return;
    let line = controller.getObjectByName("line");
    let intersections = getIntersections(controller);
    if (intersections.length > 0) {
        let intersection = intersections[0];
        let object = intersection.object;

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
        object.material.emissive.r = 0;
    }
}

function splineConnectNode(){
    
}


/** Generate Text object inside viewport.
 * 
 * @param {String} fontType - pass in font file (.typeface.json)
 * @param {String} message - what text to display
 * @param {Hex} color -  the color of the text in the view port (Eg. 0x0f0f0f)
 * @param {Float} positionZ - the z position of the text
 * 
 * Generates one mesh for the message to get multiple messages call this function as many times
 * as neede with different messages
 */

function generateText(fontType, message, color, positionZ, moveable) {
    //Font 
    

    fontLoader.load(fontType, function (font) {
        if (color === undefined) {
            color = 0x000000;
        } else {
            color = color;
        }

        if (positionZ === undefined) {
            positionZ = 0;
        } else {
            positionZ = positionZ;
        }

        let text, xMid;
        let material = new THREE.MeshStandardMaterial({
            color: color,
            transparent: true,
            opacity: 0.4,
            side: THREE.DoubleSide
        });


        let shapes = font.generateShapes(message, .5);
        let shapeGeometry = new THREE.ShapeBufferGeometry(shapes);
        shapeGeometry.computeBoundingBox();

        xMid = -0.1 * (shapeGeometry.boundingBox.max.x - shapeGeometry.boundingBox.min.x);
        shapeGeometry.translate(xMid, 0, 0);

        text = new THREE.Mesh(shapeGeometry, material);
        text.position.z = positionZ;
        text.rotation.y = 180;
        if (moveable === true) {

            world.add(text);
        }
        else {
            scene.add(text);
        }
        texts.push(text);
    });

}

/** Create synth objects.
 * 
 * @param {Boolean} child - would you like a child aka node attached to this object
 * @param {Float} length - length of the cube
 * @param {Float} width - width of the cube
 * @param {Float} height - height of the cube
 */

function generateSynths(child, length, width, height) {

    // for (let i = 0; i < amount; i++) {
        if(length === undefined || width === undefined || height === undefined){
            length = 0.5, width = 0.5, height = 0.5;
        }
        let geometry = new THREE.BoxBufferGeometry(length, height, width);

        let material = new THREE.MeshStandardMaterial({
            color: Math.random() * 0xffffff,
            roughness: 0.7,
            metalness: 0.0,
            wireframe: true
        });
        let object = new THREE.Mesh(geometry, material);
        object.position.x = Math.random() * 4 - 2;
        object.position.y = Math.random() * 2;
        object.position.z = Math.random() * 4 - 2;
        object.rotation.x = Math.random() * 2 * Math.PI;
        object.rotation.y = Math.random() * 2 * Math.PI;
        object.rotation.z = Math.random() * 2 * Math.PI;
        //object.scale.setScalar(Math.random() + 0.5);
        object.castShadow = true;
        object.receiveShadow = true;
        
        if(child === true){
            object = generateNodes(object, material);
        }

        synths.push(object);
        world.add(object);
        //log.textContent = JSON.stringify(synths);
    //}
}

    /** Create node objects (cubes for now).
 * 
 * @param {Object} object - parent object which this child is being created and attached too
 * @param {Material} material - the material which this node will inherit
 * 
 * @return returns the object with the child parented to it already
 */
function generateNodes(object, material){
    let child = new THREE.BoxBufferGeometry(0.1, 0.1, 0.1);;
    let childNode = new THREE.Mesh(child, material);

    // childNode.scale.setScalar(0.2);
    object.add(childNode);
    return object;
}

function generateSplines(){

    for (let i = 0; i < ark.splinePointsLength; i++) {
        addSplineObject(ark.positions[i], i);
    }

    //Three patch cord connection lines (red, green, blue) 
    let patchCord = new THREE.BufferGeometry(20, 20, 20);
    patchCord.addAttribute('position', new THREE.BufferAttribute(new Float32Array(ARC_SEGMENTS * 3), 3));
    let curve = new THREE.CatmullRomCurve3(ark.positions);
    curve.curveType = 'catmullrom';
    curve.mesh = new THREE.Line(patchCord.clone(), new THREE.LineBasicMaterial({
        color: 0xff0000,
        opacity: 1
    }));
    curve.mesh.castShadow = true;
    ark.splineData.uniform = curve;
    curve = new THREE.CatmullRomCurve3(ark.positions);
    curve.curveType = 'centripetal';
    curve.mesh = new THREE.Line(patchCord.clone(), new THREE.LineBasicMaterial({
        color: 0x00ff00,
        opacity: 1
    }));
    curve.mesh.castShadow = true;
    ark.splineData.centripetal = curve;
    curve = new THREE.CatmullRomCurve3(ark.positions);
    curve.curveType = 'chordal';
    curve.mesh = new THREE.Line(patchCord.clone(), new THREE.LineBasicMaterial({
        color: 0x0000ff,
        opacity: 1
    }));
    curve.mesh.castShadow = true;
    ark.splineData.chordal = curve;
    for (let k in ark.splineData) {
        let spline = ark.splineData[k];
        scene.add(spline.mesh);
    }
    updateSplineOutline();
}

function addSplineObject(position, amount) {
    //Colours the spline points based on if its moveable (Green) or unmoveable (Red)
    if (amount == 0 || amount == ark.splinePointsLength - 1) {
        var material = new THREE.MeshLambertMaterial({
            color: 0x00ff00
        });
    } else {
        var material = new THREE.MeshLambertMaterial({
            color: 0xff0000
        });
    }
    let object = new THREE.Mesh(geometry2, material);
    if (position) {
        object.position.copy(position);
    } else {
        object.position.x = Math.random() * 10 - 5;
        object.position.y = Math.random() * 6;
        object.position.z = Math.random() * 8 - 4;
    }
    object.castShadow = true;
    object.receiveShadow = true;

    if (amount == 0 || amount == ark.splinePointsLength - 1) {
        world.add(object);
    } else {
        scene.add(object);
    }

    ark.splineHelperObjects.push(object);
    return object;
}

function updateSplineOutline() {



    for (let k in ark.splineData) {
        // todo: this should be spline.positions
        for (let i in ark.positions) {
            //console.log(p)
            ark.splineHelperObjects[i].getWorldPosition(ark.positions[i]);

        }
        let spline = ark.splineData[k];
        let splineMesh = spline.mesh;
        let position = splineMesh.geometry.attributes.position;
        for (let i = 0; i < ARC_SEGMENTS; i++) {
            let t = i / (ARC_SEGMENTS - 1);
            spline.getPoint(t, point);
            // if (i==0) console.log(point)
            position.setXYZ(i, point.x, point.y, point.z);
        }
        position.needsUpdate = true;
    }
    
}
        
function generateLabel(message) {
    let shapes = loadedFont.generateShapes(message, .05);
    let shapeGeometry = new THREE.ShapeBufferGeometry(shapes);
    shapeGeometry.computeBoundingBox();

    text = new THREE.Mesh(shapeGeometry, label_material);
    
    return text;
}

function generateNode(parent, node, name) {
    let container;

    //Having Materials inside styles at the top causes it use the same mess across all objects
    let generic_material = new THREE.MeshStandardMaterial({
        color: Math.random() * 0xffffff,
        roughness: 0.7,
        metalness: 0.0,
        wireframe: true
    });
    let inlet_material = generic_material
    let outlet_material = generic_material
    
    let props = node._props;
    switch(props.kind) {
        case "outlet": {
            container = new THREE.Mesh(outlet_geometry, outlet_material);
            container.castShadow = true;
            container.receiveShadow = true;
            container.position.fromArray([0., -0.1, 0.]);
        
            break;
        }
        case "inlet": {
            container = new THREE.Mesh(inlet_geometry, inlet_material);
            container.castShadow = true;
            container.receiveShadow = true;
            container.position.fromArray([0., 0.1, 0.]);
        
            break;
        }
        case "group": {
            container = new THREE.Mesh(generic_geometry, generic_material);
            container.castShadow = true;
            container.receiveShadow = true;
            container.position.fromArray(props.pos);
            
            break;
        }
        default: {
            // generic object:
            container = new THREE.Mesh(generic_geometry, generic_material);
            container.castShadow = true;
            container.receiveShadow = true;
            container.position.fromArray(props.pos);
            container.add(generateLabel(props.kind))
            
        }
    }

    // add to proper parent:
    parent.add(container);

    for (let k in node) {
        if (k == "_props") continue;
        
        generateNode(container, node[k], k);
    }
    
}

function generateScene(patch) {
    /** Going to use this to search through the patch JSON coming in from max */

    let nodes = patch.nodes;
    for (let k in nodes) {
        console.log(k)

        let node = nodes[k];
        console.log(node)
        generateNode(world, node, k);
    
    }
}

function animate() {
    renderer.setAnimationLoop(render);
}


function render() {
    stats.begin();

    //Spline
    ark.splineData.uniform.mesh.visible = params.uniform;
    ark.splineData.centripetal.mesh.visible = params.centripetal;
    ark.splineData.chordal.mesh.visible = params.chordal;

    // make sure all objects' matrices are up to date (TODO might not be needed?)
    scene.updateMatrixWorld();

    let p = new THREE.Vector3();

    //log.textContent = JSON.stringify(p)
    if (controller1.userData.selected !== undefined) {

        updateSplineOutline();
    }

    //Objects
    cleanIntersected();
    intersectObjects(controller1);
    intersectObjects(controller2);
    renderer.render(scene, camera);
    
    stats.end();
}