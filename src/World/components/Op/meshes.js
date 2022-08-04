import { Mesh } from 'three';

import { createGeometries } from './geometries.js';
import { createMaterials } from './materials.js';
import {Text} from 'troika-three-text'
// todo: see https://www.npmjs.com/package/troika-three-text#preloading for optimizing text loading

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

    const opName = new Text();
    opName.text = 'Hello world!'
    opName.fontSize = 0.2
    opName.color = 'white'
    opName.position.set(-0.5, 1, 0.2);
    opName.rotation.set(1.55, 1, 0)

    

  return {
    panel,
    jackIn,
    jackOut,
    opName
  };
}

export { createMeshes };
