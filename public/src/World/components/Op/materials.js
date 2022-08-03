import { MeshStandardMaterial } from 'three';

function createMaterials() {
  const panel = new MeshStandardMaterial({
    color: 'firebrick',
    flatShading: true,
  });

  const jackIn = new MeshStandardMaterial({
    color: 'skyblue',
    flatShading: true,
  });

  const jackOut = new MeshStandardMaterial({
    color: 'darkslategray',
    flatShading: true,
  });

  return { panel, jackIn, jackOut };
}

export { createMaterials };