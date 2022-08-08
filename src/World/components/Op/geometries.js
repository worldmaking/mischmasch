import { BoxBufferGeometry, CylinderBufferGeometry } from 'three';

function createGeometries(numInputs) {
  let width = numInputs
  const panel = new BoxBufferGeometry(width, 2, 0.3);

  const jack = new CylinderBufferGeometry(0.2, 0.2, 0.1, 50);

  const cableConnector = new CylinderBufferGeometry(0.2, 0.2, 0.1, 50);

  return {
    panel,
    jack,
    cableConnector
  };
}

export { createGeometries };
