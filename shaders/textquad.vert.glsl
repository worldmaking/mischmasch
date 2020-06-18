#version 330
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