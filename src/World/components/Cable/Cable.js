import { CubicBezierCurve3, QuadraticBezierCurve3, Vector3, BufferGeometry, LineBasicMaterial, Line } from 'three'

class Cable{
    constructor(){
        // const curve = new QuadraticBezierCurve3(
        //     new Vector3( -10, 0, 0 ),
        //     new Vector3( 20, 15, 0 ),
        //     new Vector3( 10, 0, 0 )
        // );
        const curve = new CubicBezierCurve3(
            new Vector3( -10, 0, 0 ),
            new Vector3( -5, 15, 0 ),
            new Vector3( 20, 15, 0 ),
            new Vector3( 10, 0, 0 )
        );
        const points = curve.getPoints( 50 );
        const geometry = new BufferGeometry().setFromPoints( points );

        const material = new LineBasicMaterial( { color: 0xff0000 } );

        // Create the final object to add to the scene
        this.curveObject = new Line( geometry, material );
    }
}
 
export { Cable }