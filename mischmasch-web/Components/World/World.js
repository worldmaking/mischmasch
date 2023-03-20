// webXR
import { Color, Scene } from "three";

import { VRButton } from 'three/examples/jsm/webxr/VRButton.js';
import { Vector2, BufferGeometry, Vector3, Matrix4, Group, Raycaster, Line} from 'three'

import Stats from 'three/examples/jsm/libs/stats.module.js';
import { GPUStatsPanel } from 'three/examples/jsm/utils/GPUStatsPanel.js';

import { XRControllerModelFactory } from 'three/examples/jsm/webxr/XRControllerModelFactory.js';

class World {
  // 1. Create an instance of the World app
  constructor(container) {

    const scene = new Scene();
    scene.background = new Color('black');
    return scene;

  }
}

export { World } 