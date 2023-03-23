// three libs
import { WebGLRenderer, Scene, BoxGeometry, RawShaderMaterial, ShaderMaterial, MeshStandardMaterial, Mesh, HemisphereLight, UniformsUtils, GLSL3, AmbientLight, Uniform, UniformsLib, Color, ShaderLib, Matrix4, Clock } from 'three';
import { VRButton } from 'three/addons/webxr/VRButton.js';
// other libs
import { vec2, vec3, vec4, quat, mat2, mat2d, mat3, mat4} from "gl-matrix"
// systems
import { Camera } from './systems/camera.js'
import { Renderer } from './systems/Renderer.js' 
import { intersectCube, rayTestModules } from './systems/collisions.js'
// utilities
import { scale, hashCode, colorFromString, opMenuColour, value2angle, angle2value, prettyPrint } from './utilities/utilities.js'
import * as glutils from './utilities/glutils.js'
// settings files
import { systemSettings } from './settings/systemSettings.js'

const clock = new Clock();
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
let renderer;


function initRenderer(){
  renderer = new Renderer().r
  // create and add the <canvas>
  document.body.appendChild(renderer.domElement); 
  // add the vr button
  document.body.appendChild( VRButton.createButton( renderer ) );
  renderer.xr.enabled = true;
}

