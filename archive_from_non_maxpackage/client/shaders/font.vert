
varying vec4 v_color;
varying vec2 v_texCoord;

void main() {
    gl_Position = projectionMatrix * modelViewMatrix * vec4(position, 1.);
    v_texCoord = uv;
    v_color = vec4(1.);
}