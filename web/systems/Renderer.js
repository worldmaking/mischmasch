import { WebGLRenderer } from 'three';
import { module_program } from '../assets/shaders.js'

class Renderer {
  constructor(){
    this.r = new WebGLRenderer({ antialias: true });

    this.r.setPixelRatio(window.devicePixelRatio);
    // make it fill the page
    this.r.setSize(window.innerWidth, window.innerHeight);
  }


}

export { Renderer }