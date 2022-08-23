import { BufferGeometry, Line, LineBasicMaterial, Vector3 } from 'three'


class Cable{
    constructor ( type, source, destination, controllerName ){
        this.source = source;
        this.destination = destination;
        
        switch( type ){
            case 'partial':
                let parentOp = this.source.object.parent;
                let fromPos = parentOp.localToWorld(new Vector3(this.source.object.position.x, this.source.object.position.y, (this.source.object.position.z + 0.2)));
                
                const cablePoints = [];
                cablePoints.push(fromPos);
                cablePoints.push(this.destination);
            
                let geometry = new BufferGeometry().setFromPoints( cablePoints );
                this.cable = new Line(geometry, new LineBasicMaterial({ color: 0x888888 }));

                this.cable.name = `partial_cable___src:_${parentOp.name}`
                this.cable.userData.status = 'oneJack';
                this.cable.userData.src = source
                this.cable.userData.controller = controllerName;
            break;

            case 'full':

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