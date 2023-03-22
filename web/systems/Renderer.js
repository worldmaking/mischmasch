import { WebGLRenderer } from 'three';
import { module_program, fbo_program, floor_program, wand_program, line_program, ray_program, textquad_program, debug_program } from '../assets/shaders.js'
import * as glutils from '../utilities/glutils.js'
import { systemSettings } from '../settings/systemSettings.js'

class Renderer {
  constructor(){
    this.r = new WebGLRenderer({ antialias: true });
    // apply an id to the dom Element
    this.r.domElement.id = 'mischmaschCanvas'
    
    // get the gl context
    this.r.gl = this.r.domElement.getContext("webgl2");

    this.r.setPixelRatio(window.devicePixelRatio);
    // make it fill the page
    this.r.setSize(window.innerWidth, window.innerHeight);
    this.r.textquad_geom = glutils.makeQuad({ min:0., max:1, div:8 });
    // module geometry
    this.r.module_geom = glutils.makeCube({ 
      min:[-1,-1, 0], 
      max:[ 1, 1, 1], 
      div: [13, 13, 1] 
    });
    //! this is older code, probably will want to remove this. see 'renderer.wand_geom' in initRenderer that uses the obj files 
    this.r.wand_geom = glutils.makeCube({ 
      	min:[-0.03,-0.03, 0], 
      	max:[ 0.03, 0.03, 0.1], 
      	div: [13, 13, 1] 
      });

    this.r.line_geom = glutils.makeLine({ min:0, max:1, div: 24 });
    const floor_m = 6;
    this.r.floor_geom = glutils.makeQuad({ min: -floor_m, max: floor_m, div:8 });
    this.r.debug_geom = glutils.makeCube({min:-0.01, max:0.01});
    // glsl programs
    this.r.fbo_program = fbo_program;
    this.r.floor_program = floor_program;
    this.r.wand_program = wand_program;
    this.r.line_program = line_program;
    this.r.ray_program = ray_program;
    this.r.textquad_program = textquad_program;
    this.r.debug_program = debug_program;

    // Global GL Resources
    this.r.floor_vao = glutils.createVao(this.r.gl, this.r.floor_geom, this.r.floor_program.id);
    this.r.debug_vao = glutils.createVao(this.r.gl, this.r.debug_geom, this.r.debug_program.id);
    this.r.fbo_vao = glutils.createVao(this.r.gl, glutils.makeQuad(), this.r.fbo_program.id);
    this.r.fbo = glutils.makeFboWithDepth(this.r.gl, systemSettings.vrdim[0], systemSettings.vrdim[1])

  }
}

export { Renderer }