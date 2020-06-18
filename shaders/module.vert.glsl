#version 330
uniform mat4 u_viewmatrix;
uniform mat4 u_projmatrix;

// instance attrs:
in vec3 i_pos;
in vec4 i_quat;
in vec4 i_color;
in vec3 i_scale;
in float i_shape;
in float i_value;


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
	v_color = i_color;

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

	vertex *= i_scale.xyz;
	vertex = quat_rotate(i_quat, vertex);
	vertex = vertex + i_pos.xyz;
	// u_modelmatrix * 
	gl_Position = u_projmatrix * u_viewmatrix * vec4(vertex, 1);

	normal = quat_rotate(i_quat, normal);
	v_normal = normal;
	v_uv = uv;
	v_shape = i_shape;
}