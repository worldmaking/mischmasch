import { BoxBufferGeometry, CylinderBufferGeometry } from 'three';
// import { FontLoader } from 'FontLoader'

// const loader = new FontLoader();

// const font = loader.load(	'../fonts/optimer_regular.typeface.json' )

function createGeometries() {
  const panel = new BoxBufferGeometry(2, 2, 0.3);

//   const nose = new CylinderBufferGeometry(0.75, 0.75, 3, 12);

//   // we can reuse a single cylinder geometry for all 4 wheels
  const jack = new CylinderBufferGeometry(0.2, 0.2, 0.1, 50);

  // const text = new TextGeometry( 'Hello three.js!', {
	// 	font: font,
	// 	size: 80,
	// 	height: 5,
	// 	curveSegments: 12,
	// 	bevelEnabled: true,
	// 	bevelThickness: 10,
	// 	bevelSize: 8,
	// 	bevelOffset: 0,
	// 	bevelSegments: 5
	// } );
//   // different values for the top and bottom radius creates a cone shape
//   const chimney = new CylinderBufferGeometry(0.3, 0.1, 0.5);

  return {
    panel,
    jack,
    // text
    // cabin,
    // nose,
    // wheel,
    // chimney,
  };
}

export { createGeometries };
