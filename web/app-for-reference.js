const assert = require("assert"),
	fs = require("fs"),
	path = require("path");
const { vec2, vec3, vec4, quat, mat2, mat2d, mat3, mat4} = require("gl-matrix")
const PNG = require("png-js");
// keep the 'ws' usage as well - coven requires this very spelling
// const ws = require('ws')
const username = require('username')
// const filename = path.basename(__filename)

// const chroma = require("chroma-js")
const {argv} = require('yargs')
const nodeglpath = "../../node-gles3"
// const rws = require('reconnecting-websocket');


const gl = require(path.join(nodeglpath, "gles3.js")),
glfw = require(path.join(nodeglpath, "glfw3.js")),
glutils = require(path.join(nodeglpath, "glutils.js"))


const componentPath = path.join(__dirname, 'Components')
// components
const Patch = require(path.join(componentPath, 'Patch/Patch.js'))
const Palette = require(path.join(componentPath, 'Palette/Palette.js'))
const Audio = require(path.join(componentPath, 'Audio/Audio.js'))
let patch = new Patch()

// let p2pID; 
let name;
if (argv.name){
  name = argv.name
} else {
  name = username.sync()
}


let USEVR = (process.platform === "win32") && !(argv.vr === 'false');
// usevr if its specified on CLI & skip VR if on OSX:
console.log('using VR?', USEVR)
let vr = (USEVR) ? require(path.join(nodeglpath, "openvr.js")) : null

// const shaderpath = path.join(__dirname, "shaders")

// generate a random name for new object:
let gensym = (function() {
    let nodeid = 0;
    return function (prefix="node") {
        //return `${prefix}_${nodeid++}_${userPose.id}`
		//return `${prefix}_${nodeid++}`
			console.log(prefix)
		return `${prefix}_${Date.now()}`	
    }
})();

/* //! moved into utilities.js
function hashCode(str) { // java String#hashCode
    let hash = 0;
    for (let i = 0; i < str.length; i++) {
       hash = str.charCodeAt(i) + ((hash << 5) - hash);
    }
    return hash;
} 
function colorFromString(str) {
	return chroma.hsl(Math.abs(hashCode(str)) % 360, 0.35, 0.5).gl()
}
function opMenuColour(opCategory){
	let num = hashCode(opCategory)
	return chroma.hsl(Math.abs(num) % 360, 0.35, 0.5).gl()
}
function scale(t, ilo, ihi, olo, ohi) {
	return (t-ilo)*(ohi-olo)/(ihi-ilo) + olo;
}
*/

/* //! moved into collisions.js
// p0, p1 are the min/max bounding points of the cube
// rayDir is assumed to be normalized to length 1
// boxPos, boxQuat, rayOrigin, rayDir are all assumed to be in world space
function intersectCube(boxPos, boxQuat, p0, p1, rayOrigin, rayDir) {
	// convert ray origin/direction to object-space:
	let origin = vec3.sub(vec3.create(), rayOrigin, boxPos);
	glutils.quat_unrotate(origin, boxQuat, origin);
	let dir = glutils.quat_unrotate(vec3.create(), boxQuat, rayDir);
	// using p = origin + dir*t
	// get ray `t` for each bounding plane of the cube:
	let t0 = [
		(p0[0]-origin[0])/dir[0],
		(p0[1]-origin[1])/dir[1],
		(p0[2]-origin[2])/dir[2],
	];
	let t1 = [
		(p1[0]-origin[0])/dir[0],
		(p1[1]-origin[1])/dir[1],
		(p1[2]-origin[2])/dir[2],
	];
	// sort into first (entry) and second (exit) hits:
	let tmin = vec3.min(vec3.create(), t0, t1); 
	let tmax = vec3.max(vec3.create(), t0, t1);
	// ray is a hit if the last(furthest) entry plane is before the first(nearest) exit plane
	let tentry = Math.max(tmin[0], tmin[1], tmin[2])
	let texit = Math.min(tmax[0], tmax[1], tmax[2])

	// hit if entry is before exit:
	return [tentry <= texit && texit > 0, tentry];
}
*/ 

/* no longer used
function makeDelNodeDelta(deltas, node, path) {
	for (let name of Object.keys(node)) {
		if (name != "_props") {
			makeDelNodeDelta(deltas, node[name], path+"."+name)
		}
	}
	let delta = {op:"delnode", path:path}
	Object.assign(delta, node._props)
	deltas.push(delta)
}
*/

////////////////////////////////////////////////////////////////

/* //! moved into systemSettings.js
const SHAPE_BOX = 0;
const SHAPE_BUTTON = 1;
const SHAPE_CYLINDER = 2;
const SHAPE_KNOB = 3;

const UI_DEFAULT_SCALE = 0.1;
const UI_DEPTH = 1/3;
const UI_NUDGE = 0.01;
const UI_SCROLL_SPEED = 1;
const UI_ROTATE_SPEED = 180;
const UI_TOUCH_DISTANCE = 0.1; // near enough to consider touch-based interaction
const UI_KNOB_ANGLE_LIMIT = Math.PI * 5./6.; // 7 o'clock through 5 o'clock
*/
/* //! moved into utilities.js
function value2angle(val) {
	return scale(val, 0., 1., -systemSettings.UI_KNOB_ANGLE_LIMIT, systemSettings.UI_KNOB_ANGLE_LIMIT);
}
function angle2value(a) {
	return scale(a, -systemSettings.UI_KNOB_ANGLE_LIMIT, systemSettings.UI_KNOB_ANGLE_LIMIT, 0., 1.);
}
*/ 

/* //! moved into systemSettings.js
const NEAR_CLIP = 0.01;
const FAR_CLIP = 20;
*/

/* //! moved into main.js
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
*/

const renderer = {
	
}

const UI = {
	/* //! moved to main.js
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
					
						// project ray from hand to plane of knob to find a point 'p'
						// point the knob toward 'p'
						// that is, get relative angle in knob space from knob centre to p
						// (i.e. on the plane of the knob itself)
						// and set the value according to that angle
					
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
	*/
}



//! moved to systemSettings
// let vrdim = [4096, 4096];



// const menuModules = JSON.parse(fs.readFileSync(path.join("useful_for_2022","menu.json"), "utf-8"))



////////////////////////////////////////////////////////////////
// INIT DEPENDENT LIBRARIES:
////////////////////////////////////////////////////////////////

if (!glfw.init()) {
	console.log("Failed to initialize GLFW");
	process.exit(-1);
}
let version = glfw.getVersion();
console.log('glfw ' + version.major + '.' + version.minor + '.' + version.rev);
console.log('glfw version-string: ' + glfw.getVersionString());

if (USEVR) {
	try{
		assert(vr.connect(true), "vr failed to connect");
		vr.update()
		vrdim = [vr.getTextureWidth(), vr.getTextureHeight()]
	} catch (e) {
		console.error(e)
		// graceful
		vr = null;
	}
}

