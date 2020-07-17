/*

For moving objects, convenient to have a graph structure so that moving a parent can iterate to update all children
	- so a node needs a list of its children
For child objects it would be convenient to store positions in units of the module grid,
	- then can recompute the instance position and matrix more rapidly
	- but a node will need pointer to its parent context

Option of having a root node



Two scale factors to consider:
- "scale": A scalar value for the scale factor from parent system, which will be in the parent mat. E.g. modules by defualt will have scale=UI_DEFAULT_SCALE.
- "dim": A bounding-scale used to stretch modules to fit no. rows & cols in their grid layout. Sets the bounding box of the object relative to its coordinate frame. 

Child objects' world-space depends on parent's mat4, which factors in "scale", not "dim". 

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
glutils = require(path.join(nodeglpath, "glutils.js"))

const got = require("./got/got.js")

// skip VR if on OSX:
const USEVR = 1 && (process.platform === "win32");
const vr = (USEVR) ? require(path.join(nodeglpath, "openvr.js")) : null
const USEWS = 0;
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
	// ray is a hit if the furthest entry plane is before the nearest exit plane
	let tentry = Math.max(tmin[0], tmin[1], tmin[2])
	let texit = Math.min(tmax[0], tmax[1], tmax[2])
	// hit if entry is before exit:
	return [tentry <= texit && texit > 0, tentry];
}

////////////////////////////////////////////////////////////////

const SHAPE_BOX = 0;
const SHAPE_BUTTON = 1;
const SHAPE_CYLINDER = 2;
const SHAPE_KNOB = 3;

const UI_DEFAULT_SCALE = 0.1;
const UI_DEPTH = 1/3;

const NEAR_CLIP = 0.01;
const FAR_CLIP = 20;

let sceneGraph = null
let menuSceneGraph = null

// GOT graph, local copy.
let localGraph = {
	nodes: {},
	arcs: []
}

let menuGraph = {
	nodes: {},
	arcs: []
}


let viewmatrix = mat4.create();
let projmatrix = mat4.create();
let viewmatrix_inverse = mat4.create();
let projmatrix_inverse = mat4.create();

const renderer = {
	
}

const UI = {
	menuMode: 0,

	hmd: {
		pos: [0, 1.4, 1],
		orient: [0, 0, 0, 1],
	},
	hands: [
		{
			pos: [-0.5, 1, 0.5],
			orient: [0, 0, 0, 1],
		},
		{
			pos: [+0.5, 1, 0.5],
			orient: [0, 0, 0, 1],
		}
	]
}

let mouse = {
	// location of mouse in normalized device coordinates (-1..1)
	ndc: [0, 0, 0, 1],
}

// tracking info for VR:
let hmd = null, hands = [null, null]; // L, R

// debug TODO remove later
let point = [0, 0, 0, 1]

let vrdim = [4096, 4096];

let controllerOBJ = fs.readFileSync(path.join(__dirname, "objs", "vr_controller_vive_1_5.obj"), "utf-8");
const controllerGeom = glutils.geomFromOBJ(controllerOBJ)

const menuModules = Object.assign({
    "speaker":{
      "_props":{"kind":"speaker","category":"abstraction", "pos": [0,0,0], "orient": [0, 0, 0, 1] },
      "input":{"_props":{"kind":"inlet","index":0}}
	},
	"knob":{
		"_props":{ "kind":"param", "category":"abstraction", "pos": [0,0,0], "orient": [0, 0, 0, 1] },
		"value":{"_props":{"kind":"large_knob", "range":[0,1], "value":0}},
		"output":{"_props":{"kind":"outlet","index":0}}
	},
}, JSON.parse(fs.readFileSync("menu.json", "utf-8")))



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
	assert(vr.connect(true), "vr failed to connect");
	vr.update()
	vrdim = [vr.getTextureWidth(), vr.getTextureHeight()]
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

	window = glfw.createWindow(800, 800, "Test");
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

	renderer.textquad_geom = glutils.makeQuad({ min:0., max:1, div:8 });
	renderer.module_geom = glutils.makeCube({ 
		min:[-1,-1, 0], 
		max:[ 1, 1, 1], 
		div: [13, 13, 1] 
	});
	renderer.wand_geom = glutils.makeCube({ 
		min:[-0.03,-0.03, 0], 
		max:[ 0.03, 0.03, 0.1], 
		div: [13, 13, 1] 
	});

	renderer.line_geom = glutils.makeLine({ min:0, max:1, div: 24 });
	const floor_m = 6;
	renderer.floor_geom = glutils.makeQuad({ min: -floor_m, max: floor_m, div:8 })
	renderer.debug_geom = glutils.makeCube({min:-0.01, max:0.01})

	
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
uniform mat4 u_modelmatrix;
uniform mat4 u_viewmatrix;
uniform mat4 u_projmatrix;
in vec3 a_position;
in vec3 a_normal;
in vec2 a_texCoord;

// in vec3 i_pos;
// in vec4 i_quat;

out vec4 v_color;
out vec3 v_normal;
out vec2 v_uv;

void main() {
	// Multiply the position by the matrix.
	vec3 vertex = a_position.xyz;
	gl_Position = u_projmatrix * u_viewmatrix * u_modelmatrix * vec4(vertex, 1);

	v_color = vec4(a_normal*0.25+0.25, 1.);
	v_color += vec4(a_texCoord*0.5, 0., 1.);

	vec3 normal = a_normal;
	vec2 uv = a_texCoord;
	//normal = quat_rotate(i_quat, normal);
	v_normal = normal;
	v_uv = uv;
	v_color = vec4(1.);
}
`,
`#version 330
precision mediump float;

in vec4 v_color;
in vec3 v_normal;
in vec2 v_uv;

out vec4 outColor;

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
// 7 o'clock through 5 o'clock:
const float KNOB_ANGLE_LIMIT = PI * 5./6.;

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
		// SHAPE_CYLINDER:
	 	vec2 p = vertex.xy;
	 	p = p * abs(normalize(p));

	 	if (normal.z == 0.) {
	 		uv.x = mod(uv.x * 2., 1.);
	 	}
		if (i_shape > 2.5) {
			// SHAPE_KNOB
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
	v_color = i_color * (1.+i_highlight);
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

	// GLOBAL GL RESOURCES:
	renderer.floor_vao = glutils.createVao(gl, renderer.floor_geom, renderer.floor_program.id);
	renderer.debug_vao = glutils.createVao(gl, renderer.debug_geom, renderer.debug_program.id);
	renderer.fbo_vao = glutils.createVao(gl, glutils.makeQuad(), renderer.fbo_program.id);
	renderer.wand_vao = glutils.createVao(gl, controllerGeom, renderer.wand_program.id);
	renderer.fbo = glutils.makeFboWithDepth(gl, vrdim[0], vrdim[1])
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
				quat: [0, 0, 0, 1],
				name: "root",
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
					line.name = line.from.name + ">" + line.to.name
					this.line_instances.count++;

					// add jack cylinders:
					for (let parent of [line.from, line.to]) {
						let obj = this.getNextModule(parent);
						obj.name = line.name +":" + parent.name;
						obj.scale = UI_DEFAULT_SCALE
						obj.pos = [0, 0, 0]
						obj.quat = parent.i_quat; //[0, 0, 0, 1]
						obj.dim = [1/4, 1/4, 1/2]
						vec4.set(obj.i_color, 0.75, 0.75, 0.75, 1)
						obj.i_shape[0] = SHAPE_CYLINDER;
						obj.i_value[0] = 0;
					}

					
				}
			}
			this.line_instances.count = graph.arcs.length;
			return this;
		},

		getNextModule(parent) {
			// create a module instance:
			// reallocate space if needed
			if (this.module_instances.count >= this.module_instances.allocated) {
				this.module_instances.allocate(Math.min(4, this.module_instances.allocated*2));
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

			// create a module instance:
			// reallocate space if needed
			if (this.module_instances.count >= this.module_instances.allocated) {
				this.module_instances.allocate(Math.min(4, this.module_instances.allocated*2));
			}

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
			obj.pos = props.pos || [0, 0, 0];
			obj.quat = props.orient || [0, 0, 0, 1];
			obj.scale = 1;
			obj.dim = [1, 1, UI_DEPTH]

			obj.i_shape[0] = SHAPE_BOX;
			vec4.set(obj.i_color, 0.5, 0.5, 0.5, 1);
			obj.i_highlight[0] = 0;

			// default label:
			let label_text = name;
			let scale = UI_DEFAULT_SCALE;
			let text_scale = Math.min(1/(label_text.length+1), 1/font.charheight);
			let text_pos = [ 0, 0.4 ];

			switch(obj.kind) {
				case "outlet":
				case "inlet":  {
					obj.i_shape[0] = SHAPE_CYLINDER;
					vec4.copy(obj.i_color, props.kind == "inlet" ? [0.5, 0.5, 0.5, 1] : [0.25, 0.25, 0.25, 1]);
					obj.dim = [1/3, 1/3, UI_DEPTH/2];
					obj.nodes = []
					this.addLabel(obj, label_text, text_pos, text_scale);
				} break;
				case "small_knob": {
					obj.i_shape[0] = SHAPE_KNOB;
					vec4.copy(obj.i_color, colorFromString(name));
					obj.dim = [1/2, 1/2, UI_DEPTH];
					let range = props.range || [0,1];
					let value = props.value || 0.;
					obj.i_value[0] = (value - range[0])/(range[1]-range[0]);
					this.addLabel(obj, label_text, text_pos, text_scale);
				} break;
				case "knob": 
				case "large_knob":  {
					obj.i_shape[0] = SHAPE_KNOB;
					vec4.copy(obj.i_color, colorFromString(name));
					obj.dim = [2/3, 2/3, UI_DEPTH];
					let range = props.range || [0,1];
					let value = props.value || 0.;
					obj.i_value[0] = (value - range[0])/(range[1]-range[0]);
					this.addLabel(obj, label_text, text_pos, text_scale);
				} break;
				case "n_switch": {
					obj.i_shape[0] = SHAPE_BUTTON;
					vec4.copy(obj.i_color, colorFromString(name));
					let throws = props.throws || [0,1];
					let value = props.value || 0.;
					obj.i_value[0] = value/(throws.length-1);
					this.addLabel(obj, label_text, text_pos, text_scale);
				} break;
				default: {
					vec4.copy(obj.i_color, colorFromString(props.kind));
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
					obj.scale = UI_DEFAULT_SCALE;
					obj.dim = [ncols, nrows, -UI_DEPTH];
					for (const child of obj.nodes) {
						child.pos = [ 
							0.5 + child.col - ncols/2, 
							nrows/2 - (0.5 + child.row), 
							0 
						];
					}

					// add module label:
					label_text = obj.kind.toUpperCase();
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
				quat.multiply(obj.i_quat, obj.quat, obj.parent.quat);
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
				quat.copy(obj.i_quat0, from.i_quat);
				quat.copy(obj.i_quat1, to.i_quat);
				vec3.copy(obj.i_pos0, from.i_pos);
				vec3.copy(obj.i_pos1, to.i_pos);
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
			gl.enable(gl.BLEND);
			gl.blendFunc(gl.SRC_ALPHA, gl.ONE);
			gl.depthMask(false)

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
		
			gl.disable(gl.BLEND);
			gl.depthMask(true);
			return this;
		},
	}
}

//////////////////////////////////////////////////////////////////////////////////////////
// UI
//////////////////////////////////////////////////////////////////////////////////////////

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
	for (let obj of instances) {
		if (!obj.i_bb0 || !obj.i_bb1) continue;  // no bounding box, no test
		// check for hits:
		let [hit, distance] = intersectCube(obj.i_pos, obj.i_quat, obj.i_bb0, obj.i_bb1, ray_origin, ray_dir);
		if (hit) hits.push([obj, distance]);
	}
	// if there are hits, sort them by distance
	// then highlight the nearest
	if (hits.length) hits.sort((a,b)=>a[1]-b[1]);
	return hits;
}

function initUI(window) {

	glfw.setWindowPosCallback(window, function(w, x, y) {
		console.log("window moved", w, x, y)
		return 1;
	})

	glfw.setMouseButtonCallback(window, function(...args) {
		console.log("mouse button", args);
	})

	glfw.setWindowContentScaleCallback(window, function(...args) {
		console.log("content scale", args);
	})

	// px, py are in screen pixels
	glfw.setCursorPosCallback(window, (window, px, py) => {
		// convert px,py to normalized 0..1 coordinates:
		const dim = glfw.getWindowSize(window)
		mouse.ndc[0] = +2*px/dim[0] + -1;
		mouse.ndc[1] = -2*py/dim[1] + +1;
	});

	glfw.setKeyCallback(window, function(...args) {
		console.log("key event", args);
	})
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
        }
		console.log("updated localGraph", JSON.stringify(localGraph, null, "  "))
		
		// // re-layout:
		sceneGraph.rebuild(localGraph)
	}
	
	//if(wsize) console.log("FB size: "+wsize.width+', '+wsize.height);
	let hits
	if (USEVR) {
		vr.update();
		let inputs = vr.inputSources()
		for (let input of inputs) {
			if (input.targetRayMode == "gaze") {
				hmd = input;

				let mat = input.targetRaySpace; // mat4
				if (mat) {
					mat4.getTranslation(UI.hmd.pos, mat);
					mat4.getRotation(UI.hmd.orient, mat);
				}
			} else if (input.handedness == "left") {
				hands[0] = input;
				let mat = input.targetRaySpace; // mat4
				if (mat) {
					mat4.getTranslation(UI.hands[0].pos, mat);
					mat4.getRotation(UI.hands[0].orient, mat);
				}
			} else if (input.handedness == "right") {
				hands[1] = input;
				let mat = input.targetRaySpace; // mat4
				if (mat) {
					mat4.getTranslation(UI.hands[1].pos, mat);
					mat4.getRotation(UI.hands[1].orient, mat);
				}
			}
		}

		for (let hand of hands) {
			if (!hand) continue; // i.e. if not connected
			let mat = hand.targetRaySpace; // mat4
			let {buttons, axes} = hand.gamepad;
			let trigger = buttons[0].value, pressed = buttons[0].pressed
			let grip = buttons[1].pressed
			let pad = buttons[2].pressed
			let menu = buttons[3].pressed
			let [x, y] = axes; // touchpad axes

			if (!mat) continue;

			// //console.log(trigger, pressed, grip, pad, menu, x, y)
			let ray_origin = mat.slice(12, 15)  // translation component
			let ray_dir = mat.slice(8, 11)  // local Z axis
			vec3.negate(ray_dir, ray_dir)

			hits = rayTestModules(sceneGraph.module_instances.instances, ray_origin, ray_dir)
		}
	} else {
		// use mouse:

		// near plane point
		let cam_near = vec3.transformMat4(vec3.create(), [mouse.ndc[0], mouse.ndc[1], -1], projmatrix_inverse);
		let ray_origin = vec3.transformMat4(vec3.create(), cam_near, viewmatrix_inverse);
		// far plane point
		let cam_far = vec3.transformMat4(vec3.create(), [mouse.ndc[0], mouse.ndc[1], +1], projmatrix_inverse);	
		let ray_far = vec3.transformMat4(vec3.create(), cam_far, viewmatrix_inverse);
		// mouse ray:
		let ray_dir = vec3.sub(vec3.create(), ray_far, ray_origin);
		vec3.normalize(ray_dir, ray_dir);

		hits = rayTestModules(sceneGraph.module_instances.instances, ray_origin, ray_dir)
		
	}

	sceneGraph.module_instances.instances.forEach(obj=>{
		obj.i_highlight[0] = 0;
	})
	
	if(hits && hits.length) {
		console.log("hits:", hits.map(v=>v[0].path))
		hits.forEach(v=>{
			v[0].i_highlight[0] = 1;
		})
	}
	// instance vars can change on a frame by frame basis;
	// propagate their changes (scene graph) and update the GPU accordingly:
	//sceneGraph.updateInstances()
	sceneGraph.submit();


	// render to our targetTexture by binding the framebuffer
    gl.bindFramebuffer(gl.FRAMEBUFFER, renderer.fbo.id);
	{
		gl.viewport(0, 0, renderer.fbo.width, renderer.fbo.height);
		gl.enable(gl.DEPTH_TEST)
		gl.depthMask(true)
		gl.clearColor(0, 0, 0, 1);
		gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);

		if (USEVR) {
			for (let i=0; i<2; i++) {
				vr.getView(i, viewmatrix);
				vr.getProjection(i, projmatrix);
				mat4.invert(viewmatrix_inverse, viewmatrix);
				mat4.invert(projmatrix_inverse, projmatrix);

				gl.viewport(i * renderer.fbo.width/2, 0, renderer.fbo.width/2, renderer.fbo.height);

				draw(i);
			}
		} else {
			let a = t/5;
			let d = Math.sin(t/3) + 1.5;
			let h = 1.25;
			mat4.lookAt(viewmatrix, [d*Math.sin(a), h, d*Math.cos(a)], [0, h, 0], [0, 1, 0]);
			mat4.perspective(projmatrix, Math.PI/2, vrdim[0]/vrdim[1], NEAR_CLIP, FAR_CLIP);
			mat4.invert(viewmatrix_inverse, viewmatrix);
			mat4.invert(projmatrix_inverse, projmatrix);
			gl.viewport(0, 0, renderer.fbo.width, renderer.fbo.height);

			draw();
		}
	}
	gl.bindFramebuffer(gl.FRAMEBUFFER, null);

	if (USEVR) vr.submit(renderer.fbo.colorTexture)

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

let once = 1
function draw(eye=0) {

	renderer.floor_program.begin();
	renderer.floor_program.uniform("u_viewmatrix", viewmatrix);
	renderer.floor_program.uniform("u_projmatrix", projmatrix);
	renderer.floor_vao.bind().draw().unbind();
	renderer.floor_program.end();

	gl.enable(gl.BLEND);
	gl.blendFunc(gl.SRC_ALPHA, gl.ONE);
	gl.depthMask(false)

	for (let hand of hands) {
	 	if (!hand || !hand.targetRaySpace) continue; // i.e. if not connected
		renderer.wand_program.begin();
		renderer.wand_program.uniform("u_viewmatrix", viewmatrix);
		renderer.wand_program.uniform("u_projmatrix", projmatrix);
		renderer.wand_program.uniform("u_modelmatrix", hand.targetRaySpace);
		renderer.wand_vao.bind().draw().unbind();
		renderer.wand_program.end();
	}

	if (UI.menuMode){
		menuSceneGraph.draw(gl)
	} else {
		sceneGraph.draw(gl);
	}

	gl.disable(gl.BLEND);
	gl.depthMask(true)
}


//////////////////////////////////////////////////////////////////////////////////////////
// BOOT SEQUENCE
//////////////////////////////////////////////////////////////////////////////////////////

let socket;
let incomingDeltas = [];

function initMenu(menuModules) {
	let module_names = Object.keys(menuModules)
		//.concat(operatorNames)
	let ncols = Math.min(24, Math.max(12, Math.ceil(Math.sqrt(module_names.length))))
	let nrows = Math.min(6, Math.ceil(module_names.length / ncols));
	console.log("menu", module_names.length, nrows, ncols)
	let i = 0;
    for (let row = 0; row < nrows; row++) {
        for(let col = 0; col < ncols && i < module_names.length; col++, i++){
			let name = module_names[i]
			let theta = col * (2 * Math.PI) / ncols;
            let r = 0.75;
            let x = r * Math.sin(theta);
            let z = r * Math.cos(theta);
			let y = 1.1 + -.4 * (row - (nrows/2));
			
			let module = menuModules[name]
			quat.fromEuler(module._props.orient, 0, 180 + theta*180/Math.PI, 0)
			vec3.set(module._props.pos, x, y, z);
		}
	}
	return menuModules
}

function serverConnect() {
	const url = 'ws://localhost:8080'
	socket = new WebSocket(url)
	socket.binaryType = 'arraybuffer';
	socket.onopen = () => {
		console.log("websocket connected to "+url);
		socket.send(JSON.stringify({ cmd:"get_scene"})) 
		// reset our local scene:
		localGraph = {
			nodes: {},
			arcs: []
		};
		sceneGraph.rebuild(localGraph)
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
	window = initWindow();
	initRenderer(renderer);

	// menuGraph.nodes = initMenu(menuModules);
	// menuSceneGraph = makeSceneGraph(renderer, gl)
	// menuSceneGraph.init(gl)
	// menuSceneGraph.rebuild(menuGraph)

	// default graph until server connects:
	localGraph = JSON.parse(fs.readFileSync(demoScene, "utf8"));
	// server connect
	if (USEWS) {
		serverConnect();
	} 
	sceneGraph = makeSceneGraph(renderer, gl);
	sceneGraph.init(gl);
	sceneGraph.rebuild(localGraph)
	
	
	initUI(window);

	
	animate()
}

function shutdown() {
	console.log("shutdown")
	if (USEVR) vr.connect(false)
	glfw.destroyWindow(window);
	glfw.terminate();
	if (socket) socket.terminate();
	process.exit(0)
}

init();