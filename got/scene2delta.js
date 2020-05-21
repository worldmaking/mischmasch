let assert = require("assert");
let fs = require("fs")
let got = require("./got.js");

let graph = JSON.parse(fs.readFileSync("../scene_files/scene_edited.json"), "utf-8")
let deltas = got.deltasFromGraph(graph, [])
fs.writeFileSync("../got/testing/deltas.json", JSON.stringify(deltas, null, "  "), "utf-8")
