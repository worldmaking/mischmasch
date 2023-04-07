import { WebGLRenderer } from 'three';
import { module_program, fbo_program, floor_program, wand_program, line_program, ray_program, textquad_program, debug_program } from '../assets/shaders.js'
import * as glutils from '../utilities/glutils.js'
import { systemSettings } from '../settings/systemSettings.js'
import { createShader, createProgram } from '../assets/makeProgram.js'

class Renderer{
  constructor(){
    this.renderer = new WebGLRenderer({
      antialias: true
    });
    this.renderer.domElement.id = 'mischmaschCanvas'
    this.renderer.gl = this.renderer.domElement.getContext('webgl2')
    
    this.renderer.setPixelRatio(window.devicePixelRatio);
    this.renderer.setSize(window.innerWidth, window.innerHeight);
    this.renderer.gl.viewport(0, 0, this.renderer.gl.canvas.width, this.renderer.gl.canvas.height);
    // assets
    this.renderer.textquad_geom = glutils.makeQuad({ min:0., max:1, div:8 });
    this.renderer.line_geom = glutils.makeLine({ min:0, max:1, div: 24 });
    const floor_m = 6;
    this.renderer.floor_geom = glutils.makeQuad({ min: -floor_m, max: floor_m, div:8 });
    this.renderer.debug_geom = glutils.makeCube({min:-0.01, max:0.01});
    // module geometry
    this.renderer.module_geom = glutils.makeCube({ 
      min:[-1,-1, 0], 
      max:[ 1, 1, 1], 
      div: [13, 13, 1] 
    });
    // wand geometry
    //! this is older code, probably will want to remove this. see 'renderer.wand_geom' in initRenderer that uses the obj files 
    this.renderer.wand_geom = glutils.makeCube({ 
      min:[-0.03,-0.03, 0], 
      max:[ 0.03, 0.03, 0.1], 
      div: [13, 13, 1] 
    });
    // glsl programs
    this.renderer.fbo_program = fbo_program;

    // this was my attempt at setting up the floor program. i followed this. https://webgl2fundamentals.org/webgl/lessons/webgl-fundamentals.html
    /*
    // setup floor program.
    // todo: export these to a file called floorProgram.js eventually (only once it works!)
    let floorV = createShader(this.renderer.gl, this.renderer.gl.VERTEX_SHADER, floor_program.vertexShader )
    let floorF = createShader(this.renderer.gl, this.renderer.gl.FRAGMENT_SHADER, floor_program.fragmentShader )
    this.renderer.floor_program = createProgram(this.renderer.gl, floorV, floorF)
    // get location of a_position attribute
    this.renderer.floor_program.positionAttributeLocation = this.renderer.gl.getAttribLocation(this.renderer.floor_program, "a_position")
    this.renderer.floor_program.positionBuffer = this.renderer.gl.createBuffer()
    this.renderer.gl.bindBuffer(this.renderer.gl.ARRAY_BUFFER, this.renderer.floor_program.positionBuffer);
    // add data into that buffer by referencing it through the bind point
    this.renderer.gl.bufferData(this.renderer.gl.ARRAY_BUFFER, new Float32Array([0, 0]), this.renderer.gl.STATIC_DRAW);
    // create a vao
    this.renderer.floor_vao = this.renderer.gl.createVertexArray()
    // make it the current vao so that attribute settings will be applied to it
    this.renderer.gl.bindVertexArray(this.renderer.floor_vao)
    // turn on the attribute
    this.renderer.gl.enableVertexAttribArray(this.renderer.floor_program.positionAttributeLocation)
    // specifiy how to pull data out
    this.renderer.gl.vertexAttribPointer(this.renderer.floor_program.positionAttributeLocation, 2, this.renderer.gl.FLOAT, false, 0, 0)
    // to webgl to use the shader program
    this.renderer.gl.useProgram(this.renderer.floor_program)
    // Bind the attribute/buffer set we want.
    this.renderer.gl.bindVertexArray(this.renderer.floor_vao);
    this.renderer.gl.drawArrays(this.renderer.gl.TRIANGLES, 0, 3);
    // todo, bring these in once the floor program works...
    */
    /*
    this.renderer.wand_program = wand_program;
    this.renderer.line_program = line_program;
    this.renderer.ray_program = ray_program;
    this.renderer.textquad_program = textquad_program;
    this.renderer.debug_program = debug_program;
    */
    // Global GL Resources
    /*
    // todo
    this.renderer.floor_vao = this.renderer.gl.createVertexArray(this.renderer.gl, this.renderer.floor_geom, this.renderer.floor_program.id);
    this.renderer.gl.bindVertexArray(this.renderer.floor_vao)
    // this.renderer.debug_vao = glutils.createVao(this.renderer.gl, this.renderer.debug_geom, this.renderer.debug_program.id);
    // this.renderer.fbo_vao = glutils.createVao(this.renderer.gl, glutils.makeQuad(), this.renderer.fbo_program.id);
    */
    // this.renderer.fbo = glutils.makeFboWithDepth(this.renderer.gl, systemSettings.vrdim[0], systemSettings.vrdim[1])
  }
  makeSceneGraph() {

    let font = renderer.font;
  
    return {
  
      // create VAOs for the geometry types:
      module_vao: glutils.createVao(this.renderer.gl,this.renderer.module_geom,this.renderer.module_program.id),
      line_vao: glutils.createVao(this.renderer.gl,this.renderer.line_geom,this.renderer.line_program.id),
      textquad_vao: glutils.createVao(this.renderer.gl,this.renderer.textquad_geom,this.renderer.textquad_program.id),
  
      // create VBOs and JS interfaces for instances of each geometry type:
      module_instances: glutils.createInstances(this.renderer.gl, [
        { name:"i_quat", components:4 },
        { name:"i_color", components:4 },
        { name:"i_pos", components:3 },
        { name:"i_bb0", components:3 },
        { name:"i_bb1", components:3 },
        { name:"i_value", components:1 },
        { name:"i_shape", components:1 },
        { name:"i_highlight", components:1 },
      ]),
      line_instances: glutils.createInstances(this.renderer.gl, [
        { name:"i_color", components:4 },
        { name:"i_quat0", components:4 },
        { name:"i_quat1", components:4 },
        { name:"i_pos0", components:3 },
        { name:"i_pos1", components:3 },
      ]),
      textquad_instances: glutils.createInstances(this.renderer.gl, [
        { name: "i_modelmatrix", components: 16 },
        { name: "i_fontbounds", components: 4 },
        { name: "i_fontcoord", components: 4 },
      //	{ name: "i_color", components: 4 },
      ]),
  
      // JS interface to scene graph:
      root: null,
      // lookup table from full path name to module isntance:
      paths: {},
        
      init() {
        // attach instances to VAOs:
        // pre-allocate a few instances for initial headroom
        this.module_instances.attachTo(this.module_vao).allocate(128);
        this.line_instances.attachTo(this.line_vao).allocate(128);
        this.textquad_instances.attachTo(this.textquad_vao).allocate(512);
        return this;
      },
  
      // message is a string
      addText(message, modelmatrix=mat4.create()) {
        let idx = this.textquad_instances.count;
        // reallocate if necessary:
        this.textquad_instances.allocate(idx + message.length);
        // the .instances provides a convenient interface to the underlying arraybuffer
        let x = 0;
        let y = 0;
        for (var i = 0; i < message.length; i++) {
          let c = message.charAt(i).toString();
          // space characters don't render, just update cursor:
          if (c === " ") {
            x += font.charwidth;
          } else if (c === "\t") {
            x += font.charwidth* 3;
          } else if (c === "\n") {
            x = 0;
            y -= font.json.common.lineHeight * font.scale;
          } else {
            const char = font.lookup[c];
            if (!char) {
              console.error("couldn't find character: ", c, typeof(c));
              continue;
            }
            // get instance interface for this character:
            let obj = this.textquad_instances.instances[idx];
            // the anchor coordinate system for the text:
            mat4.copy(obj.i_modelmatrix, modelmatrix);
            // color:
      //			vec4.set(obj.i_color, 1, 1, 1, 1)
            // bounding coordinates of the quad for this character:
            vec4.copy(obj.i_fontbounds, char.quad);
            // offset by character location:
            obj.i_fontbounds[0] += x;
            obj.i_fontbounds[1] += y;
            // UV coordinates for this character:	
            vec4.copy(obj.i_fontcoord, char.texCoords);
            // next instance:
            idx++; 
            // update cursor:
            x += char.xadvance * font.scale;
          }
        }
        // return the used instance count so we know how many to render
        this.textquad_instances.count = idx;
      },
  
      // re-generate the entire scene from the GOT graph received
      rebuild(graph) {
        // reset instance counts:
        this.module_instances.count = 0;
        this.line_instances.count = 0;
        this.textquad_instances.count = 0;
        this.root = {
          // matrix transform object2world:
          mat: mat4.create(), 
          i_quat: [0, 0, 0, 1],
          name: "root",
          kind: null,
          scale: 1,
          nodes: [],
        };
        this.paths = {}
  
        // loop over the nodes in the graph,
        // creating instances as needed
        let names = Object.keys(graph.nodes); //.filter(s => s != "_props");
        if (names.length) {
          for (const name of names) {
            this.rebuildNode(name, graph.nodes[name], this.root)
          }
        }
        if (graph.arcs.length) {
          // now loop over arcs:
          this.line_instances.allocate(graph.arcs.length);
          for (const arc of graph.arcs) {
            let line = this.line_instances.instances[this.line_instances.count];
            line.from = this.paths[ arc[0] ];
            line.to = this.paths[ arc[1] ];
  
            if (!line.from || !line.to) continue;
  
            vec4.set(line.i_color, 1, 1, 1, 1);
            line.name = line.from.path + ">" + line.to.path
            this.line_instances.count++;
  
            // add jack cylinders:
            for (let parent of [line.from, line.to]) {
              let obj = this.getNextModule(parent);
              obj.name = line.name +":" + parent.name;
              obj.line = line
              obj.kind = "jack"
              // TODO to allow stacked cables:
              //obj.cablingKind = (parent.kind == "inlet") ? "input" : "output"
              obj.scale = UI_DEFAULT_SCALE
              obj.dim = [1/4, 1/4, 1/2]
              obj.pos = [0, 0, 0]
              obj.quat = [0, 0, 0, 1]
              vec4.set(obj.i_color, 0.25, 0.25, 0.25, 1)
              obj.i_shape[0] = SHAPE_CYLINDER;
              obj.i_value[0] = 0;
              obj.i_highlight[0] = 0;
            }
          }
        }
        this.line_instances.count = graph.arcs.length;
        return this.updateInstances();
      },
  
      getNextModule(parent) {
        // create a module instance:
        // reallocate space if needed
        if (this.module_instances.count >= this.module_instances.allocated) {			
          this.module_instances.allocate(Math.max(4, this.module_instances.allocated*2));
        }
        let obj = this.module_instances.instances[this.module_instances.count];
        this.module_instances.count++;
        // add graph links:
        parent.nodes.push(obj)
        obj.parent = parent;
        
        // this will define object's coordinate system relative to world:
        obj.mat = mat4.create()
        obj.scale = 1;
        return obj;
      },
  
      rebuildNode(name, node, parent, parent_path) {
        const props = node._props || {}
  
        let obj = this.getNextModule(parent);
  
        // add graph source:
        obj.node = node;
        obj.name = name;
        obj.kind = props.kind;
  
        // determine full path to this object
        // and cache in scenegraph.paths
        let path = name;
        if (parent_path) path = parent_path+"."+path;
        obj.path = path;
        this.paths[path] = obj;
  
        // get basic pose:
        obj.pos = props.pos;
        if (!obj.pos || obj.pos[0]===null) {
          obj.pos = [0, 0, 0];
        }  
        obj.quat = props.orient;
        if (!obj.quat || obj.quat[0]===null || quat.length(obj.quat)==0) {
          obj.quat = [0, 0, 0, 1];
        }
        obj.scale = 1;
        obj.dim = [1, 1, UI_DEPTH]
        obj.nodes = []
  
        obj.i_shape[0] = SHAPE_BOX;
        vec4.set(obj.i_color, 0.5, 0.5, 0.5, 1);
        obj.i_highlight[0] = 0;
  
        // default label:
        // represent genish names with easier-to-read labels:
  
        let label_text = name;
        // if op has a mathematical sign, provide it in the opsList so that VR can display it instead of the genish name (for better UX)
        switch(name){
          case 'add':
            label_text = '+'
          break
          case 'sub':
            label_text = 'subtract'
          break
          case 'mul':
            label_text = 'multiply'
          break
          case 'div':
            label_text = 'divide'
          break
          case 'gt':
            label_text = '>'
          break
          case 'gte':
            label_text = '>='
          break
          case 'lt':
            label_text = '<'
          break
          case 'lte':
            label_text = '<='
          break
          case 'bool':
            label_text = 'boolean'
          break
          case 'gtp':
            label_text = '> pass'
          break
          case 'ltp':
            label_text = '< pass'
          break
          case 'ad':
            label_text = 'attack/decay'
          break
          case 'eq':
            label_text = 'equals'
          break
          case 'neq':
            label_text = '!='
          break
          case 'ad':
            label_text = 'attack/decay'
          break
          case 'eq':
            label_text = '=='
          break
          case 'neq':
            label_text = '!='
          break
          case 'seq':
            //TODO what does this one do?
          break
  
  
        }
        let scale = UI_DEFAULT_SCALE;
        let text_scale = Math.min(1/(label_text.length+1), 1/font.charheight);
        let text_pos = [ 0, 0.4 ];
        
        let text_scale1 = Math.min(1/8, 1/font.charheight);
        let text_pos1 = [ 0, -0.4 ];
  
        switch(obj.kind) {
          case "outlet":
          case "inlet":  {
            obj.i_shape[0] = SHAPE_CYLINDER;
            vec4.copy(obj.i_color, props.kind == "inlet" ? [0.5, 0.5, 0.5, 1] : [0.25, 0.25, 0.25, 1]);
            obj.dim = [1/2, 1/2, -UI_DEPTH];
            obj.cablingKind = (props.kind == "inlet") ? "to" : "from";
            if (props.history) {
              // render history outs differently:
              obj.i_shape[0] = SHAPE_BOX;
            }
            this.addLabel(obj, label_text, text_pos, text_scale);
          } break;
          case "small_knob": 
          case "knob": 
          case "large_knob":  {
            obj.kind = "knob";
            obj.i_shape[0] = SHAPE_KNOB;
            vec4.copy(obj.i_color, colorFromString(name));
            obj.dim = [2/3, 2/3, UI_DEPTH];
            let range = props.range; 
            if (!range || range[0]===null) {
              range = [0, 1];
            }
            range[0] = +range[0]; // coerce to number, just in case
            range[1] = +range[1]; // coerce to number, just in case
            let value = props.value || 0.;
            value = +value;
            obj.value = value;
            obj.i_value[0] = (value - range[0])/(range[1]-range[0]);
            obj.cablingKind = "to"
            this.addLabel(obj, label_text, text_pos, text_scale);
            this.addLabel(obj, obj.value.toPrecision(5), text_pos1, text_scale1);
          } break;
          case "n_switch": {
            obj.kind = "button";
            obj.i_shape[0] = SHAPE_BUTTON;
            vec4.copy(obj.i_color, colorFromString(name));
            obj.dim = [2/3, 2/3, UI_DEPTH];
            let throws = props.throws || [0,1];
            let value = props.value || 0.;
            obj.value = value;
            obj.i_value[0] = value/(throws.length-1);
            obj.cablingKind = "to"
            this.addLabel(obj, label_text, text_pos, text_scale);
          } break;
          default: {
            vec4.copy(obj.i_color, opMenuColour(props.category));
  
            obj.isModule = true;
            obj.nodes = [];
  
            // will recurse to sub-nodes:
            const children_names = Object.keys(node).filter(s => s != "_props");
            // compute rows & cols:
            let nchildren = children_names.length;
  
            let inlets = []
            let outlets = []
            let ui = []
  
            for (const child_name of children_names) {
              const child_node = node[child_name];
              // recurse:	
              // this will also add child to obj.nodes:
              const child = this.rebuildNode(child_name, child_node, obj, path);
  
              if (child.kind == "inlet") {
                inlets.push(child);
              } else if (child.kind == "outlet") {
                outlets.push(child);
              } else {
                ui.push(child);
              }
            }
            
            // default layout:
            let ncols = nchildren, 
              nrows = 1,
              nspaces = 0;
            if (ncols > 4) {
              // multi-row layout.
              //ncols = Math.ceil(Math.sqrt(nchildren/1.618));
              ncols = Math.ceil(Math.sqrt(nchildren/1));
              nrows = Math.ceil(nchildren / ncols);
              let nspots = nrows*ncols;
              // nspaces indicates how many empty spots we have;
              // these could be used to insert smart newlines
              nspaces = nspots - nchildren;
            }
            
            // start at row 1, since the label occupies row zero
            let r=1, c=0;
            let lastkind;
            let cmax = 1;
            for (let i=0; i<nchildren; i++) {
              const child_name = children_names[i];
              const child_node = node[child_name];
              const child = obj.nodes[i];
  
              // newline here?
              if (c >= ncols) {
                c = 0;
                r++;
              } else if (lastkind 
              && lastkind == "inlet"
              && child.kind != "inlet") {
                // finished with inlet row(s);
                if (c >= ncols/2) {
                  c = 0;
                  r++;
                }
              } else if (lastkind 
              && lastkind != "outlet"
              && child.kind == "outlet") {
                // starting with outlet row(s):
                // newline if we are past half way
                if (c >= ncols/2 
                // but don't newline if the outlets could fit this line
                && nchildren-i < cmax-c) {
                  c = 0;
                  r++;
                }
              }
              // override child pos for module layout:
              child.col = c;
              child.row = r;
  
              // move cursor on:
              cmax = Math.max(cmax, c);
              lastkind = child.kind;
              c++;
            }
            nrows = r+1;
            ncols = cmax+1;
  
            // now we know rows & cols, 
            // update properly:
            obj.scale = UI_DEFAULT_SCALE;
            obj.dim = [ncols, nrows, -UI_DEPTH];
            for (const child of obj.nodes) {
              vec3.set(child.pos,
                0.5 + child.col - ncols/2, 
                nrows/2 - (0.5 + child.row),
                UI_NUDGE
              );
            }
  
            // add module label:
            label_text = obj.kind.toUpperCase();
  
            // if op has a mathematical sign, provide it in the opsList so that VR can display it instead of the genish name (for better UX)
            switch(obj.kind){
              case 'add':
                label_text = '+'
              break
              case 'sub':
                label_text = 'subtract'
              break
              case 'mul':
                label_text = 'multiply'
              break
              case 'div':
                label_text = 'divide'
              break
              case 'gt':
                label_text = '>'
              break
              case 'gte':
                label_text = '>='
              break
              case 'lt':
                label_text = '<'
              break
              case 'lte':
                label_text = '<='
              break
              case 'bool':
                label_text = 'boolean'
              break
              case 'gtp':
                label_text = '> pass'
              break
              case 'ltp':
                label_text = '< pass'
              break
              case 'ad':
                label_text = 'attack/decay'
              break
              case 'eq':
                label_text = 'equals'
              break
              case 'neq':
                label_text = '!='
              break
              case 'ad':
                label_text = 'attack/decay'
              break
              case 'eq':
                label_text = '=='
              break
              case 'neq':
                label_text = '!='
              break
              case 'seq':
                //TODO what does this one do?
              break
            }
              label_text.toUpperCase()
            let w = font.charwidth * label_text.length;
            // scale to fit
            text_scale = Math.min(
              obj.dim[0] * 1/(w+1), // scale factor to fill width of panel with pad,
              1/font.charheight, // scale factor to fill 1 row height
            );
            // to centre the text at the top of the module: 
            let text_pos = [ 0, obj.dim[1]/2 - 1/2 - 0.25*text_scale ];
            this.addLabel(obj, label_text, text_pos, text_scale);
          }
        }
        return obj;
      },
  
      // text_pos is expressed in the parent's coordinate system
      // text_scale will fit the text to the available space
      addLabel(parent, text, text_pos, text_scale) {
        let idx = this.textquad_instances.count;
        const len = text.length;
        const width = font.charwidth * len;
  
        // reallocate if necessary:
        this.textquad_instances.allocate(idx + len);
        
        // centre it:
        let x = text_scale * (text_pos[0] - width/2);
        let y = text_pos[1];
        for (var i = 0; i < text.length; i++) {
          let c = text.charAt(i).toString();
          // space characters don't render, just update cursor:
          if (c === " ") {
            x += font.charwidth;
          } else if (c === "\t") {
            x += font.charwidth*3;
          } else if (c === "\n") {
            x = 0;
            y -= font.json.common.lineHeight * font.scale;
          } else {
            const char = font.lookup[c];
            if (!char) {
              console.error("couldn't find character: ", c, typeof(c));
              continue;
            }
            // get instance interface for this character:
            let textobj = this.textquad_instances.instances[idx];
            // color:
      //			vec4.set(obj.i_color, 1, 1, 1, 1)
            // bounding coordinates of the quad for this character:
            vec4.scale(textobj.i_fontbounds, char.quad, text_scale);
            // offset by character location:
            textobj.i_fontbounds[0] += x;
            textobj.i_fontbounds[1] += y;
            // UV coordinates for this character:	
            vec4.copy(textobj.i_fontcoord, char.texCoords);
  
            textobj.parent = parent;
  
            // next instance:
            idx++; 
            // update cursor:
            x += char.xadvance * font.scale * text_scale;
          }
        }
  
        this.textquad_instances.count = idx;
        return this.updateInstances();
      },
      
      updateInstances() {
        // updates geometric & rendering attributes of all instances, including position, quat, scale, worldmat etc.
        // NOTE: because of the way the instances were created, parents will be 
        // visited earlier in the iteration than their children
        // this means that parent properties (like obj.mat) have been updated
        // before the child is updated
        for (let i=0; i<this.module_instances.count; i++) {
          let obj = this.module_instances.instances[i];
          let parent = obj.parent;
          let scale = obj.scale * parent.scale;
          // get world pos by transforming through parent's mat
          vec3.transformMat4(obj.i_pos, obj.pos, obj.parent.mat);
          // TODO verify this is the right ordering:
          quat.multiply(obj.i_quat, obj.quat, obj.parent.i_quat);
          vec3.copy(obj.i_bb0, [
            obj.dim[0]*-0.5*scale, 
            obj.dim[1]*-0.5*scale, 
            obj.dim[2]*-0.5*scale
          ])
          vec3.copy(obj.i_bb1, [
            obj.dim[0]*0.5*scale, 
            obj.dim[1]*0.5*scale, 
            obj.dim[2]*0.5*scale
          ])
          // TODO: use a 0..1 cube instead of this silly -1..1 thing
          vec3.negate(obj.i_bb0, obj.i_bb1)
          // update our 'toworld' mat:
          mat4.fromRotationTranslationScale(obj.mat, 
            obj.i_quat, obj.i_pos, 
            [scale, scale, scale]
          );
        }
  
        for (let i=0; i<this.textquad_instances.count; i++) {
          let obj = this.textquad_instances.instances[i];
          let parent = obj.parent;
          mat4.copy(obj.i_modelmatrix, parent.mat)
        }
        for (let i=0; i<this.line_instances.count; i++) {
          let obj = this.line_instances.instances[i];
          
          let {from, to} = obj;
          if(from && to){
            assert(from, `line ${obj.name} from is missing`)
            assert(to, `line ${obj.name} to is missing`)
            quat.copy(obj.i_quat0, from.i_quat);
            quat.copy(obj.i_quat1, to.i_quat);
            vec3.copy(obj.i_pos0, from.i_pos);
            vec3.copy(obj.i_pos1, to.i_pos);
          }else {
            //!  for some reason this script was receiving some undefined from/to arcs, so ignore them here for now
          }
        }
        return this.submit();
      },
  
      submit() {
        // submit to GPU:
        this.module_instances.bind().submit().unbind()
        this.line_instances.bind().submit().unbind()
        this.textquad_instances.bind().submit().unbind()
        return this;
      },
  
      draw(gl) {
   

        //TODO uncomment these to add in the shaders for other mischmasch elements
        /*
        this.renderer.module_program.begin();
        this.renderer.module_program.uniform("u_viewmatrix", viewmatrix);
        this.renderer.module_program.uniform("u_projmatrix", projmatrix);
          this.module_vao.bind().drawInstanced(this.module_instances.count).unbind()
        this.renderer.module_program.end();
    
        this.renderer.line_program.begin();
        this.renderer.line_program.uniform("u_viewmatrix", viewmatrix);
        this.renderer.line_program.uniform("u_projmatrix", projmatrix);
        this.renderer.line_program.uniform("u_stiffness", 0.5)
          // consider gl.LINE_STRIP with simpler geometry
          this.line_vao.bind().drawInstanced(this.line_instances.count, gl.LINES).unbind()
        this.renderer.line_program.end();
        
          // text:
        this.renderer.font.texture.bind(0)
        this.renderer.textquad_program.begin();
          //textquad_program.uniform("u_modelmatrix", modelmatrix);
        this.renderer.textquad_program.uniform("u_viewmatrix", viewmatrix);
        this.renderer.textquad_program.uniform("u_projmatrix", projmatrix);
          this.textquad_vao.bind().drawInstanced(this.textquad_instances.count).unbind()
        this.renderer.textquad_program.end();
        */
    
        return this;
      },
    }
  }
}

export { Renderer}