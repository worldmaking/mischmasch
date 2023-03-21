// three libs
import { WebGLRenderer, Scene, BoxGeometry, RawShaderMaterial, ShaderMaterial, MeshStandardMaterial, Mesh, HemisphereLight, UniformsUtils, GLSL3, AmbientLight, Uniform, UniformsLib, Color, ShaderLib, Matrix4 } from 'three';
import { VRButton } from 'three/addons/webxr/VRButton.js';
// other libs
import { vec2, vec3, vec4, quat, mat2, mat2d, mat3, mat4} from "gl-matrix"
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
// add the vr button
document.body.appendChild( VRButton.createButton( renderer ) );
renderer.xr.enabled = true;

// do this now and whenever the window is resized()
window.addEventListener("resize", function () {
  // ensure the renderer fills the page, and the camera aspect ratio matches:
  renderer.setSize(window.innerWidth, window.innerHeight);
  camera.aspect = window.innerWidth / window.innerHeight;
  camera.updateProjectionMatrix();
}, false);

// vars
let mainScene = null
let menuScene = null
let currentScene = null

// GOT graph, local copy.
let localGraph = {
	nodes: {},
	arcs: []
}

let menuGraph = {
	nodes: {},
	arcs: []
}

let menu;

let viewmatrix = mat4.create();
let projmatrix = mat4.create();
let viewmatrix_inverse = mat4.create();
let projmatrix_inverse = mat4.create();



let camera = new Camera().camera;
const scene = new Scene()
// make a cube
const geometry = new BoxGeometry();
const material = new MeshStandardMaterial();
const cube = new Mesh( geometry, material );
// position the cube, and add it to the scene:
cube.position.y = 1.5;
scene.add( cube );
// add ambient light
const light = new AmbientLight(0x404040, 1. );
scene.add(light);

// animate!
function animate() {
  // update the scene:
  cube.rotation.x += 0.01;
  cube.rotation.y += 0.01;
  // draw the scene:
  renderer.render( scene, camera );
};
// start!
renderer.setAnimationLoop(animate);


const UI = {

	keynav: {

		pos: vec3.fromValues(0, 0, 1),
		orient: quat.create(),
		// unit vectors of orientation:
		fwd: vec3.create(0, 0, -1),
		strafe: vec3.create(1, 0, 0),
		up: vec3.create(0, 1, 0),
		azimuth: 0,
		elevation: 0,

		mouse: [0,0], // ndc

		eyeHeight: 1.25,
		fwdState: 0,
		strafeState: 0,
		turnState: 0,
		speed: 1, // metres per second
		keySpeed: 1,
		
		handleKeys(key, down, mod) {
			switch (key) {
				case 87: // W
				case 265: // up
				this.fwdState = down ? 1 : 0; break;
				case 83: // S
				case 264: // down
				this.fwdState = down ? -1 : 0; break;
				case 68: // D
				this.strafeState = down ? 1 : 0; break;
				case 262: // right
				this.turnState = down ? 1 : 0; break;
				case 65: // A
				this.strafeState = down ? -1 : 0; break;
				case 263: // left
				this.turnState = down ? -1 : 0; break;
			}
			// handle mod, e.g. shift for 'run' and ctrl for 'creep'
			let shift = !!(mod % 2);
			let ctrl = !!(mod % 4);
			this.keySpeed = shift ? 4 : ctrl ? 1/4 : 1;
		},

		move(dt=1/60) {
			// near plane point
			let cam_near = vec3.transformMat4(vec3.create(), [this.mouse[0], this.mouse[1], -1], projmatrix_inverse);
			let world_near = vec3.transformMat4(vec3.create(), cam_near, viewmatrix_inverse);
			// far plane point
			let cam_far = vec3.transformMat4(vec3.create(), [this.mouse[0], this.mouse[1], +1], projmatrix_inverse);	
			let world_far = vec3.transformMat4(vec3.create(), cam_far, viewmatrix_inverse);
			let ray_dir = vec3.sub(vec3.create(), world_far, world_near);
			vec3.normalize(ray_dir, ray_dir);
			// compute a UI.hands[0] pos/orient/mat from the mouse & projview mat
			vec3.scale(UI.hands[0].pos, ray_dir, 0.25);
			vec3.add(UI.hands[0].pos, world_near, UI.hands[0].pos);
			mat4.getRotation(UI.hands[0].orient, viewmatrix_inverse);
			mat4.fromRotationTranslation(UI.hands[0].mat, UI.hands[0].orient, UI.hands[0].pos)
			vec3.copy(UI.hands[0].dir, ray_dir)

			// assign az/el for keynav:
			let [az, el] = this.mouse;
			// deadzone percentage, so that part of screen centre is at rest
			let deadzone = 0.5;
			let power = 2;
			az = Math.abs(az) < 1 ? Math.sign(az) * Math.pow(Math.max(0, (Math.abs(az)-deadzone)/(1.-deadzone)), power) : 0;
			el = Math.abs(el) < 1 ? Math.sign(el) * Math.pow(Math.max(0, Math.abs(el)), power) : 0;
			el = Math.max(Math.min(el, 1.), -1.);

			az = this.keySpeed * this.turnState;
			
			this.azimuth += dt * az * -180;
			this.elevation = el * 90;
			quat.fromEuler(this.orient, this.elevation, this.azimuth, 0);
		
			// get unit nav vectors:
			vec3.transformQuat(this.fwd, [0, 0, -1], this.orient);
			vec3.transformQuat(this.strafe, [1, 0, 0], this.orient);
			vec3.transformQuat(this.up, [0, 1, 0], this.orient);
			// compute velocity:
			let fwd = vec3.scale(vec3.create(), this.fwd, this.speed * this.keySpeed * dt * this.fwdState);
			let strafe = vec3.scale(vec3.create(), this.strafe, this.speed * this.keySpeed * dt * this.strafeState);
			// integrate:
			vec3.add(this.pos, this.pos, fwd);
			vec3.add(this.pos, this.pos, strafe);
			// fix eye height
			this.pos[1] = this.eyeHeight;
			return this;
		},

		updateViewMatrix(viewmatrix) {
			let at = vec3.add(vec3.create(), this.pos, this.fwd);
			return mat4.lookAt(viewmatrix, this.pos, at, this.up);
		},
	},
  hmd: {
		pos: [0, 1.4, 1],
		orient: [0, 0, 0, 1],
		mat: mat4.create(),
	},
  hands: [
		{
			name: "hand_left",
			pos: [-0.5, -1, 0.5], dpos: [0,0,0],
			orient: [0, 0, 0, 1],
			mat: mat4.create(),
			dir: vec3.fromValues(0, 0, -1),
			// UI:
			trigger: 0, trigger_pressed: 0,
			pad_x: 0, pad_y: 0, pad_dx: 0, pad_dy: 0, pad_pressed: 0, 
		grip_pressed:0, menu_pressed: 0,
			// state machine:
			state: "default",
			stateData: {},
		},
		{
			name: "hand_right",
			pos: [+0.5, -1, 0.5], dpos: [0,0,0],
			orient: [0, 0, 0, 1],
			mat: null,//mat4.create(),
			dir: vec3.fromValues(0, 0, -1),
			// UI:
			trigger: 0, trigger_pressed: 0,
			pad_x: 0, pad_y: 0, pad_dx: 0, pad_dy: 0, pad_pressed: 0, 
			grip_pressed:0, menu_pressed: 0,
			// state machine:
			state: "default",
			stateData: {},
		}
	],


}