function createSDFFont(gl, pngpath, jsonpath) {
	let png = PNG.load(pngpath);
	let json = JSON.parse(fs.readFileSync(jsonpath, "utf8"));
	let font = {
		png: png,
		json: json,
		texture: glutils.createPixelTexture(gl, png.width, png.height),
		// add to json a quick lookup table by character:
		lookup: {},
		// add a quick scalar factor:
		scale: 1 / json.info.size,
	}
	json.chars.forEach(char => { 
		font.lookup[char.char.toString()] = char; 
		// cache UVs here:
		char.texCoords = vec4.set(vec4.create(),
			char.x / json.common.scaleW,
			char.y / json.common.scaleH,
			(char.x + char.width) / json.common.scaleW,
			(char.y + char.height) / json.common.scaleH
		);	
		// cache quad bounds here:
		char.quad = vec4.set(vec4.create(),
			char.xoffset * font.scale,
			(json.common.base - char.yoffset) * font.scale,
			char.width * font.scale,
			-char.height * font.scale
		); 
	})
	font.charwidth = font.lookup[" "].xadvance * font.scale;
	font.charheight = font.json.common.lineHeight * font.scale;

	png.decode(pixels => {
		assert(pixels.length == font.texture.data.length);
		font.texture.data = pixels;
		font.texture.bind().submit()
		gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.LINEAR);
		gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MAG_FILTER, gl.LINEAR);
		font.texture.unbind();
	})

	return font;
}


function initWindow() {
	// Open OpenGL window
	glfw.defaultWindowHints();
	glfw.windowHint(glfw.CONTEXT_VERSION_MAJOR, 3);
	glfw.windowHint(glfw.CONTEXT_VERSION_MINOR, 3);
	glfw.windowHint(glfw.OPENGL_FORWARD_COMPAT, 1);
	glfw.windowHint(glfw.OPENGL_PROFILE, glfw.OPENGL_CORE_PROFILE);

	let h = 1024;
	let vraspect = vrdim[0]/vrdim[1];
	if (vraspect > 1.5) vraspect /= 2;
	let w = Math.floor(h * vraspect)
	window = glfw.createWindow(w, h, "Test");
	if (!window) {
		console.log("Failed to open GLFW window");
		glfw.terminate();
		process.exit(-1);
	}
	glfw.makeContextCurrent(window);
	console.log(gl.glewInit());

	//can only be called after window creation!
	console.log('GL ' + glfw.getWindowAttrib(window, glfw.CONTEXT_VERSION_MAJOR) + '.' + glfw.getWindowAttrib(window, glfw.CONTEXT_VERSION_MINOR) + '.' + glfw.getWindowAttrib(window, glfw.CONTEXT_REVISION) + " Profile: " + glfw.getWindowAttrib(window, glfw.OPENGL_PROFILE));

	// Enable vertical sync (on cards that support it)
	glfw.swapInterval(!USEVR); // 0 for vsync off
	glfw.setWindowPos(window, 32, 32)
	
	return window
}

