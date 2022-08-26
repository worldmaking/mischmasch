import { BufferGeometry, CylinderGeometry } from 'three';

class CableGeometry{
  constructor(){

  }

  makeCord(fromPos, toPos){
    const cord = new BufferGeometry().setFromPoints( [ fromPos, toPos ] );
    return cord
  }
  makePlug(){
    const plug = new CylinderGeometry( 0.2, 0.2, 0.6, 64 )
    return plug
  }
}


export { CableGeometry };
