const path = require('path')
const componentPath = path.join(__dirname, 'Components')
// components
const Patch = require(path.join(componentPath, 'Patch/Patch.js'))
const Palette = require(path.join(componentPath, 'Palette/Palette.js'))

let menuGraph = {
	nodes: {},
	arcs: []
}

const menu = new Palette()

menuGraph.nodes = menu.graph;
// prettyPrint(menu.graph)

prettyPrint(menuGraph)

function prettyPrint(object){
	console.log(JSON.stringify(object, null, 4))
}