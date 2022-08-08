import { Mesh } from 'three';

import { createGeometries } from './geometries.js';
import { createMaterials } from './materials.js';
import {Text} from 'troika-three-text'
// todo: see https://www.npmjs.com/package/troika-three-text#preloading for optimizing text loading

function createMeshes(opProps) {
  const geometries = createGeometries();
  const materials = createMaterials();
  let panelGeometry;
  let inputJacks = []
  let inputLabels = []
  // does it have inputs?
  if(opProps.inputs){
    let inputs = opProps.inputs
    let inputNames = Object.keys(inputs)
    let numInputs = inputNames.length
    
    // loop through inputs and create the inlets aand labels for this op
    // //

    inputNames.forEach(inputName => {
      // jacks
      let jackIn = new Mesh(geometries.jack, materials.jackIn);
      let posX = inputNames.indexOf(inputName) + -0.5
      jackIn.position.set(posX, 1.8, 0.2);
      jackIn.rotation.set(1.55, 1, 0)
      jackIn.name = `inlet_${inputName}_${jackIn.uuid}`
      // each jack needs a cable connection mesh in front. 
      let cableConnector = new Mesh(geometries.cableConnector, materials.cableConnector);
      cableConnector.position.set(posX, 2, 0.2);
      cableConnector.rotation.set(1.55, 1, 0)
      cableConnector.name = `cableConnector_${inputName}_${cableConnector.uuid}`
      // add the cableConnector to the jack inlet
      console.log(cableConnector)
      jackIn.add(cableConnector)

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
    panelGeometry = createGeometries(numInputs);
  } else {
    // op has no inputs, set panel width to 2
    panelGeometry = createGeometries(1);
  }
  

  // panel width depends on number of UI elements. for now it's only inlets
  
  const panel = new Mesh(panelGeometry.panel, materials.panel);
  panel.position.set(0, 1.4, 0);
  panel.rotation.set(0, 0, 0)
  panel.name = `panel_${opProps.op}_${panel.uuid}`


  const jackOut = new Mesh(geometries.jack, materials.jackOut);
  jackOut.position.set(0, 1, 0.2);
  jackOut.rotation.set(1.55, 1, 0)
  jackOut.name = `outlet_${opProps.op}_${jackOut.uuid}`
  // output jack needs a cable connection mesh in front. 
  let jackOutConnector = new Mesh(geometries.cableConnector, materials.jackOutConnector);
  jackOutConnector.position.set(0, 1.2, 0.2);
  jackOutConnector.rotation.set(1.55, 1, 0)
  jackOutConnector.name = `jackOutConnector_${opProps.op}_${jackOutConnector.uuid}`
  // add the cableConnector to the jackOut
  jackOut.add(jackOutConnector)


  let outputLabel = new Text();
  if(opProps.outputs[0]){
    outputLabel.text = opProps.outputs[0].label
  } else {
    outputLabel.text = opProps.op + '_out'

  }
  outputLabel.fontSize = 0.2
  outputLabel.color = 'white'
  outputLabel.anchorX = 'left'
  outputLabel.position.set(-0.3, 0.8, 0.2);
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
