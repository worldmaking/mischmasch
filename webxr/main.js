// boilerplate from https://github.com/markhorgan/web-vr-three-js/blob/main/src/app.js
// three libs
import { Mesh, HemisphereLight, PerspectiveCamera, Scene, WebGLRenderer, BoxGeometry, MeshStandardMaterial, Vector3, BufferGeometry, Line, Color, Matrix4, Raycaster } from 'three';
import { VRButton } from 'three/examples/jsm/webxr/VRButton';
import { XRControllerModelFactory } from 'three/examples/jsm/webxr/XRControllerModelFactory';

// import * as Automerge from "@automerge/automerge"
// let doc = Automerge.init({cables: [1,2,3,4]})
// console.log(doc)
// controller thumbstick access

// systems
import { Renderer } from'./systems/Renderer.js'


// components
import { Patch } from './components/Patch/Patch.js'

// utilities
import { scale, hashCode, colorFromString, opMenuColour, value2angle, angle2value, prettyPrint } from '/utilities/utilities.js'
import * as glutils from './utilities/glutils.js'

// scenes
import { funzo } from './userData/scenes.js'

// assets
import { module_program, fbo_program, floor_program, wand_program, line_program, ray_program, textquad_program, debug_program } from './assets/shaders.js'

// GOT graph, local copy.
let localGraph = {
	nodes: {},
	arcs: []
}
let viewmatrix, projmatrix;
let mainScene;
const objectUnselectedColor = new Color(0x5853e6);
const objectSelectedColor = new Color(0xf0520a);

class App {
  constructor() {
    this.camera = new PerspectiveCamera(75, window.innerWidth / window.innerHeight, 0.1, 1000);
    this.camera.position.set(0, 1.6, 3);
    this.scene = new Scene();
    this.scene.background = new Color(0x505050);
    this.r = new Renderer();
    this.renderer = this.r.renderer
    document.body.appendChild(this.renderer.domElement);

    
  
    this.initXR();
    this.initScene();
  
    window.addEventListener('resize', this.onWindowResize.bind(this), false);
    this.renderer.setAnimationLoop(this.render.bind(this));


  }

  initXR() {
    this.renderer.xr.enabled = true;
    document.body.appendChild(VRButton.createButton(this.renderer));
    this.controllers = this.buildControllers();

    function onSelectStart() {
      // this refers to the controller
      this.children[0].scale.z = 10;
      this.userData.selectPressed = true;
    }
  
    function onSelectEnd() {
      // this refers to the controller
      this.children[0].scale.z = 0;
      this.userData.selectPressed = false;
    }

    this.controllers.forEach(controller => {
      controller.addEventListener('selectstart', onSelectStart);
      controller.addEventListener('selectend', onSelectEnd);
      controller.addEventListener('squeezestart', onSelectStart);
      controller.addEventListener('squeezeend', onSelectEnd);
      controller.addEventListener( 'connected', (e) => {
        controller.userData.gamepad = e.data.gamepad 
        controller.userData.handedness = e.data.handedness 
      });
    });
    // mainScene = this.r.makeSceneGraph();
    // mainScene.init();
    // mainScene.rebuild(localGraph)
  }

  initScene() {
    // initialize patch
    this.patch = new Patch()

    // try passing a scene to load into patch
    this.patch.load(funzo)
    
    console.log(this.patch.rebuild())
    this.objects = [];

    const boxGeometry = new BoxGeometry(0.5, 0.5, 0.5);
    const boxMaterial = new MeshStandardMaterial({ color: objectUnselectedColor });
    const box = new Mesh(boxGeometry, boxMaterial);
    box.position.z = -2;
    this.objects.push(box);
    this.scene.add(box);
  
    const light = new HemisphereLight(0xffffff, 0xbbbbff, 1);
    light.position.set(0.5, 1, 0.25);
    this.scene.add(light);
  }