function initRenderer(renderer) {
	
	renderer.font = createSDFFont(gl, "font/CONSOLATTF.png", "font/CONSOLA.TTF-msdf.json")
	/* //! moved to Renderer.js
	renderer.textquad_geom = glutils.makeQuad({ min:0., max:1, div:8 });
	renderer.module_geom = glutils.makeCube({ 
		min:[-1,-1, 0], 
		max:[ 1, 1, 1], 
		div: [13, 13, 1] 
	});
	*/

	// renderer.wand_geom = glutils.makeCube({ 
	// 	min:[-0.03,-0.03, 0], 
	// 	max:[ 0.03, 0.03, 0.1], 
	// 	div: [13, 13, 1] 
	// });
	
	// right controller
	renderer.wand_geom = glutils.geomFromOBJ(fs.readFileSync(path.join(__dirname, "objs/touch_right", "oculus_cv1_controller_right.obj"), "utf-8"))
	/* //! moved to Renderer.js
	renderer.line_geom = glutils.makeLine({ min:0, max:1, div: 24 });
	const floor_m = 6;
	renderer.floor_geom = glutils.makeQuad({ min: -floor_m, max: floor_m, div:8 })
	renderer.debug_geom = glutils.makeCube({min:-0.01, max:0.01})
	*/
	
	/* //! moved to Renderer.js
	renderer.fbo_program = glutils.makeProgram(gl,
`#version 330
in vec4 a_position;
in vec2 a_texCoord;
uniform vec2 u_windim;
uniform vec2 u_texdim;
out vec2 v_texCoord;
void main() {
	gl_Position = a_position;
	
	// fit fbo dim into window dim
	float win_aspect = u_windim.x/u_windim.y;
	float tex_aspect = u_texdim.x/u_texdim.y;
	float aspect = tex_aspect / win_aspect;
	vec2 scale = vec2(aspect, 1.);

    vec2 adj = vec2(1, -1);
    gl_Position.xy = (gl_Position.xy + adj)*scale.xy - adj;
    v_texCoord = a_texCoord;
}`,
`#version 330
precision mediump float;
uniform sampler2D u_tex;
in vec2 v_texCoord;
out vec4 outColor;

void main() {
	outColor = vec4(v_texCoord, 0., 1.);
	outColor = texture(u_tex, v_texCoord);
}`
	);

renderer.floor_program = glutils.makeProgram(gl,
`#version 330
uniform mat4 u_viewmatrix;
uniform mat4 u_projmatrix;

// geometry variables:
in vec2 a_position;
in vec2 a_texCoord;

out vec2 v_xz;
out vec2 v_uv;

void main() {
	vec4 vertex = vec4(a_position.x, 0., a_position.y, 1.);
	gl_Position = u_projmatrix * u_viewmatrix * vertex;
	float divs = 5.; // lines per metre
	v_xz = a_position.xy * divs; 
	v_uv = abs(a_texCoord.xy*2.-1.);
}`,
`#version 330
precision mediump float;
in vec2 v_xz;
in vec2 v_uv;
out vec4 outColor;

// void mainImage( out vec4 fragColor, in vec2 fragCoord )
// {
//     vec2 uv = (fragCoord  - 0.5 * iResolution.xy) / iResolution.y;
    
//     vec3 col = vec3( fibonacci(uv) );

//     fragColor = vec4(col, 1.0);

// }

void main() {

	// fade in the distance
	float alpha = 1.-length(v_uv);
	float soft = 0.02;


	vec2 grid = smoothstep(soft, -soft, abs(mod(v_xz, 1.) - 0.5));
	outColor = vec4(length(grid) * alpha);

	float d = length(v_xz);
	float b = floor(mod(d * 8., 1.) / 8.);
	float ribs = smoothstep(soft, -soft, abs(mod(d, 1.) - 0.5));

	outColor = vec4(ribs);


	//outColor = vec4(clamp(0.3-0.2*floor(d)/10., 0., 1.));

	// vec2 checks = floor(mod(v_xz, 1.) + alpha);
	// float q = checks.x * checks.y;
	// outColor = vec4(q);

	// float c = floor(0.5-length(mod(v_xz, 1.)-0.5) + alpha);
	// outColor = vec4(c);

	//outColor = vec4(fibonacci(v_xz / 64., 0., 100.));

	//outColor *= 0.3;
	outColor *= alpha;

}`
	);
	

	renderer.wand_program = glutils.makeProgram(gl,
`#version 330
//uniform mat4 u_modelmatrix;
uniform mat4 u_viewmatrix;
uniform mat4 u_projmatrix;
in vec3 a_position;
in vec3 a_normal;
in vec2 a_texCoord;

in vec3 i_pos;
in vec4 i_quat;

out vec4 v_color;
out vec3 v_normal, v_cnormal;
out vec2 v_uv;

vec3 quat_rotate(vec4 q, vec3 v) {
	return v + 2.0*cross(q.xyz, cross(q.xyz, v) + q.w*v);
}
vec4 quat_rotate(vec4 q, vec4 v) {
	return vec4(v.xyz + 2.0*cross(q.xyz, cross(q.xyz, v.xyz) + q.w*v.xyz), v.w);
}

void main() {
	// Multiply the position by the matrix.
	vec3 vertex = quat_rotate(i_quat, a_position.xyz) + i_pos;
	gl_Position = u_projmatrix * u_viewmatrix * vec4(vertex, 1);

	v_color = vec4(a_normal*0.25+0.25, 1.);
	v_color += vec4(a_texCoord*0.5, 0., 1.);

	vec3 normal = a_normal;
	vec2 uv = a_texCoord;
	normal = quat_rotate(i_quat, normal);
	v_cnormal = mat3(u_viewmatrix) * normal;
	v_uv = uv;
	v_color = vec4(1.);
}
`,
`#version 330
precision mediump float;

in vec4 v_color;
in vec3 v_cnormal;
in vec2 v_uv;

out vec4 outColor;

void main() {
	outColor = v_color;
	vec3 cnormal = normalize(v_cnormal);
	float cd = pow(1.-abs(dot(cnormal, vec3(0, 0, -1))), 4.);
	outColor = vec4(cd*0.4);
}`
	);
	

	renderer.line_program = glutils.makeProgram(gl,
`#version 330
uniform mat4 u_viewmatrix;
uniform mat4 u_projmatrix;
uniform float u_stiffness;

// instance variables:
in vec4 i_color;
in vec4 i_quat0;
in vec4 i_quat1;
in vec3 i_pos0;
in vec3 i_pos1;

in float a_position; // not actually used...
in vec2 a_texCoord;

out vec4 v_color;
out float v_t;

vec3 quat_rotate(vec4 q, vec3 v) {
	return v + 2.0*cross(q.xyz, cross(q.xyz, v) + q.w*v);
}
vec4 quat_rotate(vec4 q, vec4 v) {
	return vec4(v.xyz + 2.0*cross(q.xyz, cross(q.xyz, v.xyz) + q.w*v.xyz), v.w);
}

vec3 bezier(float t, vec3 v0, vec3 v1, vec3 v2, vec3 v3) {
	// interp the 3 line segments:
	vec3 v01 = mix(v0, v1, t);
	vec3 v12 = mix(v1, v2, t);
	vec3 v23 = mix(v2, v3, t);
	// interp those:
	vec3 v012 = mix(v01, v12, t);
	vec3 v123 = mix(v12, v23, t);
	// interp those:
	return mix(v012, v123, t);
}

float smootherstep(float edge0, float edge1, float x) {
	x = clamp((x - edge0) / (edge1 - edge0), 0.0, 1.0);
	return x*x*x*(x*(x*6 - 15) + 10);
}

void main() {
	// control points:
	float stiffness = u_stiffness;
	vec3 c0 = i_pos0 + quat_rotate(i_quat0, vec3(0., 0., stiffness));
	vec3 c1 = i_pos1 + quat_rotate(i_quat1, vec3(0., 0., stiffness));

	// bias t's distribution toward end points where curvature is greatest
	float t = smoothstep(0., 1., a_texCoord.x);

	// derive point from bezier:
	vec4 vertex = vec4(bezier(t, i_pos0, c0, c1, i_pos1), 1.);
	
	gl_Position = u_projmatrix * u_viewmatrix * vertex;

	// line intensity stronger near end points:
	v_color = i_color;
	v_t = t;

	// it might be nice to estimate the length of the bezier curve, for patterning purposes
	// however there is no analytic solution to this
	// we could estimate the local scaling factor (between t and object space) 
	// by computing two bezier points near the current point and getting the distance
}`,
`#version 330
precision mediump float;

in vec4 v_color;
in float v_t;
out vec4 outColor;

void main() {
	outColor = v_color;

	// stippling:
	// float stipplerate = 1.; // 1.0
	// float stippleclamp = 0.; 
	// float stipple = 1. - 0.372*smoothstep(stippleclamp, 1.-stippleclamp, abs(sin(3.141592653589793 * v_t * stipplerate)));
	float stipple = smoothstep(0., 1., 0.5+abs(v_t - 0.5));
	outColor *= v_color * stipple;
}`
	);
	
	renderer.ray_program = glutils.makeProgram(gl,
		`#version 330
		uniform mat4 u_viewmatrix;
		uniform mat4 u_projmatrix;
		uniform float u_stiffness;
		
		// instance variables:
		in vec3 i_pos;
		in float i_len;
		in vec3 i_dir;
		
		in float a_position; // not actually used...
		in vec2 a_texCoord;
		
		out float v_t;
		
		vec3 quat_rotate(vec4 q, vec3 v) {
			return v + 2.0*cross(q.xyz, cross(q.xyz, v) + q.w*v);
		}
		vec4 quat_rotate(vec4 q, vec4 v) {
			return vec4(v.xyz + 2.0*cross(q.xyz, cross(q.xyz, v.xyz) + q.w*v.xyz), v.w);
		}
		
		vec3 bezier(float t, vec3 v0, vec3 v1, vec3 v2, vec3 v3) {
			// interp the 3 line segments:
			vec3 v01 = mix(v0, v1, t);
			vec3 v12 = mix(v1, v2, t);
			vec3 v23 = mix(v2, v3, t);
			// interp those:
			vec3 v012 = mix(v01, v12, t);
			vec3 v123 = mix(v12, v23, t);
			// interp those:
			return mix(v012, v123, t);
		}
		
		float smootherstep(float edge0, float edge1, float x) {
			x = clamp((x - edge0) / (edge1 - edge0), 0.0, 1.0);
			return x*x*x*(x*(x*6 - 15) + 10);
		}
		
		void main() {
			float t = a_texCoord.x;
		
			// derive point from bezier:
			vec3 vertex = i_pos + i_dir*(t*i_len);
			
			gl_Position = u_projmatrix * u_viewmatrix * vec4(vertex, 1.);
			v_t = t;
		}`,
		`#version 330
		precision mediump float;
		
		in float v_t;
		out vec4 outColor;
		
		void main() {
			// stippling:
			// float stipplerate = 1.; // 1.0
			// float stippleclamp = 0.; 
			// float stipple = 1. - 0.372*smoothstep(stippleclamp, 1.-stippleclamp, abs(sin(3.141592653589793 * v_t * stipplerate)));
			float stipple = smoothstep(0., 1., 0.5+abs(v_t - 0.5));
			outColor = vec4(stipple);
		}`
	);
	
	renderer.textquad_program = glutils.makeProgram(gl, 
`#version 330
uniform mat4 u_viewmatrix;
uniform mat4 u_projmatrix;

// instanced variable:
in mat4 i_modelmatrix;
in vec4 i_fontbounds;
in vec4 i_fontcoord;
//in vec4 i_color;

// geometry variables:
in vec3 a_position;
in vec3 a_normal;
in vec2 a_texCoord;

out vec4 v_color;
out vec2 v_uv;

// http://www.geeks3d.com/20141201/how-to-rotate-a-vertex-by-a-quaternion-in-glsl/
vec3 quat_rotate( vec4 q, vec3 v ){
	return v + 2.0 * cross( q.xyz, cross( q.xyz, v ) + q.w * v );
}
vec4 quat_rotate( vec4 q, vec4 v ){
	return vec4(v.xyz + 2.0 * cross( q.xyz, cross( q.xyz, v.xyz ) + q.w * v.xyz), v.w );
}

void main() {
	// 2D bounded coordinates of textquad:
	vec2 p = a_position.xy*i_fontbounds.zw + i_fontbounds.xy; 
	
	// Multiply the position by the matrix.
	vec4 vertex = i_modelmatrix * vec4(p, 0., 1.);
	gl_Position = u_projmatrix * u_viewmatrix * vertex;

	// if needed:
	// v_normal = (i_modelmatrix * vec4(0., 0., 1., 1.)).xyz;

	v_color = vec4(1.);
	// if needed:
//	v_color = i_color;
	v_uv = mix(i_fontcoord.xy, i_fontcoord.zw, a_texCoord); 
}`,
`#version 330
precision mediump float;
uniform sampler2D u_texture;
in vec4 v_color;
in vec2 v_uv;
out vec4 outColor;

float median(float r, float g, float b) {
		return max(min(r, g), min(max(r, g), b));
}
float aastep(float threshold, float value) {
	float afwidth = length(vec2(dFdx(value), dFdy(value))) * 0.70710678118654757;
	return smoothstep(threshold-afwidth, threshold+afwidth, value);
}

void main() {
	vec3 sample = texture(u_texture, v_uv).rgb;
	float sigDist = median(sample.r, sample.g, sample.b) - 0.5;
	float alpha = clamp(sigDist/fwidth(sigDist) + 0.5, 0.0, 1.0);
	outColor = v_color * alpha;
}`
	);


	renderer.module_program = glutils.makeProgram(gl,

		`#version 330
uniform mat4 u_viewmatrix;
uniform mat4 u_projmatrix;

// instance attrs:
in vec4 i_quat;
in vec4 i_color;
in vec3 i_pos;
in vec3 i_bb0;
in vec3 i_bb1;
in float i_shape;
in float i_value;
in float i_highlight;


in vec3 a_position;
in vec3 a_normal;
in vec2 a_texCoord;

out vec4 v_color;
out vec3 v_normal;
out float v_shape;
out vec2 v_uv;

const float PI = 3.141592653589793;
const float KNOB_ANGLE_LIMIT = ${systemSettings.UI_KNOB_ANGLE_LIMIT};

float scale(float t, float ilo, float ihi, float olo, float ohi) {
	return (t-ilo)*(ohi-olo)/(ihi-ilo) + olo;
}

// http://www.geeks3d.com/20141201/how-to-rotate-a-vertex-by-a-quaternion-in-glsl/
vec3 quat_rotate( vec4 q, vec3 v ){
	return v + 2.0 * cross( q.xyz, cross( q.xyz, v ) + q.w * v );
}
vec4 quat_rotate( vec4 q, vec4 v ){
	return vec4(v.xyz + 2.0 * cross( q.xyz, cross( q.xyz, v.xyz ) + q.w * v.xyz), v.w );
}
// rotation around z axis
vec2 rotZ(float z, vec2 p) {
	float sz = sin(z);
	float cz = cos(z);
	return vec2(
		cz*p.x + sz*p.y,
		cz*p.y - sz*p.x
	); 
}

void main() {

	// Multiply the position by the matrix.
	vec3 vertex = a_position.xyz;
	vec3 normal = normalize(a_normal);
	vec2 uv = a_texCoord;

	if (i_shape > 1.5) {
		// systemSettings.SHAPE_CYLINDER:
	 	vec2 p = vertex.xy;
	 	p = p * abs(normalize(p));

	 	if (normal.z == 0.) {
	 		uv.x = mod(uv.x * 2., 1.);
	 	}
		if (i_shape > 2.5) {
			// systemSettings.SHAPE_KNOB
			if (p.y > 0. && abs(p.x) < 0.1) {
				p.xy *= 1.25;    
				uv.x = mod(uv.x + 0.5, 1.);
			}
			// rotate by i_value
			// knob rotation range is 7 o'clock to 5 o'clock
			// 0..1 -> -5/6pi .. +5/6pi
			float a = scale(i_value, 0., 1., -KNOB_ANGLE_LIMIT, KNOB_ANGLE_LIMIT);
			p = rotZ(a, p);
		}

	 	normal.xy = normalize(mix(p.xy, vec2(0.), abs(normal.z)));
	 	vertex.xy = p;

	} 

	vertex = mix(i_bb0, i_bb1, vertex*0.5+0.5);


	vertex = quat_rotate(i_quat, vertex);
	vertex = vertex + i_pos.xyz;
	// u_modelmatrix * 
	gl_Position = u_projmatrix * u_viewmatrix * vec4(vertex, 1);

	normal = quat_rotate(i_quat, normal);
	v_normal = normal;
	v_uv = uv;
	v_shape = i_shape;
	v_color = i_color + (i_highlight*0.5);
}`,
`#version 330
precision mediump float;

in vec4 v_color;
in vec3 v_normal;
in float v_shape;
in vec2 v_uv;
out vec4 outColor;

// see https://mercury.sexy/hg_sdf/
// Cylinder standing upright on the xz plane
float fCylinder(vec3 p, float r, float height) {
	float d = length(p.xz) - r;
	d = max(d, abs(p.y) - height);
	return d;
}

void main() {
	outColor = v_color;
	vec3 normal = normalize(v_normal);

	vec2 dxt = dFdx(v_uv);
	vec2 dyt = dFdy(v_uv);
	float line = length(abs(dxt)+abs(dyt));
	float line1 = clamp(line * 5.,0.25,0.75);

	vec2 v = v_uv * 2. - 1.;
	vec2 v2 = smoothstep(1., 1.-line*8., abs(v));
	float line2 = 1.-(v2.x*v2.y);
	outColor *= max(line1, line2) ; // this over exposes the color making it look brighter * vec4(4.);

	// alternate render for cylinder shape
	//float d = fCylinder(p, 1., 1.);
}`

	);

	renderer.debug_program = glutils.makeProgram(gl,
`#version 330
uniform mat4 u_viewmatrix;
uniform mat4 u_projmatrix;
uniform vec3 u_position;
in vec3 a_position;
in vec3 a_normal;
in vec2 a_texCoord;
out vec4 v_color;

void main() {
	// Multiply the position by the matrix.
	vec3 vertex = u_position.xyz + a_position.xyz;
	gl_Position = u_projmatrix * u_viewmatrix * vec4(vertex, 1);

	v_color = vec4(a_normal*0.25+0.25, 1.);
	v_color += vec4(a_texCoord*0.5, 0., 1.);

	// in case of debugging via gl.POINTS:
	//gl_PointSize = 10.;
}`,
`#version 330
precision mediump float;

in vec4 v_color;
out vec4 outColor;

void main() {
	outColor = v_color;
}`
	);
	*/

	// GLOBAL GL RESOURCES:
	/* //! moved to Renderer.js
	renderer.floor_vao = glutils.createVao(gl, renderer.floor_geom, renderer.floor_program.id);
	
	renderer.debug_vao = glutils.createVao(gl, renderer.debug_geom, renderer.debug_program.id);
	renderer.fbo_vao = glutils.createVao(gl, glutils.makeQuad(), renderer.fbo_program.id);
	renderer.fbo = glutils.makeFboWithDepth(gl, vrdim[0], vrdim[1])
	*/
}

