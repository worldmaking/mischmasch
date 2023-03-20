import { LineGeometry } from 'three/examples/jsm/lines/LineGeometry.js';
import { LineMaterial } from 'three/examples/jsm/lines/LineMaterial.js';
import { LineCurve3, TubeGeometry, MeshBasicMaterial, Mesh } from 'three';
import * as GeometryUtils from 'three/examples/jsm/utils/GeometryUtils.js';
let line, matLine;
import {CatmullRomCurve3, Vector3, Color} from 'three'


class Curve{
    constructor(fromPosition, toPosition){
        this.curve = new LineCurve3(fromPosition, toPosition)

        var path = new LineCurve3(fromPosition, toPosition)
        var tubegeometry = new TubeGeometry(path, 20, .2, 8, false);
        var material = new MeshBasicMaterial({ color: 0x0000ff });
        this.line = new Mesh(tubegeometry, material);

    }

}
 
export { Curve }