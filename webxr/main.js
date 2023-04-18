// boilerplate from https://github.com/markhorgan/web-vr-three-js/blob/main/src/app.js
// three libs
import { Mesh, HemisphereLight, PerspectiveCamera, Scene, WebGLRenderer, BoxGeometry, MeshStandardMaterial, Vector3, BufferGeometry, Line, Color, Matrix4, Raycaster } from 'three';
import { VRButton } from 'three/examples/jsm/webxr/VRButton';
import { XRControllerModelFactory } from 'three/examples/jsm/webxr/XRControllerModelFactory';

import {updateGraph, updateParams} from './components/Audio/Audio.js'
// import * as Automerge from "@automerge/automerge"
// let doc = Automerge.init({cables: [1,2,3,4]})
// console.log(doc)
// controller thumbstick access

// systems
import { Renderer } from'./systems/Renderer.js'


// components
import { Patch } from './components/Patch/Patch.js'

// import { Worker } from 'worker_threads'

// load a js file as a new Worker thread:
const worker = new Worker("./components/Audio/xr_genish_worker.js")

// utilities
import { scale, hashCode, colorFromString, opMenuColour, value2angle, angle2value, prettyPrint } from '/utilities/utilities.js'
import * as glutils from './utilities/glutils.js'

// scenes
import { funzo, simple } from './userData/scenes.js'

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

    // zoom with mousewheel
    window.addEventListener('wheel', (event) => {
      event.preventDefault(); /// prevent scrolling
      
      let zoom = this.camera.zoom; // take current zoom value
      zoom += event.deltaY * -0.01; /// adjust it
      zoom = Math.min(Math.max(.125, zoom), 4); /// clamp the value
    
      this.camera.zoom = zoom /// assign new zoom value
      this.camera.updateProjectionMatrix(); /// make the changes take effect
    }, { passive: false });
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
    // objects that can intersect with wand raycaster
    this.objects = [];
    // initialize patch
    this.patch = new Patch()

    // try passing a scene to load into patch
    this.patch.load(simple)
    
    this.patch.rebuild(this.scene, this.objects)
    

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

  handleController(controller, thumbX, thumbY) {

    if (controller.userData.selectPressed) {
      let ui = 0
      let parentGroup = 0;
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
          console.log(intersects[0])
          ui = intersects[0].object.name.split('_')[0]
          switch(ui){
            case 'inlet':
            case 'outlet':
              // spawn a cable
            break
            case 'panel':
              parentGroup = intersects[0].object.parent    
              controller.children[0].scale.z = intersects[0].distance;
              this.selectedObject = intersects[0].object.parent ;
              // todo: could change panel color to new highlighted color
              // this.selectedObject.material.color = objectSelectedColor;
              this.selectedObjectDistance = this.selectedObject.position.distanceTo(controller.position);
            break
            default:
              console.log(ui, 'type grabbed')
          }

        }
      } else if (this.selectedObject) {
        // Move selected object so it's always the same distance from controller
        let moveVector = controller.getWorldDirection(new Vector3()).multiplyScalar(this.selectedObjectDistance).negate()
        if(thumbY){
          // console.log(thumbY, moveVector)
          moveVector.z = thumbY - 1
        } 
        this.selectedObject.position.copy(controller.position.clone().add(moveVector));
        // op rotation
        let rotationUpdate = controller.rotation.clone()
        if(thumbX){
          rotationUpdate._y = thumbX
        } 
        this.selectedObject.rotation.copy(rotationUpdate)
      }
    } else if (controller.userData.selectPressedPrev) {
      // Select released
      controller.children[0].scale.z = 10;
      if (this.selectedObject != null) {
        // todo: could change panel color back to an unselected colour
        // this.selectedObject.material.color = objectUnselectedColor;
        // handle object deletion
        if(this.selectedObject.position.y < 0.2){
          console.log(this.selectedObject)
          // remove from scene
          this.scene.remove(this.selectedObject)
          // dispose of the materials and geometries to prevent memory leaks
          for(let i = 0; i< this.selectedObject.children.length; i++){
            this.selectedObject.children[i].material.dispose()
            this.selectedObject.children[i].geometry.dispose()
          }
          console.log(this.objects)
        }
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

    if(this.patch.dirty.audio.graph == true){
      // update genish graph
      // console.log('dirtay')
      // updateGraph(this.patch.document.patch)
      // reset dirty flag
      this.patch.dirty.audio.graph = false
    }
    if(this.patch.dirty.vr == true){
      // update syncStore?
      
      // localGraph = this.patch.rebuild(this.scene)
      this.patch.dirty.vr = false
      
    }
    if (this.controllers) {
      this.controllers.forEach(controller => {
        let thumbX, thumbY
        if(controller.userData.gamepad){
          // leaving these here just so we know how to access thumbstick axes
          thumbX = controller.userData.gamepad.axes[2]
          thumbY = controller.userData.gamepad.axes[3]
        }
        this.handleController(controller, thumbX, thumbY);
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

  genish.export( window )
  genish.utilities.createContext()
});
