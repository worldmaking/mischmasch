import { Color, Scene } from "three";

function createScene(sceneType) {
  const scene = new Scene();

  switch (sceneType){
    case 'world':
      scene.background = new Color('black');
    break
    case 'editor':
    case 'patch':
    break;
  }

  return scene;
}

export { createScene };