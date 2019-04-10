let fs = require("fs")
let got = require("./got.js")

//let graph = JSON.parse(fs.readFileSync("../scene_simple.json", "utf-8"))

let graph = {
    nodes: {
        "noise": {
                "_props":{
                "kind":"noise",
                "pos": [0.0, 0.8, 0.0], 
                "orient": [0, 0, 0, 1] 
            },
            "out":{ 
                "_props":{ "kind":"outlet" }
            }
        }
    },
    arcs: []
}

let deltas = got.deltasFromGraph(graph, [])

fs.writeFileSync("deltas.json", JSON.stringify(deltas, null, "  "), "utf-8")

console.log(deltas)