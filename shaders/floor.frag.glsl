#version 330
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
	outColor = vec4(clamp(0.3-0.2*floor(d)/10., 0., 1.));

	vec2 checks = floor(mod(v_xz, 1.) + alpha);
	float q = checks.x * checks.y;
	outColor = vec4(q);

	float c = floor(0.5-length(mod(v_xz, 1.)-0.5) + alpha);
	outColor = vec4(c);

	//outColor = vec4(fibonacci(v_xz / 64., 0., 100.));

	outColor *= 0.3;
	outColor *= alpha;

}