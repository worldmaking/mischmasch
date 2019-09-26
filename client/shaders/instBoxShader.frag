precision highp float;
varying vec2 vUv;
varying vec4 vColor;
varying vec3 vNormal;
varying vec4 vEmission;

void main() {
    //gl_FragColor = vec4(vNormal*0.5+0.5, 1.);
    vec2 v = vUv * 2. - 1.;
    v = smoothstep(1., 0.9, abs(v));
    float border = v.x * v.y;
    gl_FragColor = vColor * border; // this over exposes the color making it look brighter * vec4(4.);

    //gl_FragColor = vColor;
}
