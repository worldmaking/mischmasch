import { Mesh } from 'three';

import { createGeometries } from './geometries.js';
import { createMaterials } from './materials.js';

function createMeshes() {
    const geometries = createGeometries();
    const materials = createMaterials();

    const panel = new Mesh(geometries.panel, materials.panel);
    panel.position.set(0, 1.4, 0);
    panel.rotation.set(0, 0, 0)

    const jackIn = new Mesh(geometries.jack, materials.jackIn);
    jackIn.position.set(-0.5, 1.8, 0.2);
    jackIn.rotation.set(1.55, 1, 0)

    const jackOut = new Mesh(geometries.jack, materials.jackOut);
    jackOut.position.set(-0.5, 1, 0.2);
    jackOut.rotation.set(1.55, 1, 0)

//   const chimney = new Mesh(geometries.chimney, materials.detail);
//   chimney.position.set(-2, 1.9, 0);

//   const nose = new Mesh(geometries.nose, materials.body);
//   nose.position.set(-1, 1, 0);
//   nose.rotation.z = Math.PI / 2;

//   const smallWheelRear = new Mesh(geometries.wheel, materials.detail);
//   smallWheelRear.position.y = 0.5;
//   smallWheelRear.rotation.x = Math.PI / 2;

//   const smallWheelCenter = smallWheelRear.clone();
//   smallWheelCenter.position.x = -1;

//   const smallWheelFront = smallWheelRear.clone();
//   smallWheelFront.position.x = -2;

//   const bigWheel = smallWheelRear.clone();
//   bigWheel.position.set(1.5, 0.9, 0);
//   bigWheel.scale.set(2, 1.25, 2);

  return {
    panel,
    jackIn,
    jackOut
    // nose,
    // cabin,
    // chimney,
    // smallWheelRear,
    // smallWheelCenter,
    // smallWheelFront,
    // bigWheel,
  };
}

export { createMeshes };
