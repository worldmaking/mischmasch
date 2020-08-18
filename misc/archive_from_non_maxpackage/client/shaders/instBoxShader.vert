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
//attribute vec4 emission;
varying vec2 vUv;
varying vec4 vColor;
varying vec3 vNormal;
//varying vec4 vEmission;
varying vec3 vScale;

// http://www.geeks3d.com/20141201/how-to-rotate-a-vertex-by-a-quaternion-in-glsl/
vec3 applyQuaternionToVector( vec4 q, vec3 v ){
        return v + 2.0 * cross( q.xyz, cross( q.xyz, v ) + q.w * v );
}

void main() {
        vUv = uv;
        vNormal = normalize(normal);
        vec3 shapedPosition = position;
        // cylinder case:
        if (shape > 0.5) {
                shapedPosition.xy = normalize(shapedPosition.xy);
                vNormal.xy = normalize(mix(shapedPosition.xy, vec2(0.), abs(vNormal.z)));
                shapedPosition.xy *= 0.5;

                if (shape > 1.5) {
                        if (position.y > 0. && abs(position.x) < 0.1) {
                                shapedPosition.xy *= 1.2;    
                                vUv.x = mod(vUv.x + 0.5, 1.);
                        }
                }
        }
        vec3 vPosition = applyQuaternionToVector( orientation, shapedPosition * scale );
        vNormal = applyQuaternionToVector(orientation, vNormal);
        vColor = color;
        //vEmission = emission;
        vScale = scale;
        gl_Position = projectionMatrix * modelViewMatrix * vec4( location + vPosition, 1.0 );
}