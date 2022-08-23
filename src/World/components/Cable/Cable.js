import { BufferGeometry, Line, LineBasicMaterial, Vector3 } from 'three'


class Cable{
    constructor ( type, jackOne, jackTwo, controllerName ){
        this.jackOne = jackOne;
        this.jackTwo = jackTwo;
        
        switch( type ){
            case 'partial':
                let parentOp = this.jackOne.object.parent;
                let fromPos = parentOp.localToWorld(new Vector3(this.jackOne.object.position.x, this.jackOne.object.position.y, (this.jackOne.object.position.z + 0.2)));
            
                let partialGeometry = new BufferGeometry().setFromPoints( [ fromPos, this.jackTwo ] );
                this.cable = new Line(partialGeometry, new LineBasicMaterial({ color: 0x888888 }));

                this.cable.name = `partial_cable___src:_${parentOp.name}`
                this.cable.userData.status = 'oneJack';
                this.cable.userData.src = jackOne
                this.cable.userData.controller = controllerName;
            break;

            case 'complete':
                let jacks = [jackOne, jackTwo]
                let src, dest;
                for (let i = 0; i < 2; i++){
                    if(jacks[i].object.name.split('_')[0] === 'outlet'){
                        src = jacks[i]
                    } else if (jacks[i].object.name.split('_')[0] === 'inlet'){
                        dest = jacks[i]
                    } else {
                        console.log('error in cable connection, incorrect UI selected: ', jacks[i])
                    }
                }

                // get parent ops of src and dest jacks
                let srcParentOp = src.object.parent
                let destParentOp = dest.object.parent
                // get world positioning of jacks relative to their parents
                let srcPos = srcParentOp.localToWorld( new Vector3( src.object.position.x, src.object.position.y, ( src.object.position.z + 0.2 ) ) )
                let destPos = destParentOp.localToWorld (new Vector3( dest.object.position.x, dest.object.position.y, ( dest.object.position.z + 0.2 ) ) )    

                let completeGeometry = new BufferGeometry().setFromPoints( [ srcPos, destPos ] );
                this.cable = new Line( completeGeometry, new LineBasicMaterial( { color: 0x888888 } ) );
                this.cable.name = `cable___src:_${src.object.name}___dest:${dest.object.name}`
                this.cable.userData.status = 'full_cable';
                this.cable.userData.src = src
                this.cable.userData.dest = dest
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