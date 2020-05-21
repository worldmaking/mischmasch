const got = require('../got/got.js');
let assert = require("assert");
let fs = require("fs")
const argv = require('yargs').argv
let g;
let g1;
let d;
// jest does this before running tests
beforeAll(() => {
    d = JSON.parse(fs.readFileSync('__tests__/deltas/simple_scene.json'))
});

if (argv.A){
	let editsA = JSON.parse(fs.readFileSync('__tests__/deltas/' + argv.A + '.json'))

	for (i = 0; i < editsA.length; i++){
		d.push(editsA[i])
	}

	if (argv.B){
		let editsB = JSON.parse(fs.readFileSync('__tests__/deltas/' + argv.B + '.json'))
		for (i = 0; i < editsB.length; i++){
			d.push(editsB[i])
		}
	}
} 

test('convert deltas to string', () => {
  expect(typeof got.deltasToString(d)).toBe('string');
});

test('convert deltas to graph', () => {
  g = got.graphFromDeltas(d)
  g1 = got.graphFromDeltas(d)
  expect(typeof g).toBe('object');
});

test('compare graphs g and g1 to be equal', () =>{
  //expect(g).toEqual(g1)
  expect(got.deepEqual(g, g1)).toBe(true)
  expect(got.deepEqual(got.deltasFromGraph(g, []), got.deltasFromGraph(g1, []))).toBe(true)

})

test('undo everything', () =>{
  let id = got.inverseDelta(d);
  expect(typeof got.deltasToString(id)).toBe('string');
  expect(typeof got.applyDeltasToGraph(g, id)).toBe('object')
})

test('check graph', () =>{
  let id = got.inverseDelta(d);
  expect(typeof got.graphToString(g)).toBe('string');
  expect(got.graphToString(g)).toBe('')
})