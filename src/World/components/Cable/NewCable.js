import { BufferGeometry, Line, LineBasicMaterial, SphereGeometry, Vector3, Mesh,  MeshStandardMaterial, Group } from 'three'

class NewCable extends Group {
  constructor(fromPos, toPos){
    super();
    const cableColour = Math.random() * 0xffffff
    // create cable cord
    const cordGeometry = new BufferGeometry().setFromPoints( [ fromPos, toPos ] );
    const cordMaterial = new LineBasicMaterial({ color: cableColour })
    const line = new Line(cordGeometry, cordMaterial)
    this.name = 'cable'
    this.userData.status = 'partial'
    this.userData.src = 'object'
    this.userData.dest = 'object'
    this.userData.controller = 'controller_0'

    // create cable plugs
    const plugGeometry = new SphereGeometry( 0.08, 32, 32 )
    const plugMaterial = new MeshStandardMaterial( { color: cableColour, roughness: 0.7, metalness: 0.0 } )
    const plugOne = new Mesh(plugGeometry, plugMaterial)
    plugOne.position.set(fromPos.x, fromPos.y, fromPos.z)
    plugOne.rotation.set(0, 0, 1.57)
    plugOne.name = 'cable_plugOne'
    plugOne.userData.status = 'partial'
    plugOne.userData.src = 'object'
    plugOne.userData.controller = 'controller_0'
    const plugTwo = plugOne.clone()
    plugTwo.name = 'cable_plugTwo'
    plugTwo.userData.status = 'partial'
    plugTwo.userData.dest = 'object'
    plugTwo.userData.controller = 'controller_0'
    plugTwo.position.set(toPos.x, toPos.y, toPos.z)
    this.add(line, plugOne, plugTwo)
  }
}

export { NewCable }