#version 330
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
}