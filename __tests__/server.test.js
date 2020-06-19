const got = require('../got/got.js');
const server = require('../server.js');
let assert = require("assert");
let fs = require("fs")
const argv = require('yargs').argv
let g;
let g1;
let d;
let ab;
// jest does this before running tests
describe('server: got nuclear option on malformed deltas', () => {
    beforeAll(() => {
    })
    afterAll(() => {
      /* Runs after all tests */
    })
    beforeEach(() => {
      /* Runs before each test */
      d = JSON.parse(fs.readFileSync('__tests__/deltas/simple_scene.json'))
      g = got.graphFromDeltas(d)
      g1 = got.graphFromDeltas(d)
    })
    afterEach(() => {
      /* Runs after each test */
    })



    test('apply propchange', () => {
        let deltas = {"op": "propchange","path": "lfo_1.rate", "name": "value","from": 0.17,"to": 0.7005339838596962,"timestamp": 1571343253980}
        // // ab = got.deepCopy(g);
        let g1 =  got.applyDeltasToGraph(g, [deltas]);
        expect(g1).toBe('object');

    });

//     test('apply unique newnode', () => {
//         let deltas = [[{"op":"newnode","path":"lfo_2","kind":"lfo","pos":[-2.326367085370336,1.5209056349935186,-0.7035861792005239],"orient":[0.12358177055502231,0.41713355199484253,0.13623412932103282,0.8900378687419946]},[{"op":"newnode","path":"lfo_2.fm_cv","kind":"inlet","index":0}],[{"op":"newnode","path":"lfo_2.phasor_sync","kind":"inlet","index":1}],[{"op":"newnode","path":"lfo_2.pulse_width_cv","kind":"inlet","index":2}],[{"op":"newnode","path":"lfo_2.rate","kind":"large_knob","range":[0,80],"taper":"log 3.8","value":0.17,"unit":"Hz"}],[{"op":"newnode","path":"lfo_2.index","kind":"small_knob","range":[0,10],"taper":"linear","value":3,"unit":"float"}],[{"op":"newnode","path":"lfo_2.pulse_width","kind":"small_knob","range":[0,1],"taper":"linear","value":5,"unit":"float"}],[{"op":"newnode","path":"lfo_2.onset","kind":"small_knob","range":[0,1],"taper":"linear","value":2.8,"unit":"float"}],[{"op":"newnode","path":"lfo_2.sine","kind":"outlet","index":0}],[{"op":"newnode","path":"lfo_2.phasor","kind":"outlet","index":1}],[{"op":"newnode","path":"lfo_2.pulse","kind":"outlet","index":2}],[{"op":"newnode","path":"lfo_2.sine_index","kind":"outlet","index":3}]]]
//         // // ab = got.deepCopy(g);
//         let g1 = got.applyDeltasToGraph(g, [deltas])
        
//         expect(g1).toMatchObject(newnodeSuccess);
//     });

//     test('applied correct delnode', () => {
//         let deltas = [[[{"op":"delnode","path":"lfo_1.sine_index","kind":"outlet","index":3}],[{"op":"delnode","path":"lfo_1.pulse","kind":"outlet","index":2}],[{"op":"delnode","path":"lfo_1.phasor","kind":"outlet","index":1}],[{"op":"delnode","path":"lfo_1.sine","kind":"outlet","index":0}],[{"op":"delnode","path":"lfo_1.onset","kind":"small_knob","range":[0,1],"taper":"linear","value":2.8,"unit":"float"}],[{"op":"delnode","path":"lfo_1.pulse_width","kind":"small_knob","range":[0,1],"taper":"linear","value":5,"unit":"float"}],[{"op":"delnode","path":"lfo_1.index","kind":"small_knob","range":[0,10],"taper":"linear","value":3,"unit":"float"}],[{"op":"delnode","path":"lfo_1.rate","kind":"large_knob","range":[0,80],"taper":"log 3.8","value":0.17,"unit":"Hz"}],[{"op":"delnode","path":"lfo_1.pulse_width_cv","kind":"inlet","index":2}],[{"op":"delnode","path":"lfo_1.phasor_sync","kind":"inlet","index":1}],[{"op":"delnode","path":"lfo_1.fm_cv","kind":"inlet","index":0}],{"op":"delnode","path":"lfo_1","kind":"lfo","pos":[-2.326367085370336,1.5209056349935186,-0.7035861792005239],"orient":[0.12358177055502231,0.41713355199484253,0.13623412932103282,0.8900378687419946]}]]
//         // ab = got.deepCopy(g);
//         let g1 = got.applyDeltasToGraph(g, [deltas])
//         expect(g1).toMatchObject(delnodeSuccess);
//     });



//     test('apply connect', () => {
//         let deltas = {"op": "connect", "paths": [ "lfo_1.sine", "lfo_1.phasor_sync"]}
//         // // // ab = got.deepCopy(g);
//         let g1 = got.applyDeltasToGraph(g, [deltas])
//         expect(g1).toMatchObject(connectSuccess);
//     });


//     test('apply unique disconnect', () => {
//         let deltas = {"op": "disconnect", "paths": [ "lfo_1.sine", "lfo_1.cv"]}
//         g1 = got.applyDeltasToGraph(g, [deltas])
//         expect(g1).toMatchObject(uniqueDisconnectSuccess);
//     });

// // fs.writeFileSync('graphTest.json', JSON.stringify(got.applyDeltasToGraph(g, [deltas]), null, '\t'))

//     test('apply repath', () => {
//         let deltas = {"op": "repath", "paths": [ "lfo_1.fm_cv", "lfo_1.sine"]}
//         g1 = got.applyDeltasToGraph(g, [deltas])
//         expect(g1).toMatchObject(repathSuccess);
//     }); 


})