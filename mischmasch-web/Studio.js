// components
import { createScene } from './components/scene.js';

// systems
import { createCamera } from './systems/camera.js';
import { createRenderer } from './systems/renderer.js';
// webXR
import { Color, Scene } from "three";

import { VRButton } from 'three/examples/jsm/webxr/VRButton.js';
import { Vector2, BufferGeometry, Vector3, Matrix4, Group, Raycaster, Line} from 'three'

import Stats from 'three/examples/jsm/libs/stats.module.js';
import { GPUStatsPanel } from 'three/examples/jsm/utils/GPUStatsPanel.js';

import { XRControllerModelFactory } from 'three/examples/jsm/webxr/XRControllerModelFactory.js';


// These variables are module-scoped: we cannot access them
// from outside the module
let camera, renderer;

let loop;

// scenes
let studioScene, editor, patch;


class Studio {
  // 1. Create an instance of the Studio app
  constructor(container) {


    // load the camera
    camera = createCamera();

    // set up scenes
    studioScene = createScene('studio')
    studioScene.name = 'studio'
    const scene = new Scene();
    scene.background = new Color('black');

    // renderer
    renderer = createRenderer();
    // XR rendering
    document.body.appendChild( VRButton.createButton( renderer ) );
    renderer.xr.enabled = true;
    return scene;

  }

  
    //  animation methods
  start() {
    loop.start();
  }
    
  stop() {
    loop.stop();
  }
}

export { Studio } 