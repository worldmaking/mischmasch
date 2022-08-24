import { PlaneGeometry, MeshBasicMaterial, Mesh } from 'three'

class Floor{
  constructor( ){
    this.floor = new Mesh(
      new PlaneGeometry(10,10, 10,10),
      //!if the floor isn't sized right, it is making me feel sick!
      new MeshBasicMaterial({color:0xffffff, wireframe:false})
    );
    this.floor.rotation.x -= Math.PI / 2; // Rotate the floor 90 degrees
    

  }
}

export { Floor }