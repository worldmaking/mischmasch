
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

let font = createSDFFont(gl, "font/CONSOLATTF.png", "font/CONSOLA.TTF-msdf.json")


let textquadprogram = glutils.makeProgram(gl,
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
}
`,
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
}
`);
let textquad = glutils.createVao(gl, glutils.makeQuad({ min:0., max:1, div:8 }), textquadprogram.id);

// create a VBO & friendly interface for the instances:
// TODO: could perhaps derive the fields from the vertex shader GLSL?
let textquads = glutils.createInstances(gl, [
	{ name: "i_modelmatrix", components: 16 },
	{ name: "i_fontbounds", components: 4 },
	{ name: "i_fontcoord", components: 4 },
//	{ name: "i_color", components: 4 },
])

// bind instance VBO to VAO:
textquads.attachTo(textquad);


// message is a string
// idx is the instance index to start adding character at (allows appending strings)
function setMessage(message, modelmatrix=mat4.create(), idx=0) {
	// reallocate if necessary:
	textquads.allocate(idx + message.length);
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
			let obj = textquads.instances[idx];
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
	return idx;
}


let cubeprogram = glutils.makeProgram(gl,
`#version 330
uniform mat4 u_viewmatrix;
uniform mat4 u_projmatrix;

// instance attrs:
in vec4 i_pos;
in vec4 i_quat;
in vec4 i_color;
in vec3 i_scale;
in float i_shape;

in vec3 a_position;
in vec3 a_normal;
in vec2 a_texCoord;

out vec4 v_color;
out vec3 v_normal;
out float v_shape;
out vec2 v_uv;

float PI = 3.141592653589793;

// http://www.geeks3d.com/20141201/how-to-rotate-a-vertex-by-a-quaternion-in-glsl/
vec3 quat_rotate( vec4 q, vec3 v ){
	return v + 2.0 * cross( q.xyz, cross( q.xyz, v ) + q.w * v );
}
vec4 quat_rotate( vec4 q, vec4 v ){
	return vec4(v.xyz + 2.0 * cross( q.xyz, cross( q.xyz, v.xyz ) + q.w * v.xyz), v.w );
}

void main() {
	v_color = i_color;

	// Multiply the position by the matrix.
	vec3 vertex = a_position.xyz;
	vec3 normal = normalize(a_normal);
	vec2 uv = a_texCoord;

	if (i_shape > 1.5) {
		vec2 p = (vertex.xy - 0.5)*2.0;
		p = p * abs(normalize(p));
		if (i_shape > 1.5) {
			if (p.y > 0.5 && abs(p.x) < 0.1) {
				p.xy *= 1.2;    
				uv.x = mod(uv.x + 0.5, 1.);
			}
		}
		normal.xy = normalize(mix(p.xy, vec2(0.), abs(normal.z)));
		vertex.xy = p*0.5;// + 0.5;
		vertex *= i_scale.xxz;
	} else if (i_shape > 0.5) {
		// SHAPE_BUTTON:
		vertex.xy -= 0.5;
		vertex *= i_scale.xxz;
	} else {
		// SHAPE_BOX:
		// push box behind the plane of the coordinate frame,
		// so that widgets etc. sit in front of it
		vertex.z -= 1.001;
		vertex *= i_scale.xyz;
	}

	vertex = quat_rotate(i_quat, vertex);
	vertex = vertex + i_pos.xyz;
	// u_modelmatrix * 
	gl_Position = u_projmatrix * u_viewmatrix * vec4(vertex, 1);

	normal = quat_rotate(i_quat, normal);
	v_normal = normal;
	v_uv = uv;
	v_shape = i_shape;

	
	// v_color = vec4(v_normal*0.25+0.25, 1.);
	// v_color += vec4(a_texCoord*0.5, 0., 1.);
}
`,
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
}
`);
// create a VAO from a basic geometry and shader
let cubegeom = glutils.makeCube({ min:0, max:1, div: 9 })
let cube = glutils.createVao(gl, cubegeom, cubeprogram.id);

//console.log(cube.geom.vertices)

// create a VBO & friendly interface for the instances:
// TODO: could perhaps derive the fields from the vertex shader GLSL?
let cubes = glutils.createInstances(gl, [
	{ name:"i_pos", components:4 },
	{ name:"i_quat", components:4 },
	{ name:"i_color", components:4 },
	{ name:"i_scale", components:3 },
	{ name:"i_shape", components:1 },
])

// the .instances provides a convenient interface to the underlying arraybuffer
cubes.instances.forEach(obj => {
	// each field is exposed as a corresponding typedarray view
	// making it easy to use other libraries such as gl-matrix
	// this is all writing into one contiguous block of binary memory for all instances (fast)
	vec4.set(obj.i_pos, 
		(Math.random()-0.5) * 2,
		(Math.random()-0.5) + 1.5,
		(Math.random()-0.5) * 2,
		1
	);
	quat.random(obj.i_quat);

	let shape = Math.random() * 2;
	
	let s = 0.1;
	vec3.set(obj.i_scale, 
		shape > 0.5 ? s : 0.5,
		shape > 0.5 ? s : 0.3,
		0.03  // depth
	);

	obj.i_shape[0] = shape;

	vec4.set(obj.i_color,
		Math.random(),
		Math.random(),
		Math.random(),
		1
	);
})
cubes.bind().submit().unbind();

// attach these instances to an existing VAO:
cubes.attachTo(cube);
	

let lineprogram = glutils.makeProgram(gl,
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
}
`,
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
}
`);
// create a VAO from a basic geometry and shader
let line = glutils.createVao(gl, glutils.makeLine({ min:0, max:1, div: 24 }), lineprogram.id);

// create a VBO & friendly interface for the instances:
// TODO: could perhaps derive the fields from the vertex shader GLSL?
let lines = glutils.createInstances(gl, [
	{ name:"i_color", components:4 },
	{ name:"i_quat0", components:4 },
	{ name:"i_quat1", components:4 },
	{ name:"i_pos0", components:3 },
	{ name:"i_pos1", components:3 },
], cubes.count)

lines.instances.forEach((obj, i) => {
	// pick a color:
	vec4.set(obj.i_color, 0.75, 1, 1, 0.75);
	// pick two quads to connect:
	obj.from = i;
	obj.to = i > 1 ? Math.floor(Math.random()*i) : cubes.count-1;
	// the rest of the instance vars are set in the animate() loop
})
lines.bind().submit().unbind();

// attach these instances to an existing VAO:
lines.attachTo(line);

let fboprogram = glutils.makeProgram(gl,
`#version 330
in vec4 a_position;
in vec2 a_texCoord;
uniform vec2 u_scale;
out vec2 v_texCoord;
void main() {
    gl_Position = a_position;
    vec2 adj = vec2(1, -1);
    gl_Position.xy = (gl_Position.xy + adj)*u_scale.xy - adj;
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
}
`);
let fboquad = glutils.createVao(gl, glutils.makeQuad(), fboprogram.id);






let vrdim = [4096, 4096];
if (USEVR) {
	assert(vr.connect(true), "vr failed to connect");
	vr.update()
	vrdim = [vr.getTextureWidth(), vr.getTextureHeight()]
}
let fbo = glutils.makeFboWithDepth(gl, vrdim[0], vrdim[1])


function reflowNodes(scene, parent_node, parent) {
	let children = []
	for (let name in parent_node) {
		if (name == "_props") continue;
		let node = reflowNode(scene, parent_node[name], name, parent);
		if (node) children.push(node)
	}
	return children;
}

function reflowNode(scene, node, id, parent) {
	const UI_SPACING = 0.1;
	const UI_DEPTH = UI_SPACING/3;
	let props = node._props || {}
	// create objects to add to the scene
	// depends on props.kind special cases
	// depends on how many children it has (we don't necessarily know that yet)
	let path = id;
	if (parent) {
		path = parent.path + "." + path;
	}
	let object = {
		parent: parent,
		node: node,
		node_parent: parent ? parent.node : undefined,
		kind: props.kind,
		name: id,
		path: path,
		// pos: vec3.clone(props.pos),
		// quat: vec4.clone(props.orient),
		// scale: scale,
		mat: mat4.create(),
	}

	let pos = props.pos;
	let quat = props.orient;
	let scale = [UI_SPACING, UI_SPACING, UI_DEPTH];
	let shape = SHAPE_BOX;
	if (!pos) pos = parent.pos;
	if (!quat) quat = parent.quat;
	
	object.pos = vec3.clone(pos)
	object.quat = vec4.clone(quat)
	mat4.fromRotationTranslationScale(object.mat, object.quat, object.pos, scale);


	switch(props.kind) {
		case "outlet":
		case "inlet":  {
			shape = SHAPE_CYLINDER;
			scale = [UI_SPACING/3, UI_SPACING/3, UI_DEPTH/2];
			object.color = props.kind == "inlet" ? [0, 1, 0, 1] : [1, 0, 0, 1];
		} break;
		case "knob": 
		case "large_knob":  {
			shape = SHAPE_KNOB;
			scale = [UI_SPACING*2/3, UI_SPACING*2/3, UI_DEPTH];
			object.color = colorFromString(id);
		} break;
		case "small_knob": {
			shape = SHAPE_KNOB;
			scale = [UI_SPACING/2, UI_SPACING/2, UI_DEPTH];
			object.color = colorFromString(id);
		} break;
		case "n_switch": {
			shape = SHAPE_BUTTON;
			scale = [UI_SPACING/2, UI_SPACING/2, UI_DEPTH];
			object.color = colorFromString(id);
		} break;
		default: {
			// how many children does it have?
			// careful to skip _props
			let child_names = Object.keys(node).filter(key => key != "_props");
			let numchildren = child_names.length;
			let numcols = Math.ceil(Math.sqrt(numchildren));
			let numrows = Math.ceil(numchildren / numcols);
			// special-case small modules:
			if (numchildren <= 4) {
				numcols = numchildren;
				numrows = 1;
			}
			// extra row for label:
			numrows++;
			
			shape = SHAPE_BOX;
			scale = [UI_SPACING*numcols, UI_SPACING*numrows, UI_DEPTH];
			object.color = colorFromString(props.kind);

			//mat4.fromRotationTranslationScale(object.mat, quat, pos, scale);

			if (numchildren) {
				//console.log(numcols, numrows);
				// recurse to create child nodes so we know how to lay them out:
				let children = reflowNodes(scene, node, object);
				// start at row 1, since the label occupies row zero
				for (let r = 1, i=0; r<numrows; r++) {
					for (let c=0; c<numcols && i < numchildren; c++, i++) {
						let child = children[i];
						let child_pos = [
							0.5 + c,
							numrows - (0.5 + r),
							0
						];

						vec3.transformMat4(child.pos, child_pos, object.mat);
						// widget.position.x = grid_spacing * (c-(numcols-1)/2);
						// widget.position.y = -grid_spacing * (r-(numrows-1)/2);
						// widget.position.z = NLET_HEIGHT/2;

						// let child_pos = vec3.transformMat4(vec3.create(), [
						// 	0.5*numcols - 0.5*w*ts, 	// horizontal centred of panel
						// 	numrows-(1 + 0.5*ts), 		// baseline of 1st row plus scale adjust 
						// 	0], object.mat);

						// basic width:
						let text = child.name;
						let w = font.charwidth * text.length;
						let h = font.charheight;
						// scale to fit:
						let ts = Math.min(0.5/w, 0.5/h)
						let text_scale = [ts * UI_SPACING, ts * UI_SPACING, UI_DEPTH]
						let text_pos = [
							-0.5*w*ts, 	// horizontal centred of panel
							0.45 -0.25*ts,//1-(0.5 + ts/2),
							0.
						];
						vec3.add(text_pos, text_pos, child_pos);
						vec3.transformMat4(text_pos, text_pos, object.mat);
			
						let text_mat = mat4.fromRotationTranslationScale(mat4.create(), 
							quat, text_pos, text_scale
						);

						scene.labels.push({
							message: child.name,
							mat: text_mat,
						});
					}
				}
			}
			
			// add a label:
			let text = props.kind;

			// basic width:
			let w = font.charwidth * text.length;
			let h = font.charheight;
			let modelmatrix = mat4.create();
			// scale to fit:
			let ts = Math.min(
				numcols/(w+1), // horizontal fit
				1/(h+1)				// vertical fit
			);
			let text_scale = [ts * UI_SPACING, ts * UI_SPACING, ts * UI_SPACING]
			//text_scale = [UI_SPACING, UI_SPACING, UI_SPACING]
			// move up to row zero:
			// let text_pos = vec3.clone(pos);
			// text_pos[1] += (numrows-1)*UI_SPACING;

			// let text_pos = vec3.transformMat4(vec4.create()
			// 	[0, (numrows-1)*UI_SPACING, 0, 1], 
			// 	object.mat);
			//let text_pos = vec3.transformMat4(vec3.create(), [0.5 * ts, (numrows-1.25), 0], object.mat);
			let text_pos = vec3.transformMat4(vec3.create(), [
				0.5*numcols - 0.5*w*ts, 	// horizontal centred of panel
				numrows-(0.5 + ts*0.25), 		// baseline of 1st row plus scale adjust 
				0], object.mat);

			mat4.fromRotationTranslationScale(modelmatrix, 
				quat, text_pos, text_scale
			);
			scene.labels.push({
				message: text,
				mat: modelmatrix,
			})
		}
	}

	// add a cube at this location:
	object.pos = vec3.clone(pos)
	object.quat = vec4.clone(quat)
	object.scale = vec3.clone(scale)
	object.shape = shape;

	// add to scene:
	scene.boxes.push(object);
	scene.paths[object.path] = object;

	return object;
}

function rebuildScene(graph) {

	let scene = {
		boxes: [],
		cables: [],
		labels: [],
		// a lookup table from path to the object it refers to:
		paths: {},
	}
	reflowNodes(scene, graph.nodes);

	// reflow arcs:
	for (let arc of graph.arcs) {
		const [path_from, path_to] = arc;
		// find the corresponding objects:
		let a = scene.paths[ arc[0] ]
		let b = scene.paths[ arc[1] ]
		scene.cables.push({
			from: a,
			to: b,
		})
	}
	//console.log("scene", scene)
	return scene;
}
	
function rebuildInstances(scene) {
	// reset instance counts:
	cubes.count = 0;
	lines.count = 0;
	textquads.count = 0;
	// reallocate space if necessary:
	if (scene.boxes.length >= cubes.allocated) {
		cubes.allocate(Math.max(scene.boxes.length+4, cubes.allocated*2))
	}
	if (scene.cables.length >= lines.allocated) {
		lines.allocate(Math.max(scene.cables.length+4, lines.allocated*2))
	}
	// text reallocate will happen per-label

	for (let box of scene.boxes) {
		if (cubes.count >= cubes.allocated) {
			cubes.allocate(Math.max(cubes.count+4, cubes.allocated*2))
		}
		let obj = cubes.instances[cubes.count];
		vec3.copy(obj.i_pos, box.pos);
		vec3.copy(obj.i_scale, box.scale);
		quat.copy(obj.i_quat, box.quat);
		obj.i_shape[0] = box.shape;
		vec4.copy(obj.i_color, box.color);
		cubes.count++;
	}

	for (let cable of scene.cables) {
		let line = lines.instances[lines.count];
		let {from, to} = cable;
		quat.copy(line.i_quat0, from.quat);
		quat.copy(line.i_quat1, to.quat);
		vec3.copy(line.i_pos0, from.pos);
		vec3.copy(line.i_pos1, to.pos);
		vec4.set(line.i_color, 1, 1, 1, 1)
		lines.count++;
	}

	for (let label of scene.labels) {
		textquads.count = setMessage(label.message, label.mat, textquads.count);
	}

	// submit to GPU:
	cubes.bind().submit().unbind()
	lines.bind().submit().unbind()
	textquads.bind().submit().unbind()

	return scene;
}


let t = glfw.getTime();
let fps = 60;
//while(!glfw.windowShouldClose(window) && !glfw.getKey(window, glfw.KEY_ESCAPE)) {

function animate() {
	
	if(glfw.windowShouldClose(window) || glfw.getKey(window, glfw.KEY_ESCAPE)) {
		shutdown();
	} else {
		setImmediate(animate)
	}

	let t1 = glfw.getTime();
	let dt = t1-t;
	fps += 0.1*((1/dt)-fps);
	t = t1;
	glfw.setWindowTitle(window, `fps ${fps}`);

	if (0) {
		let modelmatrix = mat4.create();
		let s = 0.1
		mat4.fromRotationTranslationScale(modelmatrix, 
			[0, 0, 0, 1], [0, 1, 0], [s, s, s]
		);
		textquads.count = setMessage("hello\nworld", modelmatrix);
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
	
	// if (cubes.count) {
	// 	let i = Math.floor(Math.random() * cubes.count)
	// 	let obj = cubes.instances[i]
	// 	quat.slerp(obj.i_quat, obj.i_quat, quat.random(quat.create()), 0.1);
	// 	quat.normalize(obj.i_quat, obj.i_quat);
	// }
	// lines.instances.forEach((obj, i) => {
	// 	let a = cubes.instances[obj.from]
	// 	let b = cubes.instances[obj.to]
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
			let d = 2;
			mat4.lookAt(viewmatrix, [d*Math.sin(t/9), 1.5, d*Math.cos(t/9)], [0, 1.5, 0], [0, 1, 0]);
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
	fboprogram.begin();
	fboprogram.uniform("u_scale", 1, 1);
	fboquad.bind().draw().unbind();
	fboprogram.end();

	// Swap buffers
	glfw.swapBuffers(window);
	glfw.pollEvents();

}

function draw(eye=0) {
	gl.enable(gl.BLEND);
	gl.blendFunc(gl.SRC_ALPHA, gl.ONE);
	gl.depthMask(false)

	cubeprogram.begin();
	cubeprogram.uniform("u_viewmatrix", viewmatrix);
	cubeprogram.uniform("u_projmatrix", projmatrix);
	cube.bind().drawInstanced(cubes.count).unbind()
	cubeprogram.end();

	lineprogram.begin();
	lineprogram.uniform("u_viewmatrix", viewmatrix);
	lineprogram.uniform("u_projmatrix", projmatrix);
	lineprogram.uniform("u_stiffness", 0.5)
	// consider gl.LINE_STRIP with simpler geometry
	line.bind().drawInstanced(lines.count, gl.LINES).unbind()
	lineprogram.end();

	// text:
	font.texture.bind(0)
	textquadprogram.begin();
	//textquadprogram.uniform("u_modelmatrix", modelmatrix);
	textquadprogram.uniform("u_viewmatrix", viewmatrix);
	textquadprogram.uniform("u_projmatrix", projmatrix);
	textquad.bind().drawInstanced(textquads.count).unbind()
	textquadprogram.end();

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
		scene = rebuildInstances(rebuildScene(localGraph));
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