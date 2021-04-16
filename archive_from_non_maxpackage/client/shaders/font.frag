#extension GL_OES_standard_derivatives : enable

uniform sampler2D u_texture;
uniform float u_time;
uniform vec4 u_color;

varying vec4 v_color;
varying vec2 v_texCoord;

const float smoothing = 1.0/16.0;

float aastep(float threshold, float value) {
  #ifdef GL_OES_standard_derivatives
    float afwidth = length(vec2(dFdx(value), dFdy(value))) * 0.70710678118654757;
    return smoothstep(threshold-afwidth, threshold+afwidth, value);
  #else
    return step(threshold, value);
  #endif  
}

float median(float r, float g, float b) {
  return max(min(r, g), min(max(r, g), b));
}

void main() {
    // float distance = texture2D(u_texture, v_texCoord).a;
    // float alpha = aastep(.5, distance);

  //https://msdf-bmfont.donmccurdy.com/
  //https://lambdacube3d.wordpress.com/2014/11/12/playing-around-with-font-rendering/
    vec3 sample = texture2D(u_texture, v_texCoord).rgb;
    float sigDist = median(sample.r, sample.g, sample.b) - 0.5;
    float alpha = clamp(sigDist/fwidth(sigDist) + 0.5, 0.0, 1.0);

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


    gl_FragColor = vec4(v_color.rgb, alpha * v_color.a);
    //gl_FragColor = mix(vec4(1., 1., 1., 1.), vec4(0., .5, 1., 1.), alpha);
    //gl_FragColor = vec4(mix(1., 0., alpha));
}