import { BoxBufferGeometry, Mesh, MeshBasicMaterial } from 'https://cdn.skypack.dev/three@0.132.2';

function createCube(x, y, z) {
    // create a geometry
    const geometry = new BoxBufferGeometry(x, y, z);

    // create a default (white) Basic material
    const material = new MeshBasicMaterial();

    // create a Mesh containing the geometry and material
    const cube = new Mesh(geometry, material);

    return cube;
}

export { createCube };