import { Mesh } from 'three';

import { createGeometries } from './geometries.js';
import { createMaterials } from './materials.js';
import {Text} from 'troika-three-text'
// todo: see https://www.npmjs.com/package/troika-three-text#preloading for optimizing text loading

function createMeshes(opProps) {
  const geometries = createGeometries();
  const materials = createMaterials();

  // get inputs
  let inputs = opProps.inputs
  let inputNames = Object.keys(inputs)
  let numInputs = inputNames.length
  
  // loop through inputs and create the inlets for this op
  let inputJacks = []
  inputNames.forEach(inputName => {
    let jackIn = new Mesh(geometries.jack, materials.jackIn);
    let posX = inputNames.indexOf(inputName) + -1
    jackIn.position.set(posX, 1.8, 0.2);
    jackIn.rotation.set(1.55, 1, 0)
    inputJacks.push(jackIn)
  })

  // panel width depends on number of UI elements. for now it's only inlets
  const panel = new Mesh(createGeometries(numInputs).panel, materials.panel);
  panel.position.set(0, 1.4, 0);
  panel.rotation.set(0, 0, 0)



  const jackOut = new Mesh(geometries.jack, materials.jackOut);
  jackOut.position.set(-0.5, 1, 0.2);
  jackOut.rotation.set(1.55, 1, 0)

  const op = new Text();
  op.text = opProps.op
  op.fontSize = 0.2
  op.color = 'white'
  op.anchorX = 'center'
  op.position.set(0, 2.3, 0.2);
  op.rotation.set(0, 0, 0)

    

  return {
    panel,
    inputJacks,
    jackOut,
    op
  };
}

export { createMeshes };