function makeSceneGraph(renderer, gl) {

	let font = renderer.font;

	return {

		// create VAOs for the geometry types:
		module_vao: glutils.createVao(gl, renderer.module_geom, renderer.module_program.id),
		line_vao: glutils.createVao(gl, renderer.line_geom, renderer.line_program.id),
		textquad_vao: glutils.createVao(gl, renderer.textquad_geom, renderer.textquad_program.id),

		// create VBOs and JS interfaces for instances of each geometry type:
		module_instances: glutils.createInstances(gl, [
			{ name:"i_quat", components:4 },
			{ name:"i_color", components:4 },
			{ name:"i_pos", components:3 },
			{ name:"i_bb0", components:3 },
			{ name:"i_bb1", components:3 },
			{ name:"i_value", components:1 },
			{ name:"i_shape", components:1 },
			{ name:"i_highlight", components:1 },
		]),
		line_instances: glutils.createInstances(gl, [
			{ name:"i_color", components:4 },
			{ name:"i_quat0", components:4 },
			{ name:"i_quat1", components:4 },
			{ name:"i_pos0", components:3 },
			{ name:"i_pos1", components:3 },
		]),
		textquad_instances: glutils.createInstances(gl, [
			{ name: "i_modelmatrix", components: 16 },
			{ name: "i_fontbounds", components: 4 },
			{ name: "i_fontcoord", components: 4 },
		//	{ name: "i_color", components: 4 },
		]),

		// JS interface to scene graph:
		root: null,
		// lookup table from full path name to module isntance:
		paths: {},
			
		init(gl) {
			// attach instances to VAOs:
			// pre-allocate a few instances for initial headroom
			this.module_instances.attachTo(this.module_vao).allocate(128);
			this.line_instances.attachTo(this.line_vao).allocate(128);
			this.textquad_instances.attachTo(this.textquad_vao).allocate(512);
			return this;
		},

		// message is a string
		addText(message, modelmatrix=mat4.create()) {
			let idx = this.textquad_instances.count;
			// reallocate if necessary:
			this.textquad_instances.allocate(idx + message.length);
			// the .instances provides a convenient interface to the underlying arraybuffer
			let x = 0;
			let y = 0;
			for (var i = 0; i < message.length; i++) {
				let c = message.charAt(i).toString();
				// space characters don't render, just update cursor:
				if (c === " ") {
					x += font.charwidth;
				} else if (c === "\t") {
					x += font.charwidth* 3;
				} else if (c === "\n") {
					x = 0;
					y -= font.json.common.lineHeight * font.scale;
				} else {
					const char = font.lookup[c];
					if (!char) {
						console.error("couldn't find character: ", c, typeof(c));
						continue;
					}
					// get instance interface for this character:
					let obj = this.textquad_instances.instances[idx];
					// the anchor coordinate system for the text:
					mat4.copy(obj.i_modelmatrix, modelmatrix);
					// color:
		//			vec4.set(obj.i_color, 1, 1, 1, 1)
					// bounding coordinates of the quad for this character:
					vec4.copy(obj.i_fontbounds, char.quad);
					// offset by character location:
					obj.i_fontbounds[0] += x;
					obj.i_fontbounds[1] += y;
					// UV coordinates for this character:	
					vec4.copy(obj.i_fontcoord, char.texCoords);
					// next instance:
					idx++; 
					// update cursor:
					x += char.xadvance * font.scale;
				}
			}
			// return the used instance count so we know how many to render
			this.textquad_instances.count = idx;
		},

		// re-generate the entire scene from the GOT graph received
		rebuild(graph) {
			// reset instance counts:
			this.module_instances.count = 0;
			this.line_instances.count = 0;
			this.textquad_instances.count = 0;
			this.root = {
				// matrix transform object2world:
				mat: mat4.create(), 
				i_quat: [0, 0, 0, 1],
				name: "root",
				kind: null,
				scale: 1,
				nodes: [],
			};
			this.paths = {}

			// loop over the nodes in the graph,
			// creating instances as needed
			let names = Object.keys(graph.nodes); //.filter(s => s != "_props");
			if (names.length) {
				for (const name of names) {
					this.rebuildNode(name, graph.nodes[name], this.root)
				}
			}
			if (graph.arcs.length) {
				// now loop over arcs:
				this.line_instances.allocate(graph.arcs.length);
				for (const arc of graph.arcs) {
					let line = this.line_instances.instances[this.line_instances.count];
					line.from = this.paths[ arc[0] ];
					line.to = this.paths[ arc[1] ];

					if (!line.from || !line.to) continue;

					vec4.set(line.i_color, 1, 1, 1, 1);
					line.name = line.from.path + ">" + line.to.path
					this.line_instances.count++;

					// add jack cylinders:
					for (let parent of [line.from, line.to]) {
						let obj = this.getNextModule(parent);
						obj.name = line.name +":" + parent.name;
						obj.line = line
						obj.kind = "jack"
						// TODO to allow stacked cables:
						//obj.cablingKind = (parent.kind == "inlet") ? "input" : "output"
						obj.scale = systemSettings.UI_DEFAULT_SCALE
						obj.dim = [1/4, 1/4, 1/2]
						obj.pos = [0, 0, 0]
						obj.quat = [0, 0, 0, 1]
						vec4.set(obj.i_color, 0.25, 0.25, 0.25, 1)
						obj.i_shape[0] = systemSettings.SHAPE_CYLINDER;
						obj.i_value[0] = 0;
						obj.i_highlight[0] = 0;
					}
				}
			}
			this.line_instances.count = graph.arcs.length;
			return this.updateInstances();
		},

		getNextModule(parent) {
			// create a module instance:
			// reallocate space if needed
			if (this.module_instances.count >= this.module_instances.allocated) {			
				this.module_instances.allocate(Math.max(4, this.module_instances.allocated*2));
			}
			let obj = this.module_instances.instances[this.module_instances.count];
			this.module_instances.count++;
			// add graph links:
			parent.nodes.push(obj)
			obj.parent = parent;
			
			// this will define object's coordinate system relative to world:
			obj.mat = mat4.create()
			obj.scale = 1;
			return obj;
		},

		rebuildNode(name, node, parent, parent_path) {
			const props = node._props || {}

			let obj = this.getNextModule(parent);

			// add graph source:
			obj.node = node;
			obj.name = name;
			obj.kind = props.kind;

			// determine full path to this object
			// and cache in scenegraph.paths
			let path = name;
			if (parent_path) path = parent_path+"."+path;
			obj.path = path;
			this.paths[path] = obj;

			// get basic pose:
			obj.pos = props.pos;
			if (!obj.pos || obj.pos[0]===null) {
				obj.pos = [0, 0, 0];
			}  
			obj.quat = props.orient;
			if (!obj.quat || obj.quat[0]===null || quat.length(obj.quat)==0) {
				obj.quat = [0, 0, 0, 1];
			}
			obj.scale = 1;
			obj.dim = [1, 1, systemSettings.UI_DEPTH]
			obj.nodes = []

			obj.i_shape[0] = systemSettings.SHAPE_BOX;
			vec4.set(obj.i_color, 0.5, 0.5, 0.5, 1);
			obj.i_highlight[0] = 0;

			// default label:
			// represent genish names with easier-to-read labels:

			let label_text = name;
			// if op has a mathematical sign, provide it in the opsList so that VR can display it instead of the genish name (for better UX)
      switch(name){
        case 'add':
          label_text = '+'
        break
        case 'sub':
          label_text = 'subtract'
        break
        case 'mul':
          label_text = 'multiply'
        break
        case 'div':
          label_text = 'divide'
        break
        case 'gt':
          label_text = '>'
        break
        case 'gte':
          label_text = '>='
        break
        case 'lt':
          label_text = '<'
        break
        case 'lte':
          label_text = '<='
        break
        case 'bool':
          label_text = 'boolean'
        break
        case 'gtp':
          label_text = '> pass'
        break
        case 'ltp':
          label_text = '< pass'
        break
        case 'ad':
          label_text = 'attack/decay'
        break
        case 'eq':
          label_text = 'equals'
        break
        case 'neq':
          label_text = '!='
        break
        case 'ad':
          label_text = 'attack/decay'
        break
        case 'eq':
          label_text = '=='
        break
        case 'neq':
          label_text = '!='
        break
        case 'seq':
          //TODO what does this one do?
        break


      }
			let scale = systemSettings.UI_DEFAULT_SCALE;
			let text_scale = Math.min(1/(label_text.length+1), 1/font.charheight);
			let text_pos = [ 0, 0.4 ];
			
			let text_scale1 = Math.min(1/8, 1/font.charheight);
			let text_pos1 = [ 0, -0.4 ];

			switch(obj.kind) {
				case "outlet":
				case "inlet":  {
					obj.i_shape[0] = systemSettings.SHAPE_CYLINDER;
					vec4.copy(obj.i_color, props.kind == "inlet" ? [0.5, 0.5, 0.5, 1] : [0.25, 0.25, 0.25, 1]);
					obj.dim = [1/2, 1/2, -systemSettings.UI_DEPTH];
					obj.cablingKind = (props.kind == "inlet") ? "to" : "from";
					if (props.history) {
						// render history outs differently:
						obj.i_shape[0] = systemSettings.SHAPE_BOX;
					}
					this.addLabel(obj, label_text, text_pos, text_scale);
				} break;
				case "small_knob": 
				case "knob": 
				case "large_knob":  {
					obj.kind = "knob";
					obj.i_shape[0] = systemSettings.SHAPE_KNOB;
					vec4.copy(obj.i_color, colorFromString(name));
					obj.dim = [2/3, 2/3, systemSettings.UI_DEPTH];
					let range = props.range; 
					if (!range || range[0]===null) {
						range = [0, 1];
					}
					range[0] = +range[0]; // coerce to number, just in case
					range[1] = +range[1]; // coerce to number, just in case
					let value = props.value || 0.;
					value = +value;
					obj.value = value;
					obj.i_value[0] = (value - range[0])/(range[1]-range[0]);
					obj.cablingKind = "to"
					this.addLabel(obj, label_text, text_pos, text_scale);
					this.addLabel(obj, obj.value.toPrecision(5), text_pos1, text_scale1);
				} break;
				case "n_switch": {
					obj.kind = "button";
					obj.i_shape[0] = systemSettings.SHAPE_BUTTON;
					vec4.copy(obj.i_color, colorFromString(name));
					obj.dim = [2/3, 2/3, systemSettings.UI_DEPTH];
					let throws = props.throws || [0,1];
					let value = props.value || 0.;
					obj.value = value;
					obj.i_value[0] = value/(throws.length-1);
					obj.cablingKind = "to"
					this.addLabel(obj, label_text, text_pos, text_scale);
				} break;
				default: {
					vec4.copy(obj.i_color, opMenuColour(props.category));

					obj.isModule = true;
					obj.nodes = [];

					// will recurse to sub-nodes:
					const children_names = Object.keys(node).filter(s => s != "_props");
					// compute rows & cols:
					let nchildren = children_names.length;

					let inlets = []
					let outlets = []
					let ui = []

					for (const child_name of children_names) {
						const child_node = node[child_name];
						// recurse:	
						// this will also add child to obj.nodes:
						const child = this.rebuildNode(child_name, child_node, obj, path);

						if (child.kind == "inlet") {
							inlets.push(child);
						} else if (child.kind == "outlet") {
							outlets.push(child);
						} else {
							ui.push(child);
						}
					}
					
					// default layout:
					let ncols = nchildren, 
						nrows = 1,
						nspaces = 0;
					if (ncols > 4) {
						// multi-row layout.
						//ncols = Math.ceil(Math.sqrt(nchildren/1.618));
						ncols = Math.ceil(Math.sqrt(nchildren/1));
						nrows = Math.ceil(nchildren / ncols);
						let nspots = nrows*ncols;
						// nspaces indicates how many empty spots we have;
						// these could be used to insert smart newlines
						nspaces = nspots - nchildren;
					}
					
					// start at row 1, since the label occupies row zero
					let r=1, c=0;
					let lastkind;
					let cmax = 1;
					for (let i=0; i<nchildren; i++) {
						const child_name = children_names[i];
						const child_node = node[child_name];
						const child = obj.nodes[i];

						// newline here?
						if (c >= ncols) {
							c = 0;
							r++;
						} else if (lastkind 
						&& lastkind == "inlet"
						&& child.kind != "inlet") {
							// finished with inlet row(s);
							if (c >= ncols/2) {
								c = 0;
								r++;
							}
						} else if (lastkind 
						&& lastkind != "outlet"
						&& child.kind == "outlet") {
							// starting with outlet row(s):
							// newline if we are past half way
							if (c >= ncols/2 
							// but don't newline if the outlets could fit this line
							&& nchildren-i < cmax-c) {
								c = 0;
								r++;
							}
						}
						// override child pos for module layout:
						child.col = c;
						child.row = r;

						// move cursor on:
						cmax = Math.max(cmax, c);
						lastkind = child.kind;
						c++;
					}
					nrows = r+1;
					ncols = cmax+1;

					// now we know rows & cols, 
					// update properly:
					obj.scale = systemSettings.UI_DEFAULT_SCALE;
					obj.dim = [ncols, nrows, -systemSettings.UI_DEPTH];
					for (const child of obj.nodes) {
						vec3.set(child.pos,
							0.5 + child.col - ncols/2, 
							nrows/2 - (0.5 + child.row),
							systemSettings.UI_NUDGE
						);
					}

					// add module label:
					label_text = obj.kind.toUpperCase();

					// if op has a mathematical sign, provide it in the opsList so that VR can display it instead of the genish name (for better UX)
					switch(obj.kind){
						case 'add':
							label_text = '+'
						break
						case 'sub':
							label_text = 'subtract'
						break
						case 'mul':
							label_text = 'multiply'
						break
						case 'div':
							label_text = 'divide'
						break
						case 'gt':
							label_text = '>'
						break
						case 'gte':
							label_text = '>='
						break
						case 'lt':
							label_text = '<'
						break
						case 'lte':
							label_text = '<='
						break
						case 'bool':
							label_text = 'boolean'
						break
						case 'gtp':
							label_text = '> pass'
						break
						case 'ltp':
							label_text = '< pass'
						break
						case 'ad':
							label_text = 'attack/decay'
						break
						case 'eq':
							label_text = 'equals'
						break
						case 'neq':
							label_text = '!='
						break
						case 'ad':
							label_text = 'attack/decay'
						break
						case 'eq':
							label_text = '=='
						break
						case 'neq':
							label_text = '!='
						break
						case 'seq':
							//TODO what does this one do?
						break
					}
						label_text.toUpperCase()
					let w = font.charwidth * label_text.length;
					// scale to fit
					text_scale = Math.min(
						obj.dim[0] * 1/(w+1), // scale factor to fill width of panel with pad,
						1/font.charheight, // scale factor to fill 1 row height
					);
					// to centre the text at the top of the module: 
					let text_pos = [ 0, obj.dim[1]/2 - 1/2 - 0.25*text_scale ];
					this.addLabel(obj, label_text, text_pos, text_scale);
				}
			}
			return obj;
		},

		// text_pos is expressed in the parent's coordinate system
		// text_scale will fit the text to the available space
		addLabel(parent, text, text_pos, text_scale) {
			let idx = this.textquad_instances.count;
			const len = text.length;
			const width = font.charwidth * len;

			// reallocate if necessary:
			this.textquad_instances.allocate(idx + len);
			
			// centre it:
			let x = text_scale * (text_pos[0] - width/2);
			let y = text_pos[1];
			for (var i = 0; i < text.length; i++) {
				let c = text.charAt(i).toString();
				// space characters don't render, just update cursor:
				if (c === " ") {
					x += font.charwidth;
				} else if (c === "\t") {
					x += font.charwidth*3;
				} else if (c === "\n") {
					x = 0;
					y -= font.json.common.lineHeight * font.scale;
				} else {
					const char = font.lookup[c];
					if (!char) {
						console.error("couldn't find character: ", c, typeof(c));
						continue;
					}
					// get instance interface for this character:
					let textobj = this.textquad_instances.instances[idx];
					// color:
		//			vec4.set(obj.i_color, 1, 1, 1, 1)
					// bounding coordinates of the quad for this character:
					vec4.scale(textobj.i_fontbounds, char.quad, text_scale);
					// offset by character location:
					textobj.i_fontbounds[0] += x;
					textobj.i_fontbounds[1] += y;
					// UV coordinates for this character:	
					vec4.copy(textobj.i_fontcoord, char.texCoords);

					textobj.parent = parent;

					// next instance:
					idx++; 
					// update cursor:
					x += char.xadvance * font.scale * text_scale;
				}
			}

			this.textquad_instances.count = idx;
			return this.updateInstances();
		},
		
		updateInstances() {
			// updates geometric & rendering attributes of all instances, including position, quat, scale, worldmat etc.
			// NOTE: because of the way the instances were created, parents will be 
			// visited earlier in the iteration than their children
			// this means that parent properties (like obj.mat) have been updated
			// before the child is updated
			for (let i=0; i<this.module_instances.count; i++) {
				let obj = this.module_instances.instances[i];
				let parent = obj.parent;
				let scale = obj.scale * parent.scale;
				// get world pos by transforming through parent's mat
				vec3.transformMat4(obj.i_pos, obj.pos, obj.parent.mat);
				// TODO verify this is the right ordering:
				quat.multiply(obj.i_quat, obj.quat, obj.parent.i_quat);
				vec3.copy(obj.i_bb0, [
					obj.dim[0]*-0.5*scale, 
					obj.dim[1]*-0.5*scale, 
					obj.dim[2]*-0.5*scale
				])
				vec3.copy(obj.i_bb1, [
					obj.dim[0]*0.5*scale, 
					obj.dim[1]*0.5*scale, 
					obj.dim[2]*0.5*scale
				])
				// TODO: use a 0..1 cube instead of this silly -1..1 thing
				vec3.negate(obj.i_bb0, obj.i_bb1)
				// update our 'toworld' mat:
				mat4.fromRotationTranslationScale(obj.mat, 
					obj.i_quat, obj.i_pos, 
					[scale, scale, scale]
				);
			}

			for (let i=0; i<this.textquad_instances.count; i++) {
				let obj = this.textquad_instances.instances[i];
				let parent = obj.parent;
				mat4.copy(obj.i_modelmatrix, parent.mat)
			}
			for (let i=0; i<this.line_instances.count; i++) {
				let obj = this.line_instances.instances[i];
				
				let {from, to} = obj;
				if(from && to){
					assert(from, `line ${obj.name} from is missing`)
					assert(to, `line ${obj.name} to is missing`)
					quat.copy(obj.i_quat0, from.i_quat);
					quat.copy(obj.i_quat1, to.i_quat);
					vec3.copy(obj.i_pos0, from.i_pos);
					vec3.copy(obj.i_pos1, to.i_pos);
				}else {
					//!  for some reason this script was receiving some undefined from/to arcs, so ignore them here for now
				}
			}
			return this.submit();
		},

		submit() {
			// submit to GPU:
			this.module_instances.bind().submit().unbind()
			this.line_instances.bind().submit().unbind()
			this.textquad_instances.bind().submit().unbind()
			return this;
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
		
			// text:
			renderer.font.texture.bind(0)
			renderer.textquad_program.begin();
			//textquad_program.uniform("u_modelmatrix", modelmatrix);
			renderer.textquad_program.uniform("u_viewmatrix", viewmatrix);
			renderer.textquad_program.uniform("u_projmatrix", projmatrix);
			this.textquad_vao.bind().drawInstanced(this.textquad_instances.count).unbind()
			renderer.textquad_program.end();
	
			return this;
		},
	}
}

