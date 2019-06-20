precision highp float;
varying vec2 vUv;
varying vec4 vColor;
varying vec3 vNormal;

void main() {
    //gl_FragColor = vec4(vNormal*0.5+0.5, 1.);
    gl_FragColor = vColor * vec4(vUv, 0.5, 1.);

}