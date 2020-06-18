#version 330
precision mediump float;
in vec2 v_xz;
in vec2 v_uv;
out vec4 outColor;

void main() {
	float alpha = 1.-length(v_uv);
	float soft = 0.02;
	
	vec2 grid = smoothstep(soft, -soft, abs(mod(v_xz, 1.) - 0.5));
	outColor = vec4(length(grid) * alpha);
}