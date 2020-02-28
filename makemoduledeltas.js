let assert = require("assert");
let fs = require("fs")
let got = require("./got/got.js");

if (!Array.prototype.flat) {
  Array.prototype.flat = function() {
    var depth = arguments[0];
    depth = depth === undefined ? 1 : Math.floor(depth);
    if (depth < 1) return Array.prototype.slice.call(this);
    return (function flat(arr, depth) {
      var len = arr.length >>> 0;
      var flattened = [];
      var i = 0;
      while (i < len) {
        if (i in arr) {
          var el = arr[i];
          if (Array.isArray(el) && depth > 0)
            flattened = flattened.concat(flat(el, depth - 1));
          else flattened.push(el);
        }
        i++;
      }
      return flattened;
    })(this, depth);
  };
}
// console.log('test')

let operators = JSON.parse(fs.readFileSync("operators.json", "utf-8"))
let operator_constructors = []

// need to make a skip list so that we don't get certin gen ops that are unlikely to be useful. 

//console.log(operators[0])

for (let op of operators) {
  
  let name = op.op
  
  let ctors = op.constructors
  let inputs = op.inputs
  let outputs = op.outputs
  let specification = op.category
  console.log(op.category)
  //console.log(op)

  let default_ctor = ctors[ctors.length-1]
  let ninlets = default_ctor.inlets.length
  let noutlets = outputs.length
  //console.log(name,ninlets,noutlets)
  // skip objects that need args
  if (Array.isArray(default_ctor.arguments) && default_ctor.arguments.length > 0) continue;

  // skip constants for now
  if (op.category == "constant") continue;

  // only handle objects with fixed no. inlets / outlets
  if (ninlets !== undefined && noutlets !== undefined) {

    let in_names = default_ctor.inlets
    let out_names = outputs.map(o => o.name)
    //console.log(outputs.map(o => o.name))

    let codes = [`
      { "op":"newnode", "path":"\${path}", "kind":"${name}", "specification":"${specification}","category":"operator", "pos":[0,0,0], "orient":[0,0,0,1] }`];

    for (let i=0; i<in_names.length; i++) {
      let inlet_name = in_names[i]
      
      
      codes.push(`
      { "op":"newnode", "kind":"inlet", "path":"\${path}.${inlet_name}", "specification":"${specification}", "category":"operator", "index":${i} }`);
    }
    for (let i=0; i<out_names.length; i++) {
      let outlet_name = out_names[i]
      //console.log(outlet_name)
      codes.push(`
      { "op":"newnode", "kind":"outlet", "path":"\${path}.${outlet_name}", "specification":"${specification}", "category":"operator", "index":${i} }`);
    }


    operator_constructors.push(`
  "${name}": function(path) { 
    return JSON.parse(\`[${codes.join(",")}
    ]\`);
  }`)


  } else {
    //if (!Array.isArray(default_ctor.inlets)) console.log("weird inlets", name, default_ctor.inlets, outputs)
    //if (!Array.isArray(outputs)) console.log("weird outputs", name, default_ctor.inlets, outputs)
  }
}



let modules = JSON.parse(fs.readFileSync("modules.json", "utf-8"))
//console.log(modules)

let results = []

for (let modname in modules.modules) {
    let mod = modules.modules[modname];

   
    let graph = {
        nodes: { ["${path}"]: mod },
        arcs: []
    }
    //console.log("graph=", graph)

    let deltas = got.deltasFromGraph(graph, [], "").flat(10000000)

    results.push( `\t"${modname}": function(path) { 
    return JSON.parse(\`${JSON.stringify(deltas, null, "\t").replace(/\n/g, "\n\t\t")}\`);
    },` );
}

fs.writeFileSync("client/modules.js", 
`/// WARNING DO NOT EDIT THIS FILE, IT IS CODE-GENERATED!!!
/// WARNING DO NOT EDIT THIS FILE, IT IS CODE-GENERATED!!!
/// WARNING DO NOT EDIT THIS FILE, IT IS CODE-GENERATED!!!

let operator_constructors = { 
  ${operator_constructors.join(",")}
}

let module_constructors = {\n${results.join("\n\n")}\n}

let operator_names = Object.keys(operator_constructors)
let module_names = Object.keys(module_constructors)

function spawnRandomModule(pos, orient) {
  let opname, ctor
  if (Math.random() < 0.7) {
    opname = module_names[Math.floor(Math.random() * module_names.length)]
    ctor = module_constructors[opname]
  } else {
    opname = operator_names[Math.floor(Math.random() * module_names.length)]
    ctor = operator_constructors[opname]
  }
  let path = gensym(opname)
  let deltas = ctor(path);
  deltas[0].pos = pos;
  deltas[0].orient = orient;
  return deltas; 
}
`, "utf-8")