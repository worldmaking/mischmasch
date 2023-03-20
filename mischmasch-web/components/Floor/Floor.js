import { PlaneGeometry, MeshBasicMaterial, Mesh } from 'three'

class Floor{
  constructor(  ){
    this.floor = new Mesh(
      new PlaneGeometry(1000,1000, 1000,1000),
      //!if the floor isn't sized right, it is making me feel sick!
      new MeshBasicMaterial({color:0x666666, wireframe:true})
    );
    this.floor.rotation.x -= Math.PI / 2; // Rotate the floor 90 degrees
    
    this.floor.wireframe = true;
    
  }

}

export { Floor }