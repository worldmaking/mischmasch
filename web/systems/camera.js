import { PerspectiveCamera } from "three";

class Camera {

  constructor(){
    this.camera = new PerspectiveCamera(
      75,  // this camera has a 75 degree field of view in the vertical axis
      window.innerWidth / window.innerHeight, // the aspect ratio matches the size of the window
      0.05, // anything less than 5cm from the eye will not be drawn
      100  // anything more than 100m from the eye will not be drawn
  );

  // position the camera 2m in the Z axis and 1.5m in the Y axis
  // the Y axis points up from the ground
  // the Z axis point out of the screen toward you
  this.camera.position.y = 1.5;
  this.camera.position.z = 2;
  }
}

export { Camera };