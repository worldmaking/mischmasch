import { GUI } from 'three/examples/jsm/libs/lil-gui.module.min.js';

class UserSettings{
  constructor( stats ){
    this.gui = new GUI();
    this.gui.close()
    this.gui.title('User Settings')
    this.parameters = {
        // 'line type': 0,
        // 'world units': false,
        'Palette Distance': 40,
        'Cable Width': 5,
        'Controller Beam Colour': 0xffffff,
        'Controller Beam Width': 20,
        'Controller Beam Angle': -35,
        'Controller Vibration': true,
        'GPU Stats Window': false,
        'Module Rotation-X Speed': 0.05,
        'Module Distancer Speed': 0.2,
        'Floor Colour': 0xffffff,
        // 'dash scale': 1,
        // 'dash / gap': 1
    };
    this.stats = stats;
   
    this.gui.add( this.parameters, 'Palette Distance', 25, 50 ).onChange( function ( val ) {
        console.log('Palette Distance', val);
    } );

    this.gui.add( this.parameters, 'Cable Width', 1, 10 ).onChange( function ( val ) {
        console.log('Cable Width', val);
    } );

    this.gui.addColor( this.parameters, 'Controller Beam Colour' ).onChange( function ( val ) {
        console.log('beam colour', val)
    } );

    this.gui.add( this.parameters, 'Controller Beam Width', 5, 50 ).onChange( function ( val ) {
        console.log('Controller Beam Width', val)
    } );

    this.gui.add( this.parameters, 'Controller Beam Angle', -180, 180 ).onChange( function ( val ) {
        console.log('Controller Beam Angle', val)
    } );

    this.gui.add( this.parameters, 'Controller Vibration').onChange( function ( val ) {
        console.log('Controller Vibration', val)
    } );

    this.gui.add( this.parameters, 'GPU Stats Window').onChange( function ( val ) {
        if(val == true){
            document.body.appendChild( stats.dom );
            // stats.showPanel( 1 );
        } else {
            document.body.removeChild( stats.dom );
            // stats.showPanel( 0 );
        }
        
    } );

    this.gui.add( this.parameters, 'Module Rotation-X Speed', 0.02, 0.2 ).onChange( function ( val ) {
        console.log('Module Rotation-X Speed', val)
    } );

    this.gui.add( this.parameters, 'Module Distancer Speed', 0.05, 0.4 ).onChange( function ( val ) {
        console.log('Module Distancer Speed', val)
    } );
    

    this.gui.addColor( this.parameters, 'Floor Colour' ).onChange( function ( val ) {
        console.log('beam colour', val)
    } );

    // this.gui.add( this.parameters, 'line type', { 'LineGeometry': 0, 'gl.LINE': 1 } ).onChange( function ( val ) {

    //     switch ( val ) {

    //         case 0:
    //             line.visible = true;

    //             line1.visible = false;

    //             break;

    //         case 1:
    //             line.visible = false;

    //             line1.visible = true;

    //             break;

    //     }

    // } );

    // this.gui.add( this.parameters, 'dash scale', 0.5, 2, 0.1 ).onChange( function ( val ) {

    //     matLine.dashScale = val;
    //     matLineDashed.scale = val;

    // } );

    // this.gui.add( this.parameters, 'dash / gap', { '2 : 1': 0, '1 : 1': 1, '1 : 2': 2 } ).onChange( function ( val ) {

    //     switch ( val ) {

    //         case 0:
    //             matLine.dashSize = 2;
    //             matLine.gapSize = 1;

    //             matLineDashed.dashSize = 2;
    //             matLineDashed.gapSize = 1;

    //             break;

    //         case 1:
    //             matLine.dashSize = 1;
    //             matLine.gapSize = 1;

    //             matLineDashed.dashSize = 1;
    //             matLineDashed.gapSize = 1;

    //             break;

    //         case 2:
    //             matLine.dashSize = 1;
    //             matLine.gapSize = 2;

    //             matLineDashed.dashSize = 1;
    //             matLineDashed.gapSize = 2;

    //             break;

    //     }

    // } );

    

  }
}

export { UserSettings }