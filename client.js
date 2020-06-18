/*
TODO notes

GOT graph needs to be translated to scene graph, which in turn specifies GL instances

Instances:
- lines (for patch coords, controller rays, etc.)
- texturedquads (for text characters)
- gridshapes (for module boxes, knobs, jacks, plugs, etc.)

The instances could be embedded in the scene; that way switching out scenes (or even drawing multiple scenes) could be faster. Scenes would have their own vbo/vao etc, but share shaders

scene = {
	line_vao
	textquad_vao
	shape_vao

	line_instances
	textquad_instances
	shape_instances
	etc.


}

Some scene grpah changes are structural
- new/delnode, connect/disconnect, etc.
- requires re-generating the instances

Most scene graph changes are parametric
- propchange pos, orient, value etc. for module poses, knob positions, etc.
- instances don't need regenerating, only attribute updates

So, at least 2 passes:

GOT -> scene graph structure -> regenerate instances, then cascade to next pass:
GOT -> scene graph item changes -> update instance attributes

For some parts, scenegraph node can be the instance object
For others (e.g. labels), perhaps it can be the first character instance?

For raytracing, convenient to have all objects in a flat list and a global space
That flat list could be the instances, or the pathlookup
- project ray into object coordinate space for simple bounds check
- needs mat4 for the object coordinate space. 
	- Q: module mat's scale uses grid size, or module width/height?

For moving objects, convenient to have a graph structure so that moving a parent can iterate to update all children
	- so a node needs a list of its children
For child objects it would be convenient to store positions in units of the module grid,
	- then can recompute the instance position and matrix more rapidly
	- but a node will need pointer to its parent context

Option of having a root node



Two scale factors to consider:
- "zoom": A scalar value for the scale factor from parent system, which will be in the parent mat. E.g. modules by defualt will have zoom=UI_DEFAULT_ZOOM.
- "dim": A bounding-scale used to stretch modules to fit no. rows & cols in their grid layout. Will also be needed for raycasting. Essentially sets the bounding box of the object relative to its coordinate frame. Hit test: transform ray into the coordinate space of object (via mat) then test it against "dim".

Child objects' world-space depends on parent's mat4, which factors in "zoom", not "dim". 

Could store both in a vec3 (bound.xy + zoom.z), 
or in a vec4 (bound.xyz and zoom.w). 


Consider whether to have anchors in centre or bottom-left
(and if centre, is it +-1 or +-0.5?)
Raycasting: corner is slightly better? Test by transforming ray to object space, then testing against object bounds. +-0.5 makes that more complicated; would be testing (transformed+0.5) against (0,dim).
Knob rotation etc.: centre definitely better in thoery -- but perhaps this is something handled in the shader? +- doesn't matter.
Widget layout: probably easier with centering. +- 0.5 preferred.
Module grid layout: corner simpler. +- 0.5 preferred.
Seems like centre +-0.5 might be the one?

*/
const assert = require("assert"),
	fs = require("fs"),
	path = require("path");
const { vec2, vec3, vec4, quat, mat2, mat2d, mat3, mat4} = require("gl-matrix")
const PNG = require("png-js");
const WebSocket = require('ws')
const chroma = require("chroma-js")

const nodeglpath = "../node-gles3"
const gl = require(path.join(nodeglpath, "gles3.js")),
glfw = require(path.join(nodeglpath, "glfw3.js")),
vr = require(path.join(nodeglpath, "openvr.js")),
glutils = require(path.join(nodeglpath, "glutils.js"))

const got = require("./got/got.js")

const USEVR = false;
const USEWS = false;
const url = 'ws://localhost:8080'
const demoScene = path.join(__dirname, "scene_files", "scene_rich.json")
const shaderpath = path.join(__dirname, "shaders")

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

////////////////////////////////////////////////////////////////

const SHAPE_BOX = 0;
const SHAPE_BUTTON = 1;
const SHAPE_CYLINDER = 2;
const SHAPE_KNOB = 3;

const UI_DEFAULT_ZOOM = 0.1;
const UI_DEPTH = 1/3;

// GOT graph, local copy.
let localGraph = {
	nodes: {},
	arcs: []
}


// ontology of the rendered scene.
let scene = {
	boxes: [],
	cables: [],
	labels: [],

	// a lookup table from path to the object it refers to:
	paths: {},
}

let viewmatrix = mat4.create();
let projmatrix = mat4.create();