  buildControllers() {
    const controllerModelFactory = new XRControllerModelFactory();
  
    const geometry = new BufferGeometry().setFromPoints([
      new Vector3(0, 0, 0),
      new Vector3(0, 0, -1)
    ]);
  
    const line = new Line(geometry);
    line.scale.z = 0;
  
    const controllers = [];
  
    for (let i = 0; i < 2; i++) {
      const controller = this.renderer.xr.getController(i);
      controller.add(line.clone());
      controller.userData.selectPressed = false;
      controller.userData.selectPressedPrev = false;
      controller.thumbstickAxes = []
      this.scene.add(controller);
      controllers.push(controller);

      const grip = this.renderer.xr.getControllerGrip(i);
      grip.add(controllerModelFactory.createControllerModel(grip));
      this.scene.add(grip);
    }

    return controllers;
  }

  handleController(controller) {
    if (controller.userData.selectPressed) {
      if (!controller.userData.selectPressedPrev) {
        // Select pressed
        controller.children[0].scale.z = 10;
        const rotationMatrix = new Matrix4();
        rotationMatrix.extractRotation(controller.matrixWorld);
        const raycaster = new Raycaster();
        raycaster.ray.origin.setFromMatrixPosition(controller.matrixWorld);
        raycaster.ray.direction.set(0, 0, -1).applyMatrix4(rotationMatrix);
        const intersects = raycaster.intersectObjects(this.objects);
        if (intersects.length > 0) {
          controller.children[0].scale.z = intersects[0].distance;
          this.selectedObject = intersects[0].object;
          this.selectedObject.material.color = objectSelectedColor;
          this.selectedObjectDistance = this.selectedObject.position.distanceTo(controller.position);
        }
      } else if (this.selectedObject) {
        // Move selected object so it's always the same distance from controller
        const moveVector = controller.getWorldDirection(new Vector3()).multiplyScalar(this.selectedObjectDistance).negate()
        
        this.selectedObject.position.copy(controller.position.clone().add(moveVector));
      }
    } else if (controller.userData.selectPressedPrev) {
      // Select released
      controller.children[0].scale.z = 10;
      if (this.selectedObject != null) {
        this.selectedObject.material.color = objectUnselectedColor;
        this.selectedObject = null;
      }
    }
    controller.userData.selectPressedPrev = controller.userData.selectPressed;
  }

  render() {

    viewmatrix = this.camera.matrixWorldInverse
    projmatrix = this.camera.projectionMatrix

   
    // this.renderer.floor_program.begin();
    /*
    // todo
    // pass updated viewmatrix and projmatrix into the floor shader program
    this.renderer.floor_program.uniforms.u_viewmatrix = viewmatrix;
    this.renderer.floor_program.uniforms.u_projmatrix = projmatrix;
    // bind the vao to the floor
    this.renderer.gl.bindVertexArray(this.renderer.floor_vao)
    // unbind the vao when done
    this.renderer.gl.bindVertexArray(null)
    */
    // this.renderer.floor_vao.bind().draw().unbind();
    // this.renderer.gl.drawElements()
    // this.renderer.floor_program.end();
    // rebuild XR localGraph
    // rebuild VR localGraph
    if(this.patch.dirty.vr == true){
      // fs.writeFileSync('userData/document.json', JSON.stringify(patch.document, null, 2))
      
      localGraph = this.patch.rebuild()
      // fs.writeFileSync('userData/graph.json', JSON.stringify(localGraph, null, 2))

      // mainScene.rebuild(localGraph)
      this.patch.dirty.vr = false
    }
    if (this.controllers) {
      this.controllers.forEach(controller => {
        if(controller.userData.gamepad){
          // leaving these here just so we know how to access thumbstick axes
          let x = controller.userData.gamepad.axes[2]
          let y = controller.userData.gamepad.axes[3]
        }
        this.handleController(controller);
      })
    }
    
    this.renderer.render(this.scene, this.camera);
  }

  onWindowResize() {
    this.camera.aspect = window.innerWidth / window.innerHeight;
    this.camera.updateProjectionMatrix();
    this.renderer.setSize(window.innerWidth, window.innerHeight);
    this.renderer.render(this.scene, this.camera); 
  }
}
  
window.addEventListener('DOMContentLoaded', () => {
  new App();
});
