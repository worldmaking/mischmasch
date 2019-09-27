precision highp float;
uniform mat4 modelViewMatrix;
uniform mat4 projectionMatrix;
attribute vec3 position;
attribute vec3 location;
attribute vec2 uv;
attribute vec4 orientation;
attribute vec3 scale;
attribute vec3 normal;
attribute vec4 texcoord;
//attribute vec4 color;
varying vec2 vUv;
//varying vec4 vColor;
varying vec3 vNormal;

// http://www.geeks3d.com/20141201/how-to-rotate-a-vertex-by-a-quaternion-in-glsl/
vec3 applyQuaternionToVector( vec4 q, vec3 v ){
        return v + 2.0 * cross( q.xyz, cross( q.xyz, v ) + q.w * v );
}

void main() {
        vec3 shapedPosition = position;
        vNormal = normal; 

        vec3 vPosition = location + applyQuaternionToVector( orientation, shapedPosition * scale );
        vNormal = applyQuaternionToVector(orientation, vNormal);
        vUv = mix(texcoord.xy, texcoord.zw, uv);        
        //vColor = color;
        gl_Position = projectionMatrix * modelViewMatrix * vec4( vPosition, 1.0 );
}