////////////////////////////////////////////////////////////////
if (!glfw.init()) {
	console.log("Failed to initialize GLFW");
	process.exit(-1);
}
let version = glfw.getVersion();
console.log('glfw ' + version.major + '.' + version.minor + '.' + version.rev);
console.log('glfw version-string: ' + glfw.getVersionString());

// Open OpenGL window
glfw.defaultWindowHints();
glfw.windowHint(glfw.CONTEXT_VERSION_MAJOR, 3);
glfw.windowHint(glfw.CONTEXT_VERSION_MINOR, 3);
glfw.windowHint(glfw.OPENGL_FORWARD_COMPAT, 1);
glfw.windowHint(glfw.OPENGL_PROFILE, glfw.OPENGL_CORE_PROFILE);

let window = glfw.createWindow(800, USEVR ? 400 : 800, "Test");
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

glfw.setWindowPosCallback(window, function(w, x, y) {
	console.log("window moved", w, x, y)
	return 1;
})

glfw.setMouseButtonCallback(window, function(...args) {
	console.log("mouse button", args);
})

glfw.setKeyCallback(window, function(...args) {
	console.log("key event", args);
})

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

const font = createSDFFont(gl, "font/CONSOLATTF.png", "font/CONSOLA.TTF-msdf.json")

const textquad_program = glutils.makeProgram(gl, 
	fs.readFileSync(path.join(shaderpath, "textquad.vert.glsl"), "utf-8"),
	fs.readFileSync(path.join(shaderpath, "textquad.frag.glsl"), "utf-8")
);
const module_program = glutils.makeProgram(gl,
	fs.readFileSync(path.join(shaderpath, "module.vert.glsl"), "utf-8"),
	fs.readFileSync(path.join(shaderpath, "module.frag.glsl"), "utf-8")
);
const line_program = glutils.makeProgram(gl,
	fs.readFileSync(path.join(shaderpath, "line.vert.glsl"), "utf-8"),
	fs.readFileSync(path.join(shaderpath, "line.frag.glsl"), "utf-8")
);
const floor_program = glutils.makeProgram(gl,
	fs.readFileSync(path.join(shaderpath, "floor.vert.glsl"), "utf-8"),
	fs.readFileSync(path.join(shaderpath, "floor.frag.glsl"), "utf-8")
);
const fbo_program = glutils.makeProgram(gl,
	fs.readFileSync(path.join(shaderpath, "fbo.vert.glsl"), "utf-8"),
	fs.readFileSync(path.join(shaderpath, "fbo.frag.glsl"), "utf-8")
);

const textquad_geom = glutils.makeQuad({ min:0., max:1, div:8 });
const module_geom = glutils.makeCube({ 
	min:[-0.5,-0.5, 0], 
	max:[ 0.5, 0.5, 1], 
	div: [13, 13, 1] 
});
const line_geom = glutils.makeLine({ min:0, max:1, div: 24 });






// GLOBAL GL RESOURCES:

let floor_m = 6;
let floor_vao = glutils.createVao(gl, glutils.makeQuad({ min: -floor_m, max: floor_m, div:8 }), floor_program.id);

let fbo_vao = glutils.createVao(gl, glutils.makeQuad(), fbo_program.id);
let vrdim = [4096, 4096];
if (USEVR) {
	assert(vr.connect(true), "vr failed to connect");
	vr.update()
	vrdim = [vr.getTextureWidth(), vr.getTextureHeight()]
}
let fbo = glutils.makeFboWithDepth(gl, vrdim[0], vrdim[1])


