precision highp float;
uniform mat4 modelViewMatrix;
uniform mat4 projectionMatrix;
attribute vec3 position;
attribute vec3 location;
attribute vec2 uv;
attribute vec4 orientation;
attribute vec3 scale;
attribute float shape;
attribute vec3 normal;
attribute vec4 color;
varying vec2 vUv;
varying vec4 vColor;
varying vec3 vNormal;

// http://www.geeks3d.com/20141201/how-to-rotate-a-vertex-by-a-quaternion-in-glsl/
vec3 applyQuaternionToVector( vec4 q, vec3 v ){
        return v + 2.0 * cross( q.xyz, cross( q.xyz, v ) + q.w * v );
}

void main() {

        vec3 shapedPosition = position;
        vNormal = normal; 

        // cylinder case:
        if (shape > 0.) {
                shapedPosition.xy = normalize(shapedPosition.xy);
                vNormal.xy = mix(shapedPosition.xy, vec2(0.), abs(vNormal.z));
        }
        vec3 vPosition = applyQuaternionToVector( orientation, shapedPosition * scale );
        vNormal = applyQuaternionToVector(orientation, vNormal);
        vUv = uv;
        vColor = color;
        gl_Position = projectionMatrix * modelViewMatrix * vec4( location + vPosition, 1.0 );
}