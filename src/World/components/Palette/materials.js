import { MeshStandardMaterial } from 'three';

function createMaterials() {
  const panel = new MeshStandardMaterial({
    color: '#ff5c33',
    flatShading: true,
  });

  const jackIn = new MeshStandardMaterial({
    color: 'skyblue',
    flatShading: true,
    opacity: 0.5,
    side: 'doubleside'
  });

  const jackOut = new MeshStandardMaterial({
    color: 'darkslategray',
    flatShading: true,
    opacity: 0.5,
  });

  return { panel, jackIn, jackOut };
}

export { createMaterials };