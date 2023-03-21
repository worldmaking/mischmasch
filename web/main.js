import { WebGLRenderer, Scene, BoxGeometry, RawShaderMaterial, ShaderMaterial, MeshStandardMaterial, Mesh, HemisphereLight, UniformsUtils, GLSL3, AmbientLight, Uniform, UniformsLib, Color, ShaderLib, Matrix4 } from 'three';

// systems
import { Camera } from './systems/camera.js'
import { Renderer } from './systems/Renderer.js' 
import { intersectCube } from './systems/collisions.js'
// utilities
import { scale, hashCode, colorFromString, opMenuColour, value2angle, angle2value, prettyPrint } from './utilities/utilities.js'
import * as glutils from './utilities/glutils.js'
// settings files
import { systemSettings } from './settings/systemSettings.js'

const renderer = new Renderer().r
// create and add the <canvas>
document.body.appendChild(renderer.domElement); 


// do this now and whenever the window is resized()
window.addEventListener("resize", function () {
  // ensure the renderer fills the page, and the camera aspect ratio matches:
  renderer.setSize(window.innerWidth, window.innerHeight);
  camera.aspect = window.innerWidth / window.innerHeight;
  camera.updateProjectionMatrix();
}, false);

let camera = new Camera().camera;

const scene = new Scene()

const geometry = new BoxGeometry();

const uniforms = {
  u_viewmatrix: new Uniform( new Matrix4())
  // time: { value: 1.0 },

}

const material = new MeshStandardMaterial();


const cube = new Mesh( geometry, material );
// position the cube, and add it to the scene:
cube.position.y = 1.5;
scene.add( cube );

const light = new AmbientLight(0x404040, 1. );
scene.add(light);

function animate() {
  // update the scene:
  cube.rotation.x += 0.01;
  cube.rotation.y += 0.01;

  // draw the scene:
  renderer.render( scene, camera );
};
// start!
renderer.setAnimationLoop(animate);

