import { Color, Scene } from "three";

function createScene(sceneType) {
  const scene = new Scene();

  switch (sceneType){
    case 'studio':
      scene.background = new Color('black');
    break
    case 'patch':
    break;
  }

  return scene;
}

export { createScene };