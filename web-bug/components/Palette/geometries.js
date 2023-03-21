import { BoxGeometry, CylinderGeometry } from 'three';

function createGeometries(numInputs) {
  let panelWidth = numInputs * 2
  
  const panel = new BoxGeometry(panelWidth, 2, 0.3);

  const jack = new CylinderGeometry(0.2, 0.2, 0.1, 50);



  return {
    panel,
    jack
  };
}

export { createGeometries };
