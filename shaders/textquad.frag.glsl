#version 330
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