//////////////////////////////////////////////////////////////////////////////////////////
// UI
//////////////////////////////////////////////////////////////////////////////////////////

/* //! moved to collisions.js
// assumes `instances` is an array of objects
// each object has `i_pos`, `i_quat`, and `i_bb0`/`i_bb1` fields
// `bbN` is the oriented bounding box of the object 
// as vec3's for least & greatest bound points
// `ray_origin` and `ray_dir` are vec3 in world space
// returns an array of hits, sorted by distance (nearest first)
// each hit is [obj, distance]
function rayTestModules(instances, ray_origin, ray_dir) {
	// hit test on each cube:
	let hits = []
	// naive hit-test by looping over all and testing in turn
	//for (let obj of instances) {
	for (let i=0; i<instances.count; i++) {
		let obj = instances.instances[i]
		if (!obj.i_bb0 || !obj.i_bb1) continue;  // no bounding box, no test
		// check for hits:
		let [hit, distance] = intersectCube(obj.i_pos, obj.i_quat, obj.i_bb0, obj.i_bb1, ray_origin, ray_dir);
		if (hit) {
			hits.push([obj, distance]);
		}
	}
	// if there are hits, sort them by distance
	// then highlight the nearest
	if (hits.length) hits.sort((a,b)=>a[1]-b[1]);
	return hits;
}
*/