let sceneGraph = {

	// create VAOs for the geometry types:
	module_vao: glutils.createVao(gl, module_geom, module_program.id),
	line_vao: glutils.createVao(gl, line_geom, line_program.id),
	textquad_vao: glutils.createVao(gl, textquad_geom, textquad_program.id),

	// create VBOs and JS interfaces for instances of each geometry type:
	module_instances: glutils.createInstances(gl, [
		{ name:"i_quat", components:4 },
		{ name:"i_color", components:4 },
		{ name:"i_pos", components:3 },
		{ name:"i_shape", components:1 },
		{ name:"i_scale", components:3 },
		{ name:"i_value", components:1 },
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
	// idx is the instance index to start adding character at (allows appending strings)
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

	rebuild(graph) {
		// re-generate the entire scene from the GOT graph received
		// reset instance counts:
		this.module_instances.count = 0;
		this.line_instances.count = 0;
		this.textquad_instances.count = 0;
		this.root = {
			// matrix transform object2world:
			mat: mat4.create(), 
			quat: [0, 0, 0, 1],
			zoom: 1,
			nodes: [],
		};
		this.paths = {}

		// loop over the nodes in the graph,
		// creating instances as needed
		let names = Object.keys(graph.nodes); //.filter(s => s != "_props");
		for (const name of names) {
			this.rebuildNode(name, graph.nodes[name], this.root)
		}

		// now loop over arcs:
		this.line_instances.allocate(graph.arcs.length);
		for (const arc of graph.arcs) {
			let line = this.line_instances.instances[this.line_instances.count];
			vec4.set(line.i_color, 1, 1, 1, 1);

			line.from = this.paths[ arc[0] ];
			line.to = this.paths[ arc[1] ];

			if (line.from && line.to) this.line_instances.count++;
		}
		this.line_instances.count = graph.arcs.length;


		this.update(graph);
	},

	rebuildNode(name, node, parent, parent_path) {
		const props = node._props || {}

		// create a module instance:
		// reallocate space if needed
		if (this.module_instances.count >= this.module_instances.allocated) {
			this.module_instances.allocate(Math.min(4, this.module_instances.allocated*2));
		}

		let obj = this.module_instances.instances[this.module_instances.count];

		// add grpah links:
		parent.nodes.push(obj)
		obj.parent = parent;

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
		obj.pos = props.pos || [0, 0, 0];
		obj.quat = props.orient || [0, 0, 0, 1];
		obj.shape = SHAPE_BOX;
		obj.zoom = 1;
		obj.dim = [1, 1, UI_DEPTH]
		// this will define object's coordinate system relative to world:
		obj.mat = mat4.create()

		this.module_instances.count++;

		// default label:
		let label_text = name;
		let zoom = UI_DEFAULT_ZOOM;
		let text_zoom = Math.min(zoom/(label_text.length+1), zoom/font.charheight);
		let text_pos = [ 0, zoom*0.4 ];

		switch(obj.kind) {
			case "outlet":
			case "inlet":  {
				obj.shape = SHAPE_CYLINDER;
				obj.color = props.kind == "inlet" ? [0.5, 0.5, 0.5, 1] : [0.25, 0.25, 0.25, 1];
				obj.dim = [1/3, 1/3, UI_DEPTH/2];
				this.addLabel(obj, label_text, text_pos, text_zoom);
			} break;
			case "small_knob": {
				obj.shape = SHAPE_KNOB;
				obj.color = colorFromString(name);
				obj.dim = [1/2, 1/2, UI_DEPTH];
				let range = props.range || [0,1];
				let value = props.value || 0.;
				obj.value = (value - range[0])/(range[1]-range[0]);
				this.addLabel(obj, label_text, text_pos, text_zoom);
			} break;
			case "knob": 
			case "large_knob":  {
				obj.shape = SHAPE_KNOB;
				obj.color = colorFromString(name);
				obj.dim = [2/3, 2/3, UI_DEPTH];
				let range = props.range || [0,1];
				let value = props.value || 0.;
				obj.value = (value - range[0])/(range[1]-range[0]);
				this.addLabel(obj, label_text, text_pos, text_zoom);
			} break;
			case "n_switch": {
				obj.shape = SHAPE_BUTTON;
				obj.color = colorFromString(name);
				let throws = props.throws || [0,1];
				let value = props.value || 0.;
				obj.value = value/(throws.length-1);
				this.addLabel(obj, label_text, text_pos, text_zoom);
			} break;
			default: {
				obj.color = colorFromString(props.kind);
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
				obj.zoom = UI_DEFAULT_ZOOM;
				obj.dim = [ncols, nrows, UI_DEPTH];
				for (const child of obj.nodes) {
				// for (let i=0; i<nchildren; i++) {const child = obj.nodes[i];
					child.pos = [ 
						0.5 + child.col - ncols/2, 
						nrows/2 - (0.5 + child.row), 
						UI_DEPTH 
					];
				}

				// add module label:
				label_text = obj.kind;
				let w = font.charwidth * label_text.length;
				// scale to fit
				text_zoom = Math.min(
					obj.dim[0] * 1/(w+1), // zoom factor to fill width of panel with pad,
					1/font.charheight, // zoom factor to fill 1 row height
				);
				// to centre the text at the top of the module: 
				let text_pos = [ 0, obj.dim[1]/2 - 1/2 - 0.25*text_zoom ];
				this.addLabel(obj, label_text, text_pos, text_zoom);
			}
		}
		return obj;
	},

	// text_pos is expressed in the parent's coordinate system
	// text_zoom will fit the text to the available space
	addLabel(parent, text, text_pos, text_zoom) {
		let idx = this.textquad_instances.count;
		const len = text.length;
		const width = font.charwidth * len;

		// reallocate if necessary:
		this.textquad_instances.allocate(idx + len);
		// centre it:
		let x = text_zoom * (text_pos[0] - width/2);
		let y = text_pos[1];
		for (var i = 0; i < text.length; i++) {
			let c = text.charAt(i).toString();
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
				let textobj = this.textquad_instances.instances[idx];
				// color:
	//			vec4.set(obj.i_color, 1, 1, 1, 1)
				// bounding coordinates of the quad for this character:
				vec4.scale(textobj.i_fontbounds, char.quad, text_zoom);
				// offset by character location:
				textobj.i_fontbounds[0] += x;
				textobj.i_fontbounds[1] += y;
				// UV coordinates for this character:	
				vec4.copy(textobj.i_fontcoord, char.texCoords);

				textobj.parent = parent;

				// next instance:
				idx++; 
				// update cursor:
				x += char.xadvance * font.scale * text_zoom;
			}
		}

		this.textquad_instances.count = idx;
	},
	
	update(graph) {
		// TODO: iterate `graph` to update properties of the various nodes in module_instances etc.


		// assumes the graph structure has not changed
		// updates geometric & rendering attributes of all instances, including position, quat, scale, worldmat etc.
		// NOTE: because of the way the instances were created, parents will be 
		// visited earlier in the iteration than their children
		// this means that parent properties (like obj.mat) have been updated
		// before the child is updated
		for (let i=0; i<this.module_instances.count; i++) {
			let obj = this.module_instances.instances[i];
			let parent = obj.parent;
			let zoom = obj.zoom * parent.zoom;
			// get world pos by transforming through parent's mat
			vec3.transformMat4(obj.i_pos, obj.pos, obj.parent.mat);
			// TODO verify this is the right ordering:
			quat.multiply(obj.i_quat, obj.quat, obj.parent.quat);
			vec3.copy(obj.i_scale, [
				obj.dim[0]*zoom, 
				obj.dim[1]*zoom, 
				obj.dim[2]*zoom
			]);
			// update our 'toworld' mat:
			mat4.fromRotationTranslationScale(obj.mat, 
				obj.quat, obj.pos, 
				[obj.zoom, obj.zoom, obj.zoom]
			);
			mat4.fromRotationTranslationScale(obj.mat, 
				obj.i_quat, obj.i_pos, 
				[obj.zoom, obj.zoom, obj.zoom]
			);

			// TODO maybe use obj.i_color / obj.i_shape directly, instead of obj.color?
			vec4.copy(obj.i_color, obj.color);
			obj.i_shape[0] = obj.shape;
			
			obj.i_value[0] = obj.value; 
		}

		for (let i=0; i<this.textquad_instances.count; i++) {
			let obj = this.textquad_instances.instances[i];
			let parent = obj.parent;
			mat4.copy(obj.i_modelmatrix, parent.mat)
		}

		for (let i=0; i<this.line_instances.count; i++) {
			let obj = this.line_instances.instances[i];
			let {from, to} = obj;
			quat.copy(obj.i_quat0, from.i_quat);
			quat.copy(obj.i_quat1, to.i_quat);
			vec3.copy(obj.i_pos0, from.i_pos);
			vec3.copy(obj.i_pos1, to.i_pos);
		}

		this.submit();
		return this;
	},

	submit() {
		// submit to GPU:
		this.module_instances.bind().submit().unbind()
		this.line_instances.bind().submit().unbind()
		this.textquad_instances.bind().submit().unbind()
		return this;
	},

	visitModules(callback) {
		for (let i=0; i<this.module_instances.count; i++) {
			let obj = this.module_instances.instances[i];
			callback(obj, i);
		}
		return this;
	},

	draw(gl) {
		gl.enable(gl.BLEND);
		gl.blendFunc(gl.SRC_ALPHA, gl.ONE);
		gl.depthMask(false)

		module_program.begin();
		module_program.uniform("u_viewmatrix", viewmatrix);
		module_program.uniform("u_projmatrix", projmatrix);
		this.module_vao.bind().drawInstanced(this.module_instances.count).unbind()
		module_program.end();

		line_program.begin();
		line_program.uniform("u_viewmatrix", viewmatrix);
		line_program.uniform("u_projmatrix", projmatrix);
		line_program.uniform("u_stiffness", 0.5)
		// consider gl.LINE_STRIP with simpler geometry
		this.line_vao.bind().drawInstanced(this.line_instances.count, gl.LINES).unbind()
		line_program.end();
	
		// text:
		font.texture.bind(0)
		textquad_program.begin();
		//textquad_program.uniform("u_modelmatrix", modelmatrix);
		textquad_program.uniform("u_viewmatrix", viewmatrix);
		textquad_program.uniform("u_projmatrix", projmatrix);
		this.textquad_vao.bind().drawInstanced(this.textquad_instances.count).unbind()
		textquad_program.end();
	
		gl.disable(gl.BLEND);
		gl.depthMask(true);
		return this;
	},
}



let t = glfw.getTime();
let fps = 60;

function animate() {

	let t1 = glfw.getTime();
	let dt = t1-t;
	fps += 0.1*((1/dt)-fps);
	t = t1;
	glfw.setWindowTitle(window, `fps ${fps}`);
	
	glfw.pollEvents();
	if(glfw.windowShouldClose(window) || glfw.getKey(window, glfw.KEY_ESCAPE)) {
		shutdown();
	} else {
		setImmediate(animate)
	}

	// handle scene changes from server:
    if (incomingDeltas.length > 0) {
        // handle incoming deltas:
        while (incomingDeltas.length > 0) {
            let delta = incomingDeltas.shift();
            // TODO: derive which world to add to:
            try {
				got.applyDeltasToGraph(localGraph, delta);
				
				fs.writeFileSync("basicGraph.json", JSON.stringify(localGraph, null, "\t"), "utf8");
			} catch (e) {
				console.warn(e);
			}
			

            //enactDelta(ghostWorld, delta);
            //log("incoming deltas")
        }
		console.log("updated localGraph", JSON.stringify(localGraph, null, "  "))

		
		scene = rebuildInstances(rebuildScene(localGraph));


		// // handle incoming deltas:
		// while (localDeltas.length > 0) {
        //     let delta = localDeltas.shift();
        //     // TODO: derive which world to add to:
        //     enactDelta(ghostMenu, delta);
        // }

        // // re-layout:
        // updateDirty(ghostScene, false);

        // // TODO: delete once cables are instanced:
        // updateDirty(scene, false);
	}
	
	// if (module_instances.count) {
	// 	let i = Math.floor(Math.random() * module_instances.count)
	// 	let obj = module_instances.instances[i]
	// 	quat.slerp(obj.i_quat, obj.i_quat, quat.random(quat.create()), 0.1);
	// 	quat.normalize(obj.i_quat, obj.i_quat);
	// }
	// line_instances.instances.forEach((obj, i) => {
	// 	let a = module_instances.instances[obj.from]
	// 	let b = module_instances.instances[obj.to]
	// 	quat.copy(obj.i_quat0, a.i_quat);
	// 	quat.copy(obj.i_quat1, b.i_quat);
	// 	vec3.copy(obj.i_pos0, a.i_pos);
	// 	vec3.copy(obj.i_pos1, b.i_pos);
	// }) 


	// // update scene:
	// for (let i=0; i<NUM_POINTS/10; i++) {
	// 	let idx = Math.floor(Math.random() * vertices.length);
	// 	vertices[idx] += (Math.random()-0.5) * 0.01;
	// }
	// // update GPU buffers:
	// gl.bindBuffer(gl.ARRAY_BUFFER, buffer);
	// gl.bufferData(gl.ARRAY_BUFFER, vertices, gl.DYNAMIC_DRAW);

	//if(wsize) console.log("FB size: "+wsize.width+', '+wsize.height);
	if (USEVR) vr.update();
	
	// render to our targetTexture by binding the framebuffer
    gl.bindFramebuffer(gl.FRAMEBUFFER, fbo.id);
	{
		gl.viewport(0, 0, fbo.width, fbo.height);
		gl.enable(gl.DEPTH_TEST)
		gl.depthMask(true)
		gl.clearColor(0, 0, 0, 1);
		gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);

		if (USEVR) {
			for (let i=0; i<2; i++) {
				vr.getView(i, viewmatrix);
				vr.getProjection(i, projmatrix);
				gl.viewport(i * fbo.width/2, 0, fbo.width/2, fbo.height);

				draw(i);
			}
		} else {
			let a = t/5;
			let d = Math.sin(t/3) + 1.5;
			mat4.lookAt(viewmatrix, [d*Math.sin(a), 1.5, d*Math.cos(a)], [0, 1.5, 0], [0, 1, 0]);
			mat4.perspective(projmatrix, Math.PI/3, vrdim[0]/vrdim[1], 0.01, 10);
			gl.viewport(0, 0, fbo.width, fbo.height);

			draw();
		}
	}
	gl.bindFramebuffer(gl.FRAMEBUFFER, null);

	if (USEVR) vr.submit(fbo.colorTexture)

	// Get window size (may be different than the requested size)
	let dim = glfw.getFramebufferSize(window);
	gl.viewport(0, 0, dim[0], dim[1]);
	gl.enable(gl.DEPTH_TEST)
	gl.depthMask(true)
	gl.clearColor(0.2, 0.2, 0.2, 1);
	gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);

	// render the cube with the texture we just rendered to
    gl.bindTexture(gl.TEXTURE_2D, fbo.colorTexture);
	fbo_program.begin();
	fbo_program.uniform("u_scale", 1, 1);
	fbo_vao.bind().draw().unbind();
	fbo_program.end();

	// Swap buffers
	glfw.swapBuffers(window);

}

