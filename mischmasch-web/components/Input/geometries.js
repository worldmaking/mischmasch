import { BoxGeometry, CylinderGeometry } from 'three';

function createGeometries(numInputs) {
  let width = numInputs
  const panel = new BoxGeometry(width, 2, 0.3);

  const jack = new CylinderGeometry(0.2, 0.2, 0.1, 50);

  const cableConnector = new CylinderGeometry(0.2, 0.2, 0.1, 50);

  return {
    panel,
    jack,
    cableConnector
  };
}

export { createGeometries };
