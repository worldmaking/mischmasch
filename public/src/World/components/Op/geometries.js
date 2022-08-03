import { BoxBufferGeometry, CylinderBufferGeometry } from 'three';

function createGeometries() {
  const panel = new BoxBufferGeometry(2, 2, 0.3);

//   const nose = new CylinderBufferGeometry(0.75, 0.75, 3, 12);

//   // we can reuse a single cylinder geometry for all 4 wheels
  const jack = new CylinderBufferGeometry(0.2, 0.2, 0.1, 50);

//   // different values for the top and bottom radius creates a cone shape
//   const chimney = new CylinderBufferGeometry(0.3, 0.1, 0.5);

  return {
    panel,
    jack
    // cabin,
    // nose,
    // wheel,
    // chimney,
  };
}

export { createGeometries };