function draw(eye=0) {

	floor_program.begin();
	floor_program.uniform("u_viewmatrix", viewmatrix);
	floor_program.uniform("u_projmatrix", projmatrix);
	floor_vao.bind().draw().unbind();
	floor_program.end();

	gl.enable(gl.BLEND);
	gl.blendFunc(gl.SRC_ALPHA, gl.ONE);
	gl.depthMask(false)

	sceneGraph.draw(gl);

	gl.disable(gl.BLEND);
	gl.depthMask(true)
}
//////////////////////////////////////////////////////////////////////////////////////////
// BOOT SEQUENCE
//////////////////////////////////////////////////////////////////////////////////////////

let socket;
let incomingDeltas = [];

function serverConnect() {
	const url = 'ws://localhost:8080'
	socket = new WebSocket(url)
	socket.binaryType = 'arraybuffer';
	socket.onopen = () => {
		console.log("websocket connected to "+url);
		socket.send(JSON.stringify({ cmd:"get_scene"})) 
	}
	socket.onerror = (error) => {
	  console.error(`WebSocket error: ${error}`)
	}
	socket.onclose = function(e) {
		socket = null;
		console.log("websocket disconnected from "+url);
		setTimeout(function(){
			console.log("websocket reconnecting");
			serverConnect();
		}, 2000);		
	}
	socket.onmessage = (e) => {
		if (e.data instanceof ArrayBuffer) {
			console.log("ws received arraybuffer of " + e.data.byteLength + " bytes")
		} else {
			let msg = e.data;
			try {
				msg = JSON.parse(msg);
			} catch(e) {}
			onServerMessage(msg, socket);
		} 
	}
}

function onServerMessage(msg, sock) {
    switch (msg.cmd) {
        case "deltas": {
            // insert into our TODO list:
            incomingDeltas.push.apply(incomingDeltas, msg.data);
        } break;

        // server assigns an iid for our session. use this to route controller and HMD data to local max client. 
        // case "assignID":{
             
        // }
        // break
        // case "contexts":{
        //     console.log(msg.data)
        //     vrContextID = msg.data.vrContext
        //     audioContextID = msg.data.audioContext
        // }
        break;
        default:
           console.log("received JSON", msg, typeof msg);
    }
}

async function init() {
	// init opengl 

	sceneGraph.init(gl);
	// add floor
	// init font
	// init box
	// init vr
	// init menu
	animate()

	// server connect
	if (USEWS) {
		serverConnect();
	} else {
		localGraph = JSON.parse(fs.readFileSync(demoScene, "utf8"));
		
		// rebuild scene:
		//scene = rebuildInstances(rebuildScene(localGraph));

		sceneGraph.rebuild(localGraph);
	}
}

function shutdown() {
	console.log("shutdown")
	if (USEVR) vr.connect(false)
	glfw.destroyWindow(window);
	glfw.terminate();
	socket.terminate();
	process.exit(0)
}

init();