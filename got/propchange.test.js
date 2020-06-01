const got = require('../got/got.js');
let assert = require("assert");
let fs = require("fs")
const argv = require('yargs').argv
let g;
let g1;
let d;
// jest does this before running tests

// describe('conflicting edits', () => {

//     beforeAll(() => {
//     })
//     afterAll(() => {
//       /* Runs after all tests */
//     })
//     beforeEach(() => {
//       /* Runs before each test */
//       d = JSON.parse(fs.readFileSync('__tests__/deltas/simple_scene.json'))
//       g = got.graphFromDeltas(d)
//       g1 = got.graphFromDeltas(d)
//     })
//     afterEach(() => {
//       /* Runs after each test */
//     })

//     test.only('Two propchanges with same path, same “from”, but different “to”', () => {
//         let deltas = [
//             {"op":"propchange","path":"lfo_1.rate","name":"value","from":0.17,"to":34},
//             {"op":"propchange","path":"lfo_1.rate","name":"value","from":0.17,"to":36}
//         ]
//         got.applyDeltasToGraph(g, [deltas])
//         // expect(() => got.applyDeltasToGraph(g, [deltas])).toThrowError('propchange failed: property value does not match')
//     });

//     test('two users: handle same "from" and "to" propchange', () => {
//       let deltas = [
//           {"op":"propchange","path":"lfo_1.rate","name":"value","from":0.17,"to":34},
//           {"op":"propchange","path":"lfo_1.rate","name":"value","from":0.17,"to":36}
//       ]
//       got.applyDeltasToGraph(g, [deltas])
//       // expect(() => got.applyDeltasToGraph(g, [deltas])).toThrowError('propchange failed: property value does not match')
//   });

//     test('two users: delnode then propchange', () => {
//         let deltas = [[[{"op":"delnode","path":"lfo_1.sine_index","kind":"outlet","index":3}],[{"op":"delnode","path":"lfo_1.pulse","kind":"outlet","index":2}],[{"op":"delnode","path":"lfo_1.phasor","kind":"outlet","index":1}],[{"op":"delnode","path":"lfo_1.sine","kind":"outlet","index":0}],[{"op":"delnode","path":"lfo_1.onset","kind":"small_knob","range":[0,1],"taper":"linear","value":2.8,"unit":"float"}],[{"op":"delnode","path":"lfo_1.pulse_width","kind":"small_knob","range":[0,1],"taper":"linear","value":5,"unit":"float"}],[{"op":"delnode","path":"lfo_1.index","kind":"small_knob","range":[0,10],"taper":"linear","value":3,"unit":"float"}],[{"op":"delnode","path":"lfo_1.rate","kind":"large_knob","range":[0,80],"taper":"log 3.8","value":0.17,"unit":"Hz"}],[{"op":"delnode","path":"lfo_1.pulse_width_cv","kind":"inlet","index":2}],[{"op":"delnode","path":"lfo_1.phasor_sync","kind":"inlet","index":1}],[{"op":"delnode","path":"lfo_1.fm_cv","kind":"inlet","index":0}],{"op":"delnode","path":"lfo_1","kind":"lfo","pos":[-2.326367085370336,1.5209056349935186,-0.7035861792005239],"orient":[0.12358177055502231,0.41713355199484253,0.13623412932103282,0.8900378687419946]}]]
//         deltas.push({"op":"propchange","path":"lfo_1.rate","name":"value","from":0.17,"to":36})
//         got.applyDeltasToGraph(g, [deltas]);
//     });

// })    

function vanilla(){



  // let hello = async function() { return "Hello" };
  let g

  let hello = async () => {    
    d = JSON.parse(fs.readFileSync('simple_scene.json'))
    g = got.graphFromDeltas(d)
    g1 = got.graphFromDeltas(d)   
    // let deltas = [[{"op":"newnode","path":"lfo_2","kind":"lfo","pos":[-2.326367085370336,1.5209056349935186,-0.7035861792005239],"orient":[0.12358177055502231,0.41713355199484253,0.13623412932103282,0.8900378687419946]},[{"op":"newnode","path":"lfo_2.fm_cv","kind":"inlet","index":0}],[{"op":"newnode","path":"lfo_2.phasor_sync","kind":"inlet","index":1}],[{"op":"newnode","path":"lfo_2.pulse_width_cv","kind":"inlet","index":2}],[{"op":"newnode","path":"lfo_2.rate","kind":"large_knob","range":[0,80],"taper":"log 3.8","value":0.17,"unit":"Hz"}],[{"op":"newnode","path":"lfo_2.index","kind":"small_knob","range":[0,10],"taper":"linear","value":3,"unit":"float"}],[{"op":"newnode","path":"lfo_2.pulse_width","kind":"small_knob","range":[0,1],"taper":"linear","value":5,"unit":"float"}],[{"op":"newnode","path":"lfo_2.onset","kind":"small_knob","range":[0,1],"taper":"linear","value":2.8,"unit":"float"}],[{"op":"newnode","path":"lfo_2.sine","kind":"outlet","index":0}],[{"op":"newnode","path":"lfo_2.phasor","kind":"outlet","index":1}],[{"op":"newnode","path":"lfo_2.pulse","kind":"outlet","index":2}],[{"op":"newnode","path":"lfo_2.sine_index","kind":"outlet","index":3}]]]
  
    let deltas = [
    {"op":"propchange","path":"lfo_1.rate","name":"value","from":0.17,"to":34},
    // {"op":"propchange","psath":"lfo_1.rate","name":"value","from":0.17,"to":36}
    ]
    console.log(got.applyDeltasToGraph(g, [deltas]).nodes.lfo_1)
  };


  hello().then(
    console.log(g.nodes.lfo_1.rate)
    // console.log(got.deltasFromGraph(g, [])[0])
    )


}

vanilla()