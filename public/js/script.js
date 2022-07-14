//  threeJS stuff
import * as THREE from "https://unpkg.com/three@0.126.0/build/three.module.js";
import { OrbitControls } from "https://unpkg.com/three@0.126.0/examples/jsm/controls/OrbitControls.js";
import { TransformControls } from "https://unpkg.com/three@0.126.0/examples/jsm/controls/TransformControls.js";
import { VRButton } from './VRButton.js';

// GL stuff for browser
import { vec2, vec3, vec4, quat, mat2, mat2d, mat3, mat4 } from "https://cdn.skypack.dev/gl-matrix@3.4.3";

// To actually be able to display anything with three.js, we need three things: scene, camera and renderer, so that we can render the scene with camera.
//  scene
const scene = new THREE.Scene();
//  camera
const camera = new THREE.PerspectiveCamera( 75, window.innerWidth / window.innerHeight, 0.1, 1000 );
//  renderer
const renderer = new THREE.WebGLRenderer({ antialias: true });
// Make it fill the page
renderer.setSize(window.innerWidth, window.innerHeight);
renderer.setClearColor(0x222322, 1);
renderer.shadowMap.enabled = true;
//renderer.shadowMap.soft = true;
renderer.shadowMap.type = THREE.PCFShadowMap;

// append renderer to DOM.
//! note that it may be necessary to remove this line because the one after it might be all we need. 
document.body.appendChild( renderer.domElement );

document.body.appendChild( VRButton.createButton( renderer ) );
//  enable XR rendering
renderer.xr.enabled = true;

// animation render loop
function animate () {

    // draw the scene:
    renderer.render( scene, camera );

} 
// start the animation!
renderer.setAnimationLoop( animate());