function initUI(window) {

	glfw.setMouseButtonCallback(window, function(win, button, down, mods) {
		if (!vr) {
			// fake hand:
			let hand = UI.hands[0];
			if (button > 0 || mods > 0) {
				// RMB or mod-click maps to touchpad
				hand.pad_pressed = down ? 1 : 0;//(down) ? hand.pad_pressed++ : 0;
			} else {
				// LMB maps to trigger
				hand.trigger_pressed = down ? 1 : 0;// (down) ? hand.trigger_pressed++ : 0;
				hand.trigger = +down;
			}
		}
	})

	glfw.setWindowContentScaleCallback(window, function(...args) {
		console.log("content scale", args);
	})

	// px, py are in screen pixels
	glfw.setCursorPosCallback(window, (window, px, py) => {
		if (!vr) {
			// convert px,py to normalized 0..1 coordinates:
			const dim = glfw.getWindowSize(window)
			// mouse in NDC coordinates:
			UI.keynav.mouse[0] = +2*px/dim[0] + -1;
			UI.keynav.mouse[1] = -2*py/dim[1] + +1;
		}
	});

	glfw.setKeyCallback(window, (win, key, scan, down, mod)=>{
		UI.keynav.handleKeys(key, down, mod);
	})
}

let t = glfw.getTime();
let fps = 60;

