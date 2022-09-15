import { BufferGeometry, Line, LineBasicMaterial, Vector3 } from 'three'
import { NewCable } from './NewCable.js'

class Cable{
    constructor ( type, jackOne, jackTwo, controllerName ){
        this.jackOne = jackOne;
        this.jackTwo = jackTwo;
        switch( type ){
            case 'partial':
                let parentOp = this.jackOne.parent;
                let fromPos = parentOp.localToWorld(new Vector3(this.jackOne.position.x, this.jackOne.position.y, (this.jackOne.position.z + 0.2)));
            
                // let partialGeometry = new BufferGeometry().setFromPoints( [ fromPos, this.jackTwo ] );
                this.cable = new NewCable(fromPos, this.jackTwo)
                // let cordGeometry = this.geometry.makeCord(fromPos, this.jackTwo)
                // let plugGeometry = this.geometry.makePlug()
                // this.cable = new Line(cordGeometry, new LineBasicMaterial({ color: 0x888888 }));

                this.cable.name = `partial_cable___src:_${parentOp.name}`
                this.cable.userData.status = 'partial';
                this.cable.userData.src = jackOne
                this.cable.userData.controller = controllerName;
            break;

            case 'complete':
                // get parent ops of src and dest jacks
                let srcParentOp = jackOne.parent
                let destParentOp = jackTwo.parent
                // get world positioning of jacks relative to their parents
                let srcPos = srcParentOp.localToWorld( new Vector3( jackOne.position.x, jackOne.position.y, ( jackOne.position.z + 0.2 ) ) )
                let destPos = destParentOp.localToWorld (new Vector3( jackTwo.position.x, jackTwo.position.y, ( jackTwo.position.z + 0.2 ) ) )    

                // let completeGeometry = new BufferGeometry().setFromPoints( [ srcPos, destPos ] );
                // this.cable = new Line( completeGeometry, new LineBasicMaterial( { color: 0x888888 } ) );

                this.cable = new NewCable(srcPos, destPos)
                this.cable.name = `cable___src:_${jackOne.name}___dest:${jackTwo.name}`

                this.cable.userData.status = 'complete';
                this.cable.userData.src = jackOne
                this.cable.userData.dest = jackTwo
            break;
        }


        

    }

}
 
export { Cable }


/* //! previous work. 
import { LineGeometry } from 'three/examples/jsm/lines/LineGeometry.js';
import { LineMaterial } from 'three/examples/jsm/lines/LineMaterial.js';
import { Line2 } from 'three/examples/jsm/lines/Line2.js';
import * as GeometryUtils from 'three/examples/jsm/utils/GeometryUtils.js';
let line, matLine;
import {CatmullRomCurve3, Vector3, Color} from 'three'

constructor(fromPosition, toPosition){
        const positions = [];
        const colors = [];

        // const points = GeometryUtils.hilbert3D( new Vector3( 0, 0, 0 ), 20.0, 1, 0, 1, 2, 3, 4, 5, 6, 7 );
        // calculate a mid-point in the cable
        let midPoint = new Vector3().lerpVectors(fromPosition, toPosition, 0.5)
        // try stretching the midpoint outward
        midPoint.setZ += 0.2
        midPoint.setY += 0.2

        // ensure 
        let points = [fromPosition, midPoint,
            toPosition]
        const spline = new CatmullRomCurve3( points, 0, 'catmullrom', 0.01  );
        
        const divisions = Math.round( 12 * points.length );
        const point = new Vector3();
        const color = new Color();
        // rainbow colouring
        for ( let i = 0, l = divisions; i < l; i ++ ) {

            const t = i / l;

            spline.getPoint( t, point );
            positions.push( point.x, point.y, point.z );

            color.setHSL( t, 1.0, 0.5 );
            colors.push( color.r, color.g, color.b );

        }


        // Line2 ( LineGeometry, LineMaterial )

        const geometry = new LineGeometry();
        geometry.setPositions( positions );
        geometry.setColors( colors );

        matLine = new LineMaterial( {

            color: 0xffffff,
            linewidth: 0.1, // in world units with size attenuation, pixels otherwise
            vertexColors: true,

            //resolution:  // to be set by renderer, eventually
            dashed: false,
            alphaToCoverage: true,
            worldUnits: true

        } );

        line = new Line2( geometry, matLine );
        line.computeLineDistances();
        // line.scale.set( 1, 1, 1 );
        // scene.add( line );
        this.line = line
    }
*/