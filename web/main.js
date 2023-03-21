import { WebGLRenderer, Scene, BoxGeometry, RawShaderMaterial, ShaderMaterial, MeshStandardMaterial, Mesh, HemisphereLight, UniformsUtils, GLSL3, AmbientLight, UniformsLib, Color, ShaderLib } from 'three';
import { Camera } from './systems/camera.js'
import { Renderer } from './systems/Renderer.js' 

const UI_KNOB_ANGLE_LIMIT = Math.PI * 5./6.; // 7 o'clock through 5 o'clock

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

const uniforms = UniformsUtils.clone(ShaderLib.phong.uniforms)


const material = new ShaderMaterial( {

	uniforms: uniforms,
  lights: true,
  // glslVersion: 'THREE.GLSL3',
	vertexShader: `uniform mat4 u_viewmatrix;
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
  const float KNOB_ANGLE_LIMIT = ${UI_KNOB_ANGLE_LIMIT};
  
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
    v_color = i_color + (i_highlight*0.5);
  }`,
	fragmentShader:`precision mediump float;
  
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
  }`,
  glslVersion: GLSL3,
  vertexColors: true,

});

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

