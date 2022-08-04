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
  
  // loop through inputs and create the inlets aand labels for this op
  let inputJacks = []
  let inputLabels = []
  inputNames.forEach(inputName => {
    // jacks
    let jackIn = new Mesh(geometries.jack, materials.jackIn);
    let posX = inputNames.indexOf(inputName) + -1
    jackIn.position.set(posX, 1.8, 0.2);
    jackIn.rotation.set(1.55, 1, 0)
    inputJacks.push(jackIn)

    // labels
    let inputLabel = new Text();
    inputLabel.text = inputName
    inputLabel.fontSize = 0.2
    inputLabel.color = 'white'
    inputLabel.anchorX = 'center'
    inputLabel.position.set(posX, 1.6, 0.2);
    inputLabel.rotation.set(0, 0, 0)
    inputLabels.push(inputLabel)
  })

  // panel width depends on number of UI elements. for now it's only inlets
  const panel = new Mesh(createGeometries(numInputs).panel, materials.panel);
  panel.position.set(0, 1.4, 0);
  panel.rotation.set(0, 0, 0)

  const jackOut = new Mesh(geometries.jack, materials.jackOut);
  jackOut.position.set(-1, 1, 0.2);
  jackOut.rotation.set(1.55, 1, 0)

  let outputLabel = new Text();
  outputLabel.text = opProps.outputs[0].label
  outputLabel.fontSize = 0.2
  outputLabel.color = 'white'
  outputLabel.anchorX = 'left'
  outputLabel.position.set(-1.2, 0.8, 0.2);
  outputLabel.rotation.set(0, 0, 0)
  

  const opLabel = new Text();
  opLabel.text = opProps.op
  opLabel.fontSize = 0.2
  opLabel.color = 'white'
  opLabel.anchorX = 'center'
  opLabel.position.set(0, 2.3, 0.2);
  opLabel.rotation.set(0, 0, 0)

    

  return {
    panel,
    inputJacks,
    inputLabels,
    jackOut,
    outputLabel,
    opLabel
  };
}

export { createMeshes };
