import { GLSL3 } from 'three';
import { systemSettings } from '../settings/systemSettings.js'

const module_program = {
  uniforms: null,
  glslVersion: GLSL3,
  vertexColors: true,
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
  fragmentShader: 
  `precision mediump float;
  
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
}

const fbo_program = {
  uniforms: null,
  glslVersion: GLSL3,
  vertexColors: true,
  vertexShader: `in vec4 a_position;
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
  fragmentShader: 
  `precision mediump float;
  uniform sampler2D u_tex;
  in vec2 v_texCoord;
  out vec4 outColor;

  void main() {
    outColor = vec4(v_texCoord, 0., 1.);
    outColor = texture(u_tex, v_texCoord);
  }`
}

const floor_program = {
  uniforms: null,
  glslVersion: GLSL3,
  vertexColors: true,
  vertexShader: `
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
  }`
  ,
  fragmentShader: 
  `precision mediump float;
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
}

const wand_program = {
  uniforms: null,
  glslVersion: GLSL3,
  vertexColors: true,
  vertexShader: 
  `//uniform mat4 u_modelmatrix;
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
  }`
  ,
  fragmentShader: 
  `precision mediump float;

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
 
}
const line_program = {
  uniforms: null,
  glslVersion: GLSL3,
  vertexColors: true,
  vertexShader: 
  `uniform mat4 u_viewmatrix;
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
  }`
  ,
  fragmentShader: 
  `precision mediump float;

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
}
const ray_program = {
  uniforms: null,
  glslVersion: GLSL3,
  vertexColors: true,
  vertexShader: 
  `uniform mat4 u_viewmatrix;
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
		}`
  ,
  fragmentShader: 
  `precision mediump float;
		
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
}

const textquad_program = {
  uniforms: null,
  glslVersion: GLSL3,
  vertexColors: true,
  vertexShader:
  `uniform mat4 u_viewmatrix;
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
  }` 
  ,
  fragmentShader: 
  `precision mediump float;
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
}
const debug_program = {
  uniforms: null,
  glslVersion: GLSL3,
  vertexColors: true,
  vertexShader: 
  `uniform mat4 u_viewmatrix;
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
  }`
  ,
  fragmentShader: 
  `precision mediump float;

  in vec4 v_color;
  out vec4 outColor;
  
  void main() {
    outColor = v_color;
  }`
 
}

export {
  module_program,
  fbo_program,
  floor_program,
  wand_program,
  line_program,
  ray_program,
  textquad_program,
  debug_program
}