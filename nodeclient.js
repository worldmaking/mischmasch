const fs = require("fs");
const path = require("path");
const os = require("os");
const assert = require("assert");
const { vec2, vec3, vec4, quat, mat2, mat2d, mat3, mat4} = require("gl-matrix")

const WebSocket = require('ws')
const url = 'ws://localhost:8080'

const nodeglpath = "../node-gles3"
const gl = require(path.join(nodeglpath, "gles3.js")),
glfw = require(path.join(nodeglpath, "glfw3.js")),
vr = require(path.join(nodeglpath, "openvr.js")),
glutils = require(path.join(nodeglpath, "glutils.js"))

const got = require("./got/got.js")

////////////////////////////////////////////////////////////////
let localGraph = {
	nodes: {},
	arcs: []
}


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

let window = glfw.createWindow(720, 480, "Test");
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
glfw.swapInterval(0); // 0 for vsync off



let quadprogram = glutils.makeProgram(gl,
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
let quad = glutils.createVao(gl, glutils.makeQuad(), quadprogram.id);

let cubeprogram = glutils.makeProgram(gl,
`#version 330
uniform mat4 u_modelmatrix;
uniform mat4 u_viewmatrix;
uniform mat4 u_projmatrix;

// instance attrs:
in vec4 i_pos;
in vec4 i_quat;
in vec4 i_color;
in vec3 i_scale;
in float i_shape;

// geom attrs:
in vec3 a_position;
in vec3 a_normal;
in vec2 a_texCoord;
out vec4 v_color;
out vec2 v_uv;
out vec3 v_normal;
out float v_shape;

// http://www.geeks3d.com/20141201/how-to-rotate-a-vertex-by-a-quaternion-in-glsl/
vec3 applyQuaternionToVector( vec4 q, vec3 v ){
    return v + 2.0 * cross( q.xyz, cross( q.xyz, v ) + q.w * v );
}

void main() {
	// Multiply the position by the matrix.
	vec3 vertex = a_position.xyz;
	vec3 normal = normalize(a_normal);
	vec2 uv = a_texCoord;

	if (i_shape > 0.5) {
		vertex.xy = normalize(vertex.xy);
		normal.xy = normalize(mix(vertex.xy, vec2(0.), abs(normal.z)));
		vertex.xy *= 0.5;

		// knob wedge
		if (i_shape > 1.5) {
				if (a_position.y > 0. && abs(a_position.x) < 0.1) {
					vertex.xy *= 1.2;    
					uv.x = mod(uv.x + 0.5, 1.);
				}
		}
	}

	vertex *= i_scale.xyz;
	vertex = applyQuaternionToVector(i_quat, vertex);
	vertex = vertex + i_pos.xyz;
	gl_Position = u_projmatrix * u_viewmatrix * u_modelmatrix * vec4(vertex, 1);

	normal = applyQuaternionToVector(i_quat, normal);
	v_normal = normal;
	v_uv = uv;
	v_color = i_color;
	v_shape = i_shape;
}
`, 
`#version 330
precision mediump float;

in vec4 v_color;
in vec2 v_uv;
in vec3 v_normal;
in float v_shape;
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
    //gl_FragColor = vec4(vNormal*0.5+0.5, 1.);

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
let geomcube = glutils.makeCube();
// either need a sub-divided cube here, or else need to use a df shader

let cube = glutils.createVao(gl, geomcube, cubeprogram.id);

let cubeInstanceFields = [
	{ 
		name: "i_pos",
		components: 4,
		type: gl.FLOAT,
		byteoffset: 0*4 // *4 for float32
	},
	{ 
		name: "i_quat",
		components: 4,
		type: gl.FLOAT,
		byteoffset: 4*4 // *4 for float32
	},
	{ 
		name: "i_scale",
		components: 3,
		type: gl.FLOAT,
		byteoffset: 8*4 // *4 for float32
	},
	{ 
		name: "i_shape",
		components: 1,
		type: gl.FLOAT,
		byteoffset: 11*4 // *4 for float32
	},
	{ 
		name: "i_color",
		components: 4,
		type: gl.FLOAT,
		byteoffset: 12*4 // *4 for float32
	},
] 
let cubeInstanceByteStride = cubeInstanceFields[cubeInstanceFields.length-1].byteoffset + cubeInstanceFields[cubeInstanceFields.length-1].components*4 // *4 for float32
let cubeInstanceStride = cubeInstanceByteStride / 4; // 4 bytes per float
// create some instances:
let cubeInstanceTotal = 10;
let cubeInstanceData = new Float32Array(cubeInstanceStride * cubeInstanceTotal)

// a friendlier JS interface to the underlying data:
let cubeInstances = []
// iterate over each instance
for (let i=0; i<cubeInstanceTotal; i++) {
	let b = i*cubeInstanceByteStride;
	// make a  interface for this:
	let obj = {
		index: i,
		byteoffset: b,
	}
	for (let i in cubeInstanceFields) {
		let field = cubeInstanceFields[i];
		obj[field.name] = new Float32Array(cubeInstanceData.buffer, b + field.byteoffset, field.components)
	}
	cubeInstances = obj;

	obj.i_pos[0] = (Math.random() - 0.5) * 2;
	obj.i_pos[1] = (Math.random() - 0.5) + 1;
	obj.i_pos[2] = (Math.random() - 0.5) * 2;
	quat.random(obj.i_quat);
	obj.i_shape[0] = 1; //Math.random();
	obj.i_scale[1] = 0.2;
	obj.i_scale[0] = obj.i_shape[0] > 0.5 ? obj.i_scale[1] : 0.5;
	obj.i_scale[2] = 0.03;
	obj.i_color[0] = Math.random()
	obj.i_color[1] = Math.random()
	obj.i_color[2] = Math.random()
	obj.i_color[3] = 1
}

let cubeInstanceBuffer = gl.createBuffer()
gl.bindBuffer(gl.ARRAY_BUFFER, cubeInstanceBuffer)
gl.bufferData(gl.ARRAY_BUFFER, cubeInstanceData, gl.DYNAMIC_DRAW)
cube.bind().setAttributes(cubeInstanceBuffer, cubeInstanceByteStride, cubeInstanceFields, true).unbind()


let cloudprogram = glutils.makeProgram(gl, 
`#version 330
uniform mat4 u_modelmatrix;
uniform mat4 u_viewmatrix;
uniform mat4 u_projmatrix;
uniform float u_pixelSize;
in vec3 a_position;
out vec4 v_color;


void main() {
	// Multiply the position by the matrix.
	vec4 worldspace = u_modelmatrix * vec4(a_position.xyz, 1);
	vec4 viewspace = u_viewmatrix * worldspace;
	float viewdist = length(viewspace.xyz);
	gl_Position = u_projmatrix * viewspace;
	if (gl_Position.w > 0.0) {
		gl_PointSize = u_pixelSize / gl_Position.w;
	} else {
		gl_PointSize = 0.0;
	}

	v_color = vec4(worldspace.xyz * 0.5 + 0.5, 0.5);
	v_color = mix(v_color, vec4(1.), 0.95);

	// fade for near clip:
	float fade = min(max((viewdist-0.25)/0.25, 0.), 1.);
	// for distance:
	fade *= 1. - sqrt(viewdist) * 0.1 * 0.05;
	v_color.a *= fade;

}
`,
`#version 330
precision mediump float;

in vec4 v_color;
out vec4 outColor;

void main() {
	// get normalized -1..1 point coordinate
	vec2 pc = (gl_PointCoord - 0.5) * 2.0;
	// convert to distance:
	float dist = max(0., min(1., 0.1 + 1.5*(1.0 - length(pc))));
	// paint
	outColor = vec4(dist) * v_color;
}
`);

const NUM_POINTS = 1e6;
const points = [];
for (let index = 0; index < NUM_POINTS; index++) {
  points.push((Math.random() - 0.5) * 100);
  points.push((Math.random() - 0.5) * 100);
  points.push((Math.random() - 0.5) * 100);
}
let cloud = glutils.createVao(gl, { vertices: points }, cloudprogram.id);


// Create a buffer.
let vertices = new Float32Array(points);
let buffer = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buffer);
gl.bufferData(gl.ARRAY_BUFFER, vertices, gl.DYNAMIC_DRAW);

// Create set of attributes
let vao = gl.createVertexArray();
gl.bindVertexArray(vao);

// tell the position attribute how to pull data out of the current ARRAY_BUFFER
let positionLocation = gl.getAttribLocation(cloudprogram.id, "a_position");
gl.enableVertexAttribArray(positionLocation);
let elementsPerVertex = 3; // for vec2
let normalize = false;
let stride = 0;
let offset = 0;
gl.vertexAttribPointer(positionLocation, elementsPerVertex, gl.FLOAT, normalize, stride, offset);

assert(vr.connect(true), "vr failed to connect");
vr.update()
let vrdim = [vr.getTextureWidth(), vr.getTextureHeight()]
let fbo = glutils.makeFboWithDepth(gl, vrdim[0], vrdim[1])










function reflowNodes(scene, parent) {
	let children = []
	for (let name in parent) {
		if (name == "_props") continue;
		let node = reflowNode(scene, parent[name], name, parent);
		if (node) children.push(node)
	}
	return children;
}

function reflowNode(scene, node, id, parent) {
	let props = node._props || {}
	console.log("reflowNode", id, props);

	// create objects to add to the scene
	// depends on props.kind special cases
	// depends on how many children it has (we don't necessarily know that yet)

	// recurse to create child nodes so we know how to lay them out:
	let children = reflowNodes(scene, node);

	// ok, if we have props.pos, we can create a box for it:
	if (props.pos) {

	}
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

	// handle scene changes from server:
    if (incomingDeltas.length > 0) {
        // handle incoming deltas:
        while (incomingDeltas.length > 0) {
            let delta = incomingDeltas.shift();
            // TODO: derive which world to add to:
            try {
                got.applyDeltasToGraph(localGraph, delta);
			} catch (e) {
				console.warn(e);
			}

            //enactDelta(ghostWorld, delta);
            //log("incoming deltas")
        }
		console.log("updated localGraph", JSON.stringify(localGraph, null, "  "))


		// // handle incoming deltas:
		// while (localDeltas.length > 0) {
        //     let delta = localDeltas.shift();
        //     // TODO: derive which world to add to:
        //     enactDelta(ghostMenu, delta);
        // }

		// rebuild scene:
		let scene = {}
		reflowNodes(scene, localGraph.nodes)
        // // re-layout:
        // updateDirty(ghostScene, false);

        // // TODO: delete once cables are instanced:
        // updateDirty(scene, false);
    }

	let t1 = glfw.getTime();
	let dt = t1-t;
	fps += 0.1*((1/dt)-fps);
	t = t1;
	glfw.setWindowTitle(window, `fps ${fps}`);


	// // update scene:
	// for (let i=0; i<NUM_POINTS/10; i++) {
	// 	let idx = Math.floor(Math.random() * vertices.length);
	// 	vertices[idx] += (Math.random()-0.5) * 0.01;
	// }
	// // update GPU buffers:
	// gl.bindBuffer(gl.ARRAY_BUFFER, buffer);
	// gl.bufferData(gl.ARRAY_BUFFER, vertices, gl.DYNAMIC_DRAW);

	//if(wsize) console.log("FB size: "+wsize.width+', '+wsize.height);
	vr.update();
	
	// render to our targetTexture by binding the framebuffer
    gl.bindFramebuffer(gl.FRAMEBUFFER, fbo.id);
	{
		gl.viewport(0, 0, fbo.width, fbo.height);
		gl.enable(gl.DEPTH_TEST)
		gl.depthMask(true)
		gl.clearColor(0, 0, 0, 1);
		gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);

		for (let i=0; i<2; i++) {
			gl.viewport(i * fbo.width/2, 0, fbo.width/2, fbo.height);

			// Compute the matrix
			let viewmatrix = mat4.create();
			//mat4.lookAt(viewmatrix, [0, 0, 3], [0, 0, 0], [0, 1, 0]);
			vr.getView(i, viewmatrix);

			let projmatrix = mat4.create();
			//mat4.perspective(projmatrix, Math.PI/2, fbo.width/fbo.height, 0.01, 10);
			vr.getProjection(i, projmatrix);

			let modelmatrix = mat4.create();
			let axis = vec3.fromValues(Math.sin(t), 1., 0.);
			vec3.normalize(axis, axis);
			//mat4.rotate(modelmatrix, modelmatrix, t, axis)


			gl.enable(gl.BLEND);
			gl.blendFunc(gl.SRC_ALPHA, gl.ONE);
			gl.depthMask(false)

			cubeprogram.begin();
			cubeprogram.uniform("u_modelmatrix", modelmatrix);
			cubeprogram.uniform("u_viewmatrix", viewmatrix);
			cubeprogram.uniform("u_projmatrix", projmatrix);
			cube.bind().drawInstanced(cubeInstanceTotal).unbind()
			cubeprogram.end();

			// cloudprogram.begin();
			// cloudprogram.uniform("u_modelmatrix", modelmatrix);
			// cloudprogram.uniform("u_viewmatrix", viewmatrix);
			// cloudprogram.uniform("u_projmatrix", projmatrix);
			// cloudprogram.uniform("u_pixelSize", fbo.height/50);
			// //cloud.bind().drawPoints().unbind();

			// // Bind the attribute/buffer set we want.
			// gl.bindVertexArray(vao);
			// // Draw the geometry.
			// let count = NUM_POINTS;
			// gl.drawArrays(gl.POINTS, 0, count);
			// gl.bindVertexArray(null);
			// cloudprogram.end();


			gl.disable(gl.BLEND);
			gl.depthMask(true)
		}
	}
	gl.bindFramebuffer(gl.FRAMEBUFFER, null);

	vr.submit(fbo.colorTexture)

	// Get window size (may be different than the requested size)
	let dim = glfw.getFramebufferSize(window);
	gl.viewport(0, 0, dim[0], dim[1]);
	gl.enable(gl.DEPTH_TEST)
	gl.depthMask(true)
	gl.clearColor(0.2, 0.2, 0.2, 1);
	gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);

	// render the cube with the texture we just rendered to
    gl.bindTexture(gl.TEXTURE_2D, fbo.colorTexture);
	quadprogram.begin();
	quadprogram.uniform("u_scale", 1, 1);
	quad.bind().draw().unbind();
	quadprogram.end();

	// Swap buffers
	glfw.swapBuffers(window);
	glfw.pollEvents();

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
	serverConnect();
}

function shutdown() {
	console.log("shutdown")
	vr.connect(false)
	glfw.destroyWindow(window);
	glfw.terminate();
	socket.terminate();
	process.exit(0)
}

init();