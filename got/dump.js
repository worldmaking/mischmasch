let fs = require("fs")
let got = require("./got.js")

let graph = JSON.parse(fs.readFileSync("../scene_simple.json", "utf-8"))

let deltas = got.deltasFromGraph(graph, [])

fs.writeFileSync("../deltas_simple.json", JSON.stringify(deltas, null, "  "), "utf-8")

console.log(deltas)