function animate() {
	/* //! moved to main.js animation loop
	let t1 = glfw.getTime();
	let dt = t1-t;
	*/
	// fps += 0.1*((1/dt)-fps);
	// t = t1;
	// glfw.setWindowTitle(window, `fps ${fps}`);
	
	// glfw.pollEvents();
	// if(glfw.windowShouldClose(window) || glfw.getKey(window, glfw.KEY_ESCAPE)) {
	// 	shutdown();
	// } else {
	// 	setImmediate(animate)
	// }

	// rebuild VR localGraph
	if(patch.dirty.vr == true){
		fs.writeFileSync('userData/document.json', JSON.stringify(patch.document, null, 2))
		
		localGraph = patch.rebuild()
		fs.writeFileSync('userData/graph.json', JSON.stringify(localGraph, null, 2))

		mainScene.rebuild(localGraph)
		patch.dirty.vr = false
	}

	// rebuild audio graph
	if(patch.dirty.audio.graph == true){
		// rebuild genish graph
		Audio.updateGraph(patch.document)
		patch.dirty.audio.graph = false;
	}
	// update param(s) in audio graph
	if(patch.dirty.audio.param == true){
		// do the thing
		Audio.updateParams(patch.document)
		patch.dirty.audio.param = false;
	}

	// check if speaker is needed in document
	if(patch.dirty.speaker == true){
		patch.ensureSpeaker(UI.hmd)
	}

	currentScene = (UI.hands[0].state == "menu" || UI.hands[1].state == "menu") ? menuScene : mainScene;
	for (let i=0; i<currentScene.module_instances.count; i++) {
		currentScene.module_instances.instances[i].i_highlight[0] = 0;
	}
	
	if (vr) {
		vr.update();
		let inputs = vr.inputSources()
		for (let input of inputs) {
			if (input.targetRayMode == "gaze") {
				let mat = input.targetRaySpace; // mat4
				if (mat) {
					mat4.copy(UI.hmd.mat, mat)
					mat4.getTranslation(UI.hmd.pos, mat);
					mat4.getRotation(UI.hmd.orient, mat);
				}
			} else if (input.targetRayMode == "tracked-pointer") {
				// hand
				let idx = (input.handedness == "right") ? 1 : 0;
				let hand = UI.hands[idx]


				let {buttons, axes} = input.gamepad;
				hand.trigger = buttons[0].value
				hand.trigger_pressed = (buttons[0].pressed) ? hand.trigger_pressed+1 : 0;
				hand.pad_dx = (buttons[2].touched && hand.pad_touched) ? axes[0] - hand.pad_x : 0;
				hand.pad_dy = (buttons[2].touched && hand.pad_touched) ? axes[1] - hand.pad_y : 0;
				hand.pad_touched = buttons[2].touched;
				hand.pad_x = axes[0]
				hand.pad_y = axes[1]
				hand.pad_pressed = (buttons[2].pressed) ? hand.pad_pressed+1 : 0;
				hand.grip_pressed = (buttons[1].pressed) ? hand.grip_pressed+1 : 0;
				hand.B_pressed = buttons[3].pressed;

				let mat = input.targetRaySpace;
				if (mat) {
					if (!hand.mat) hand.mat = mat4.create()
					mat4.copy(hand.mat, mat)
					let p = vec3.create()
					mat4.getTranslation(p, mat);
					vec3.sub(hand.dpos, p, hand.pos)
					vec3.scale(hand.dpos, hand.dpos, 1/dt)
					vec3.copy(hand.pos, p)
					mat4.getRotation(hand.orient, mat);
					vec3.negate(hand.dir, mat.slice(8, 11))
				} 
			}
		}
	} 

	UI.updateStateMachines(currentScene);
	UI.updateInstances()
	// instance vars can change on a frame by frame basis;
	// propagate their changes (scene graph) and update the GPU accordingly:
	//mainScene.updateInstances()
	currentScene.updateInstances();

	// render to our targetTexture by binding the framebuffer
    gl.bindFramebuffer(gl.FRAMEBUFFER, renderer.fbo.id);
	{
		gl.viewport(0, 0, renderer.fbo.width, renderer.fbo.height);
		gl.enable(gl.DEPTH_TEST)
		gl.depthMask(true)
		gl.clearColor(0, 0, 0, 1);
		gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);

		if (vr) {
			for (let i=0; i<2; i++) {
				vr.getView(i, viewmatrix);
				vr.getProjection(i, projmatrix);
				mat4.invert(viewmatrix_inverse, viewmatrix);
				mat4.invert(projmatrix_inverse, projmatrix);

				gl.viewport(i * renderer.fbo.width/2, 0, renderer.fbo.width/2, renderer.fbo.height);

				draw(i);
			}
		} else {
			UI.keynav.move().updateViewMatrix(viewmatrix);
			// let a = t/5;
			// let d = Math.sin(t/3) + 1.5;
			// let h = 1.25;
			// mat4.lookAt(viewmatrix, [d*Math.sin(a), h, d*Math.cos(a)], [0, h, 0], [0, 1, 0]);
			mat4.perspective(projmatrix, Math.PI/2, vrdim[0]/vrdim[1], systemSettings.NEAR_CLIP, systemSettings.FAR_CLIP);
			mat4.invert(viewmatrix_inverse, viewmatrix);
			mat4.invert(projmatrix_inverse, projmatrix);
			gl.viewport(0, 0, renderer.fbo.width, renderer.fbo.height);

			draw();
		}
	}
	gl.bindFramebuffer(gl.FRAMEBUFFER, null);

	if (vr) vr.submit(renderer.fbo.colorTexture)

	// Get window size (may be different than the requested size)
	let dim = glfw.getFramebufferSize(window);
	gl.viewport(0, 0, dim[0], dim[1]);
	gl.enable(gl.DEPTH_TEST)
	gl.depthMask(true)
	gl.clearColor(0., 0., 0., 1);
	gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);

	// render the cube with the texture we just rendered to
    gl.bindTexture(gl.TEXTURE_2D, renderer.fbo.colorTexture);
	renderer.fbo_program.begin();
	renderer.fbo_program.uniform("u_windim", dim);
	renderer.fbo_program.uniform("u_texdim", [renderer.fbo.width, renderer.fbo.height]);
	renderer.fbo_vao.bind().draw().unbind();
	renderer.fbo_program.end();	

	// Swap buffers
	glfw.swapBuffers(window);
}