const UI = {

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
  cables: {

		arcs: [],
    
		init(renderer, gl) {
			// for temporary cables:
			this.module_vao = glutils.createVao(gl, renderer.module_geom, renderer.module_program.id)
			this.line_vao = glutils.createVao(gl, renderer.line_geom, renderer.line_program.id)
			this.module_instances = glutils.createInstances(gl, [
				{ name:"i_quat", components:4 },
				{ name:"i_color", components:4 },
				{ name:"i_pos", components:3 },
				{ name:"i_bb0", components:3 },
				{ name:"i_bb1", components:3 },
				{ name:"i_value", components:1 },
				{ name:"i_shape", components:1 },
				{ name:"i_highlight", components:1 },
			]),
			this.line_instances = glutils.createInstances(gl, [
				{ name:"i_color", components:4 },
				{ name:"i_quat0", components:4 },
				{ name:"i_quat1", components:4 },
				{ name:"i_pos0", components:3 },
				{ name:"i_pos1", components:3 },
			]),
			this.module_instances.attachTo(this.module_vao).allocate(4);
			this.line_instances.attachTo(this.line_vao).allocate(2);

		},

		// from / to should be scene widget or a wand
		// basically, all they need is an i_pos and i_quat	
		makeArc(from, to) {
			let arc = {
				from: from,
				to: to,
				// any other state?
			}
			this.arcs.push(arc);
			return arc;
		},

		destroyArc(arc) {
			const index = this.arcs.indexOf(arc);
			assert(index >= 0, "attempt to destroy arc that wasn't in the list");

			
			this.arcs.splice(index, 1)
			
			return this;
		},

		updateInstances() {
			this.module_instances.count = 0;
			this.line_instances.count = 0;

			for (let arc of this.arcs) {
				let line = this.line_instances.instances[this.line_instances.count];
				this.line_instances.count++;

				let {from, to} = arc;
				vec4.set(line.i_color, 1, 1, 1, 1);
				quat.copy(line.i_quat0, from.i_quat)
				quat.copy(line.i_quat1, to.i_quat)
				vec3.copy(line.i_pos0, from.i_pos)
				vec3.copy(line.i_pos1, to.i_pos)

				for (let parent of [from, to]) {
					let jack = this.module_instances.instances[this.module_instances.count];
					this.module_instances.count++;

					quat.copy(jack.i_quat, parent.i_quat)
					vec3.copy(jack.i_pos, parent.i_pos)
					vec4.set(jack.i_color, 0.5, 0.5, 0.5, 1)

					let scale = systemSettings.UI_DEFAULT_SCALE
					let dim = [1/4, 1/4, 1/2]
					vec3.copy(jack.i_bb1, [
						dim[0]*0.5*scale, 
						dim[1]*0.5*scale, 
						dim[2]*0.5*scale
					])
					vec3.negate(jack.i_bb0, jack.i_bb1)

					jack.i_shape[0] = systemSettings.SHAPE_CYLINDER;
					jack.i_value[0] = 0;
					jack.i_highlight[0] = 1;
				}
			}
		},

		submit() {
			this.module_instances.bind().submit().unbind()
			this.line_instances.bind().submit().unbind()
		},

		draw(gl) {
			renderer.module_program.begin();
			renderer.module_program.uniform("u_viewmatrix", viewmatrix);
			renderer.module_program.uniform("u_projmatrix", projmatrix);
			this.module_vao.bind().drawInstanced(this.module_instances.count).unbind()
			renderer.module_program.end();
	
			renderer.line_program.begin();
			renderer.line_program.uniform("u_viewmatrix", viewmatrix);
			renderer.line_program.uniform("u_projmatrix", projmatrix);
			renderer.line_program.uniform("u_stiffness", 0.5)
			// consider gl.LINE_STRIP with simpler geometry
			this.line_vao.bind().drawInstanced(this.line_instances.count, gl.LINES).unbind()
			renderer.line_program.end();
		},
	},
	
	updateStateMachines(scene) {
		for (let hand of this.hands) this.updateHandStateMachine(hand, scene)
	},

	updateHandStateMachine(hand, mainScene) {
		if (!hand.mat) return; // i.e. not tracking


		let hits = rayTestModules(mainScene.module_instances, hand.pos, hand.dir)

		hand.target = hits[0]
		hand.line.i_len[0] = hand.target ? hand.target[1] : 1
		
		let object, distance=Infinity;
		if (hand.target) {
			[object, distance] = hand.target
			object.i_highlight[0] = 1

			if(hand.state == "menu"){
				// TODO use this to display a tooltip above the hovered op, see issue #173
				// menu.getInfo(object.name)		

			}

			if(hand.B_pressed == true){
				console.log('selected op for module:', object.name)
			}

		}

		let grip_squeeze = (hand.grip_pressed == 1); // rising edge only
		// let pad_press = (hand.pad_press = 1)

		switch(hand.state) {
			case "menu": {
				if (object && hand.trigger_pressed) {
					// recurse up object parentage until we have a module:
					let module = object;
					while (module && !module.isModule) module = module.parent;
					if (module && module.isModule) {
						// add the module to patch.document
						patch.add('op', module)
						// exit menu:
						hand.state = "default";
					}
				} else if (grip_squeeze) {
					// exit menu for all controllers:
					this.hands.forEach(hand=>{
						if (hand.state == "menu") hand.state = "default";
					})
				} 
			} break;
			case "dragging": {
				// stick to what we picked:
				if (object) object.i_highlight[0] = 0
				object = hand.stateData.object
				object.i_highlight[0] = 1
				let oldPos = vec3.copy([], object.pos)
				let oldQuat = quat.copy([], object.quat)

				// use pad scroll to modify the module reel & rotate:
				let v = mat4.getTranslation([0,0,0], hand.stateData.objectRelativeMat);
				let q = mat4.getRotation([0,0,0,1], hand.stateData.objectRelativeMat);
				v[2] = Math.min(0, v[2] - systemSettings.UI_SCROLL_SPEED * hand.pad_dy)
				let r = quat.fromEuler([0, 0, 0, 1], 0, systemSettings.UI_ROTATE_SPEED*hand.pad_dx, 0)
				quat.multiply(q, r, q)
				mat4.fromRotationTranslation(hand.stateData.objectRelativeMat, q, v)
				
				// apply hand pose to the dragged object:
				let m = mat4.multiply(mat4.create(), hand.mat, hand.stateData.objectRelativeMat);
				mat4.getTranslation(object.pos, m)
				mat4.getRotation(object.quat, m)

				// check for exit:
				if (!hand.trigger_pressed) {
					// delete?
					if (object.i_pos[1] < 0) {
						let objectName = object.name.split('_')[1]
						patch.remove('op', objectName)
						
						// send delete delta
						// let deltas = []
						// // first we need to check for arcs that reference this node:
						// let pat = new RegExp(`^${object.path}(\\..*)?$`)
						// for (let arc of localGraph.arcs) {
						// 	if (pat.test(arc[0]) || pat.test(arc[1])) {
						// 		deltas.push({op:"disconnect", paths:arc })
						// 	}
						// }
						// // then remove modules; children first
						// makeDelNodeDelta(deltas, object.node, object.path)
						// // now send them:
						// outgoingDeltas.push(deltas)
					} 
					// release dragging:
					hand.state = "default";
				} else {
					// send propchange data to patch
					patch.update('pos', [object.path, object.pos])
					patch.update('quat', [object.path, object.quat])
					// propchange!
					// outgoingDeltas.push(
					// // 	{ 
					// // 	op:"propchange", 
					// // 	path: object.path, 
					// // 	name: "pos", 
					// // 	from: (oldPos), 
					// // 	to: object.pos  
					// // },
					// { 
					// 	op:"propchange", 
					// 	path: object.path, 
					// 	name: "orient", 
					// 	from: (oldQuat), 
					// 	to: object.quat  
					// })
				}
			} break;
			case "buttoning": 
			case "twiddling": 
			case "swinging": {
				// stick to what we picked:
				if (object) object.i_highlight[0] = 0
				object = hand.stateData.object
				object.i_highlight[0] = 1
				if (hand.trigger_pressed) {
					/*
						project ray from hand to plane of knob to find a point 'p'
						point the knob toward 'p'
						that is, get relative angle in knob space from knob centre to p
						(i.e. on the plane of the knob itself)
						and set the value according to that angle
					*/
					let dir = glutils.quat_unrotate(vec3.create(), object.i_quat, hand.dir);
					if (dir[2]) {
						let origin = vec3.sub(vec3.create(), hand.pos, object.i_pos);
						glutils.quat_unrotate(origin, object.i_quat, origin);


						let t = -origin[2]/dir[2]
						hand.line.i_len[0] = t
						let p = vec3.create()
						vec3.scale(p, dir, t)
						vec3.add(p, p, origin);
						// now want angle to this p:
						vec2.normalize(p, p)

						// angle of line to hand relative to knob face:
						let angle = Math.atan2(p[0], p[1]);
						let i_value = Math.min(1, Math.max(0, angle2value(angle)));
						// update prop:
						let props = object.node._props
						let range = props.range || [0,1];
						let oldval = object.value//range[0] + object.i_value[0]*(range[1]-range[0]);
						let newval = range[0] + i_value*(range[1]-range[0]);
						// post-processing:
						if (props.type == "int") newval = Math.max(range[0], Math.floor(newval))

						patch.update('param', [object, newval])


						// immediate update for rendering:
						object.i_value[0] = i_value;
						object.value = newval;

					}

				} else {
					hand.state = "default";
				}
			} break;
			case "cabling": {
				let {arc, cablingKind} = hand.stateData
				// if object, and object is a valid target for cable
				// TODO: consider allowing snap to floor to delete a cable?
				let ok = object && object.cablingKind == cablingKind
				if (ok) {
					// a valid target for this cable
					// snap jack to target
					arc[cablingKind] = object;
					// vec3.copy(jack.i_pos, object.i_pos)
					// quat.copy(jack.i_quat, object.i_quat)
					// e.g. seeking input, can cable to inlet, knob, and also a jack-inlet!
				} else {
					// snap jack to hand
					arc[cablingKind] = hand.wand;
					// vec3.copy(jack.i_pos, hand.pos)
					// quat.copy(jack.i_quat, hand.orient)
				}

				if (!hand.trigger_pressed) {
					this.cables.destroyArc(arc)
					// releasing jack now:
					if (ok) {

						patch.add('cable', [arc.from.path, arc.to.path])
					}
					// now delete temporary local cable
					hand.state = "default";
				}
			} break;
			default: {
				hand.state = "default"
				// we are not currently performing an action;
				// check for starting a new one:
				if (object && hand.trigger_pressed) {
					// what did we select?
					switch(object.kind) {
						case "knob": {
							// mode depends on distance:
							if (distance > systemSettings.UI_TOUCH_DISTANCE) {
								hand.state = "swinging"
								// cache initial hand & object values here
								hand.stateData.object = object
							} else {
								hand.state = "twiddling";
								// cache initial hand & object values here
								hand.stateData.object = object
							}
						} break;
						case "button": {
							// can update button value immediately
							// but need to go into a state that waits for release
							hand.state = "buttoning"
							hand.stateData.object = object
						} break;
						case "inlet": 
						case "outlet": {
							// spawn a new cable
							let target = object
							let type = target.cablingKind;
							assert(type, "nlet has no .cablingKind")
							let from = (type == "from") ? target : hand.wand;
							let to = (type == "to") ? target : hand.wand;
							let arc = this.cables.makeArc(from, to);
							
							// cache cabling state
							hand.state = "cabling"
							hand.stateData.arc = arc;
							// what end of the arc this hand needs to satisfy:
							hand.stateData.cablingKind = (type == "to") ? "from" : "to";
						} break;
						case "jack": {
							// if the jack's cable was fully connected, remove it from document
							let {line, parent} = object
							if (line && line.name) {

								let arc = line.name.split(">")
								
								// remove cable from document
								patch.remove('cable', arc)
								// let delta = { op:"disconnect", paths: paths };
								// outgoingDeltas.push(delta)

								// get widgets this line was connected to
								let {from, to} = line;
								if (from == parent) {
									from = hand.wand;
									hand.stateData.cablingKind = "from"
								} else {
									to = hand.wand;
									hand.stateData.cablingKind = "to"
								}
								// cache cabling state
								hand.stateData.arc = this.cables.makeArc(from, to);
								hand.state = "cabling"
							}
						} break;
						default: {
							if (object.isModule) {
								// a module
								hand.state = "dragging";
								// cache initial hand & object transforms here
								hand.stateData.object = object

								let invHandMat = mat4.invert(mat4.create(), hand.mat)
								// get pose of object relative to hand:
								hand.stateData.objectRelativeMat = mat4.multiply(mat4.create(), invHandMat, object.mat)

							}
						} break;
					}
				} else if (grip_squeeze) {
					// update menu positioning relative to user
					menu.updatePosition(UI.hmd)
					// rebuild the menu scene
					menuScene.rebuild(menuGraph)
					// call up the menu:
					hand.state = "menu";

					// when menu is loaded, check if the current scene does not have a speaker, if so add it now. reason is that at first I was adding a speaker on load, but most of the time the hmd was pointed down at load (off my head), and the speaker's orientation was funky. this way the speaker loads for the first time correctly
					patch.ensureSpeaker(UI.hmd)

				} else if(hand.pad_pressed){

				}
			}
		}
	},


	init(renderer, gl) {
    /* //! temporary
		this.cables.init(renderer, gl)
    
		this.ray_vao = glutils.createVao(gl, renderer.line_geom, renderer.ray_program.id)
		this.ray_instances = glutils.createInstances(gl, [
			//{ name:"i_color", components:4 },
			{ name:"i_pos", components:3 },
			{ name:"i_len", components:1 },
			{ name:"i_dir", components:3 },
		]);
		this.ray_instances.attachTo(this.ray_vao).allocate(16);

		this.wand_vao = glutils.createVao(gl, renderer.wand_geom, renderer.wand_program.id)
		this.wand_instances = glutils.createInstances(gl, [
			{ name:"i_quat", components:4 },
			{ name:"i_pos", components:3 },
		]);
		this.wand_instances.attachTo(this.wand_vao).allocate(16);
		

		for (let hand of this.hands) {
			let ray = this.ray_instances.instances[this.ray_instances.count];
			this.ray_instances.count++;
			hand.line = ray;
			//vec4.set(line.i_color, 1, 1, 1, 1);
		}
		return this.updateInstances();

    */
	},

	makeLocalCable() {

	},

	updateInstances() {
		this.cables.updateInstances()

		let i = 0;
		for(; i<this.hands.length; i++) {
			let hand = this.hands[i]
			vec3.copy(hand.line.i_pos, hand.pos)
			vec3.copy(hand.line.i_dir, hand.dir)

			let wand = this.wand_instances.instances[i];
			wand.name = hand.name
			hand.wand = wand;
			vec3.copy(wand.i_pos, hand.pos)
			quat.copy(wand.i_quat, hand.orient)
		}
		this.wand_instances.count = i;
		return this.submit()
	},

	submit() {
		this.cables.submit();
		
		this.ray_instances.bind().submit().unbind()
		this.wand_instances.bind().submit().unbind()
		return this;
	},

	draw(gl) {
		this.cables.draw(gl);
		
		renderer.wand_program.begin();
		renderer.wand_program.uniform("u_viewmatrix", viewmatrix);
		renderer.wand_program.uniform("u_projmatrix", projmatrix);
		//renderer.wand_program.uniform("u_modelmatrix", hand.mat);
		//renderer.wand_vao.bind().draw().unbind();
		UI.wand_vao.bind().drawInstanced(UI.wand_instances.count).unbind()
		renderer.wand_program.end();

		renderer.ray_program.begin();
		renderer.ray_program.uniform("u_viewmatrix", viewmatrix);
		renderer.ray_program.uniform("u_projmatrix", projmatrix);
		// consider gl.LINE_STRIP with simpler geometry
		this.ray_vao.bind().drawInstanced(this.ray_instances.count, gl.LINES).unbind()
		renderer.ray_program.end();
		return this;
	},

}


async function init() {
  initRenderer()
  UI.init(renderer, renderer.gl)
}

init()




// do this now and whenever the window is resized()
window.addEventListener("resize", function () {
  // ensure the renderer fills the page, and the camera aspect ratio matches:
  renderer.setSize(window.innerWidth, window.innerHeight);
  camera.aspect = window.innerWidth / window.innerHeight;
  camera.updateProjectionMatrix();
}, false);





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

  // get current timing:
  const dt = clock.getDelta();
  const t = clock.getElapsedTime();
  
  // update the scene:
  cube.rotation.x += 0.01;
  cube.rotation.y += 0.01;


  // draw the scene:
  renderer.render( scene, camera );
};
// start!
renderer.setAnimationLoop(animate);