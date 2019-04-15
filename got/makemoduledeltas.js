let assert = require("assert");
let fs = require("fs")
let got = require("./got.js");

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

let modules = JSON.parse(fs.readFileSync("../modules.json", "utf-8"))
//console.log(modules)

let results = []

for (let modname in modules.modules) {
    let mod = modules.modules[modname];

   
    let graph = {
        nodes: { ["${path}"]: mod },
        arcs: []
    }
    console.log("graph=", graph)

    let deltas = got.deltasFromGraph(graph, [], "").flat(10000000)

    results.push( `\t"${modname}": function(path, pos, orient) { 
        let json = \`${JSON.stringify(deltas)}\`;
        let deltas = JSON.parse(json);
        let op0 = deltas[0]
        op0.pos = pos;
        op0.orient = orient;
        return deltas;
    },` );
}

console.log()
fs.writeFileSync("../modules_as_deltas.js", "let module_constructors = {\n" + results.join("\n\n") + "\n}", "utf-8")