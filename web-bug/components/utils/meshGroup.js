// this is just here to demo how to create a mesh group

import {
    SphereBufferGeometry,
    Group,
    MathUtils,
    Mesh,
    MeshStandardMaterial,
} from 'three'; 
    
function createMeshGroup() {
    const group = new Group();

    const geometry = new SphereBufferGeometry(0.25, 16, 16);
    const material = new MeshStandardMaterial({
        color: 'indigo',
    });
    // create sphere mesh 
    const protoSphere = new Mesh(geometry, material);

    // add the sphere to the group
    group.add(protoSphere);

    // create twenty clones of the protoSphere
    // and add each to the group
    for (let i = 0; i < 1; i += 0.009) {
        const sphere = protoSphere.clone();
        // position the spheres on around a circle
        sphere.position.x = Math.cos(2 * Math.PI * i);
        sphere.position.y = Math.sin(2 * Math.PI * i);

        // sphere.position.z = -i * 5; // this is beautiful
        // scale each cloned sphere
        sphere.scale.multiplyScalar(0.01 + i);
        group.add(sphere);
    }
    group.scale.multiplyScalar(2);

    // animation 
    const radiansPerSecond = MathUtils.degToRad(30);
    // each frame, rotate the entire group of spheres
    group.tick = (delta) => {
        group.rotation.z -= delta * radiansPerSecond;
    };

    return group;
}




export { createMeshGroup };