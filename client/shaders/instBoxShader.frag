#extension GL_OES_standard_derivatives : enable
precision highp float;
varying vec2 vUv;
varying vec4 vColor;
varying vec3 vNormal;
varying vec3 vScale;
//varying vec4 vEmission;

void main() {
    vec3 normal = normalize(vNormal);
    //gl_FragColor = vec4(vNormal*0.5+0.5, 1.);

    vec2 dxt = dFdx(vUv);
    vec2 dyt = dFdy(vUv);
    float line = length(abs(dxt)+abs(dyt));
    float line1 = clamp(line * 5.,0.25,0.75);

    vec2 v = vUv * 2. - 1.;
    vec2 v2 = smoothstep(1., 1.-line*8., abs(v));
    float line2 = 1.-(v2.x*v2.y);
    gl_FragColor = vColor * max(line1, line2) ; // this over exposes the color making it look brighter * vec4(4.);
}
