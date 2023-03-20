import { BoxBufferGeometry, CylinderBufferGeometry } from 'three';

function createGeometries(numInputs) {
  let panelWidth = numInputs * 2
  
  const panel = new BoxBufferGeometry(panelWidth, 2, 0.3);

  const jack = new CylinderBufferGeometry(0.2, 0.2, 0.1, 50);



  return {
    panel,
    jack
  };
}

export { createGeometries };