function draw(eye=0) {


	gl.enable(gl.BLEND);
	gl.blendFunc(gl.SRC_ALPHA, gl.ONE);
	gl.depthMask(false)

	renderer.floor_program.begin();
	renderer.floor_program.uniform("u_viewmatrix", viewmatrix);
	renderer.floor_program.uniform("u_projmatrix", projmatrix);
	renderer.floor_vao.bind().draw().unbind();
	renderer.floor_program.end();

	UI.draw(gl);
	currentScene.draw(gl);

	gl.disable(gl.BLEND);
	gl.depthMask(true)
}


//////////////////////////////////////////////////////////////////////////////////////////
// BOOT SEQUENCE
//////////////////////////////////////////////////////////////////////////////////////////

async function init() {
	// init opengl 
	window = initWindow();

	/* //! added to main.js
	initRenderer(renderer);

	UI.init(renderer, gl)
	*/

	menu = new Palette()
	menuGraph.nodes = menu.graph;

	// prettyPrint(menu.graph)
	menuScene = makeSceneGraph(renderer, gl)
	menuScene.init(gl)
	menuScene.rebuild(menuGraph)

	mainScene = makeSceneGraph(renderer, gl);
	mainScene.init(gl);
	mainScene.rebuild(localGraph)
	
	
	initUI(window);

	

	animate()

	// load a scene on start?
 	if(process.argv[2] == 'new'){
		let startPatch = {}
		patch.load(startPatch)
	}
	else if(process.argv[2]){
		let file = `userData/${process.argv[2]}.json`
		let startPatch = JSON.parse(fs.readFileSync(path.join(__dirname, file)))
		patch.load(startPatch)
	} else if(process.argv[2] == 'restart'){
		let startPatch = JSON.parse(fs.readFileSync(path.join(__dirname, 'userData/document.json')))
		patch.load(startPatch)
	} else {
		patch.load({})
	}
}
/* //! I don't think we need this
function shutdown() {
	console.log("shutdown")
	if (USEVR) vr.connect(false)
	glfw.destroyWindow(window);
	glfw.terminate();
	// if (socket) socket.terminate();
	process.exit(0)
}
*/
init();

 