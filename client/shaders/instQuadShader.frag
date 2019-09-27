#extension GL_OES_standard_derivatives : enable
precision highp float;
uniform sampler2D u_texture;
varying vec2 vUv;
//varying vec4 vColor;
varying vec3 vNormal;

const float smoothing = 1.0/16.0;

float median(float r, float g, float b) {
  return max(min(r, g), min(max(r, g), b));
}

float aastep(float threshold, float value) {
  #ifdef GL_OES_standard_derivatives
    float afwidth = length(vec2(dFdx(value), dFdy(value))) * 0.70710678118654757;
    return smoothstep(threshold-afwidth, threshold+afwidth, value);
  #else
    return step(threshold, value);
  #endif  
}


void main() {

    vec3 sample = texture2D(u_texture, vUv).rgb;
    float sigDist = median(sample.r, sample.g, sample.b) - 0.5;
    float alpha = clamp(sigDist/fwidth(sigDist) + 0.5, 0.0, 1.0);

    gl_FragColor = vec4(vUv, 0.5, 1.); 

    gl_FragColor = vec4(alpha);

    //float alpha = aastep(0.5 + 0.1*sin(u_time * 2. + v_texCoord.x * 100.), distance);
    //float alpha = smoothstep(0.5 - smoothing, 0.5 + smoothing, distance);

//    distance += 0.01*sin(u_time  *5.);
//     float alpha = 0.0;
//     float animValue = 0.1*sin(u_time  *2.);
//     float threshold = animValue * 0.5 + 0.5;
//     alpha += 0.15 * aastep(threshold, distance + 0.4 * sin(v_texCoord.x * 10.0 + u_time));
//     alpha += 0.35 * aastep(threshold, distance + 0.1 * sin(v_texCoord.y * 50.0 + u_time));
//     alpha -= 0.5 * aastep(threshold, distance);

//     alpha = max(alpha, 0.);
}
