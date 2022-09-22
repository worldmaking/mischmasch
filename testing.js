const fs = require('fs')
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

// prettyPrint(menuGraph)

function prettyPrint(object){
	console.log(JSON.stringify(object, null, 4))
}

const oldMenu = JSON.parse(fs.readFileSync(path.join(componentPath, 'Palette/oldMenu.json')))

let items = Object.keys(oldMenu)
let abstractions = {}
for(let i=0;i<items.length; i++){
	if(oldMenu[items[i]]._props.category == 'abstraction'){
		abstractions[oldMenu[items[i]]._props.kind] = oldMenu[items[i]]
	}
}
// console.log(abstractions)
let modules = {}
let dirname = path.join(componentPath, 'Palette/code')

fs.readdirSync(dirname).forEach((filename, i) => {
	if (path.extname(filename) != ".gendsp") return;
	const name = path.basename(filename).split(".")[0]
	
	if (name.charAt(0) == "_") return;
	if (["world"].indexOf(name) >= 0) return;
	console.log(name)
	let filePath = path.join(dirname, filename)

	// create the abstraction obj
	// as we go through the gendsp, if there's an object that is not in the genish ops list, push it to Array.incompatible and then check that array's length at the end (and print it so we see what's not compatible)
	modules[name] = {
		incompatible: [],
		compatible: [],
		inputs: [],
		outputs: []
	}

	// load the gendsp file
	let gendsp = JSON.parse(fs.readFileSync(filePath, "utf-8"))
	
	let inCount = 0
	let outCount = 0
	let inputs = []
	let outputs = []
	
	// loop through gendsp patcher
	gendsp.patcher.boxes.forEach(box =>{
		let {id, maxclass, numinlets, numoutlets, patching_rect, text} = box.box
		if (maxclass != "newobj") return;
		
		if(!modules[name]){
			return
		}
		let boxText = box.box.text.split(' ')
		let kind = boxText[0]
		// console.log(box.box)
		if(menu.opsList.includes(kind)){

			modules[name].compatible.push(box.box.text)
			switch(kind){

				case 'param':
					modules[name][boxText[1]] = {
						_props: {
							kind: 'knob',
							range: [0., 1.],
							value: boxText[2],
							type: 'float'
						}
					}
					// if boxText includes an @min and/or @max, get the value after and set the min and max of the knob's range
					if(boxText.includes('@min')){
						let min = boxText.indexOf('@min') + 1
						modules[name][boxText[1]]._props.range[0] = boxText[min]
					}
					if(boxText.includes('@max')){
						let max = boxText.indexOf('@max') + 1
						modules[name][boxText[1]]._props.range[1] = boxText[max]
					}
					
				break

				case 'in':

					modules[name][boxText[2]] = {
						_props: {
							kind: 'inlet',
							index: inCount
						}
					}
					inCount++

				break


			}
		}else {
			switch(kind){
				// some gen objects are spelled differently in genish
				case '/': // div
				case '+': // add
				case '*': // mul
				case '-': // sub
				case '>': // gt
				case '<': // lt
				case '==': // eq
				case '>=p': // gtp
				case "%": // mod
				case "clip": // clamp
				
					modules[name].compatible.push(box.box.text)

				break

				case 'trig':
					// this is a gen abstraction, note that it contains [change] which is not available in genish
				break
				case 'schmitt':
					// this is a gen abstraction. note that it contains [scale] which is not available in genish
				break

				case 'out':

					modules[name][boxText[2]] = {
						_props: {
							kind: 'outlet',
							index: outCount
						}
					}
					outCount++
				break


				default:
					modules[name].incompatible.push(box.box.text)
					console.log(boxText)
				break
			}
			return false
			//TODO if opsList !includes this kind of op, then remove this abstraction from the list of abstractions

			//TODO also check that the kinds printed here are all not valid. for example, the math ones are listed by their sign, but in genish they are mostly written out in words. 
			// i.e. + (gen) == add (genish)
			// i.e. history is ssd in genish, right?
			// look for all of them...
			// switch(kind){
			// 	case "*":

			// }
		}
		if(modules[name]){
			// console.log(modules[name])
			// prettyPrint(gendsp)
			
		}
	});

	// prettyPrint(modules)
})

