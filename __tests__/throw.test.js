const got = require('../got/got.js');
let assert = require("assert");
let fs = require("fs")
const argv = require('yargs').argv

const func = require('./throw.js')


let g;
let g1;
let d;
let ab;
// jest does this before running tests
describe('acceptable deltas', () => {
    beforeAll(() => {
    })
    afterAll(() => {
      /* Runs after all tests */
    })
    beforeEach(() => {
      /* Runs before each test */
      d = JSON.parse(fs.readFileSync('__tests__/deltas/simple_scene.json'))
    })
    afterEach(() => {
      /* Runs after each test */
    })

    it('should throw an', () => {
       
        // it('should throw an error', () => {
            expect(func).toThrow()
        //   })
    })
    // test('setup initial scene', () => {
    //     expect(typeof got.deltasToString(d)).toBe('string');
    //     g = got.graphFromDeltas(d)
    //     g1 = got.graphFromDeltas(d)
    //     expect(typeof g).toBe('object');
    //     expect(got.deepEqual(g, g1)).toBe(true)
    //     expect(got.deepEqual(got.deltasFromGraph(g, []), got.deltasFromGraph(g1, []))).toBe(true)
    // });

    // test('apply propchange', () => {
    //     let deltas = {"op": "propchange","path": "lfo_1.rate", "name": "value","from": 0.17,"to": 0.7005339838596962,"timestamp": 1571343253980}
    //     // // ab = got.deepCopy(g);
    //     got.applyDeltasToGraph(g, [deltas]);

    // });

    // test('apply unique newnode', () => {
    //     let deltas = [[{"op":"newnode","path":"lfo_2","kind":"lfo","pos":[-2.326367085370336,1.5209056349935186,-0.7035861792005239],"orient":[0.12358177055502231,0.41713355199484253,0.13623412932103282,0.8900378687419946]},[{"op":"newnode","path":"lfo_2.fm_cv","kind":"inlet","index":0}],[{"op":"newnode","path":"lfo_2.phasor_sync","kind":"inlet","index":1}],[{"op":"newnode","path":"lfo_2.pulse_width_cv","kind":"inlet","index":2}],[{"op":"newnode","path":"lfo_2.rate","kind":"large_knob","range":[0,80],"taper":"log 3.8","value":0.17,"unit":"Hz"}],[{"op":"newnode","path":"lfo_2.index","kind":"small_knob","range":[0,10],"taper":"linear","value":3,"unit":"float"}],[{"op":"newnode","path":"lfo_2.pulse_width","kind":"small_knob","range":[0,1],"taper":"linear","value":5,"unit":"float"}],[{"op":"newnode","path":"lfo_2.onset","kind":"small_knob","range":[0,1],"taper":"linear","value":2.8,"unit":"float"}],[{"op":"newnode","path":"lfo_2.sine","kind":"outlet","index":0}],[{"op":"newnode","path":"lfo_2.phasor","kind":"outlet","index":1}],[{"op":"newnode","path":"lfo_2.pulse","kind":"outlet","index":2}],[{"op":"newnode","path":"lfo_2.sine_index","kind":"outlet","index":3}]]]
    //     // // ab = got.deepCopy(g);
    //     got.applyDeltasToGraph(g, [deltas])
    //     expect(typeof g).toBe('object');
    // });

    // test('apply delnode', () => {
    //     let deltas = [[[{"op":"delnode","path":"lfo_2.sine_index","kind":"outlet","index":3}],[{"op":"delnode","path":"lfo_2.pulse","kind":"outlet","index":2}],[{"op":"delnode","path":"lfo_2.phasor","kind":"outlet","index":1}],[{"op":"delnode","path":"lfo_2.sine","kind":"outlet","index":0}],[{"op":"delnode","path":"lfo_2.onset","kind":"small_knob","range":[0,1],"taper":"linear","value":2.8,"unit":"float"}],[{"op":"delnode","path":"lfo_2.pulse_width","kind":"small_knob","range":[0,1],"taper":"linear","value":5,"unit":"float"}],[{"op":"delnode","path":"lfo_2.index","kind":"small_knob","range":[0,10],"taper":"linear","value":3,"unit":"float"}],[{"op":"delnode","path":"lfo_2.rate","kind":"large_knob","range":[0,80],"taper":"log 3.8","value":0.17,"unit":"Hz"}],[{"op":"delnode","path":"lfo_2.pulse_width_cv","kind":"inlet","index":2}],[{"op":"delnode","path":"lfo_2.phasor_sync","kind":"inlet","index":1}],[{"op":"delnode","path":"lfo_2.fm_cv","kind":"inlet","index":0}],{"op":"delnode","path":"lfo_2","kind":"lfo","pos":[-2.326367085370336,1.5209056349935186,-0.7035861792005239],"orient":[0.12358177055502231,0.41713355199484253,0.13623412932103282,0.8900378687419946]}]]
    //     // // ab = got.deepCopy(g);
    //     got.applyDeltasToGraph(g, [deltas])
    //     expect(typeof g).toBe('object');
    // });



    // test('apply connect', () => {
    //     let deltas = {"op": "connect", "paths": [ "lfo_1.sine", "lfo_1.phasor_sync"]}
    //     // // // ab = got.deepCopy(g);
    //     got.applyDeltasToGraph(g, [deltas])
    //     expect(typeof g).toBe('object');
    // });


    // test('apply unique disconnect', () => {
    //     let deltas = {"op": "disconnect", "paths": [ "lfo_1.sine", "lfo_1.cv"]}
    //     got.applyDeltasToGraph(g, [deltas])
    //     expect(typeof g).toBe('object');
    // });



    // test('apply repath', () => {
    //     let deltas = {"op": "repath", "paths": [ "lfo_1.sine", "lfo_1.sineBank"]}
    //     // // ab = got.deepCopy(g);
    //     got.applyDeltasToGraph(g, [deltas])
    //     expect(typeof g).toBe('object');
    // }); 


})

// describe('incorrect deltas', () => {
//     beforeAll(() => {
//     })
//     afterAll(() => {
//       /* Runs after all tests */
//     })
//     beforeEach(() => {
//       /* Runs before each test */
//       d = JSON.parse(fs.readFileSync('__tests__/deltas/simple_scene.json'))
//     })
//     afterEach(() => {
//       /* Runs after each test */
//     })

//     test('reject propchange to nonexistent path', () => {
//         let deltas = {"op": "propchange","path": "lfo_1.michael", "name": "value","from": 0.17,"to": 0.7005339838596962,"timestamp": 1571343253980}
//         // // ab = got.deepCopy(g);
//         got.applyDeltasToGraph(g, [deltas]);
//     });

//     test('reject propchange with incorrect value', () => {
//         let deltas = {"op": "propchange","path": "lfo_1.rate", "name": "value","from": 0.78,"to": 0.7005339838596962,"timestamp": 1571343253980}
//         // ab = got.deepCopy(g);
//         got.applyDeltasToGraph(g, [deltas]);
//     });

//     test('reject duplicate newnode', () => {
//         let deltas = JSON.parse(fs.readFileSync('__tests__/deltas/newnode.json'))
//         // ab = got.deepCopy(g);
//         got.applyDeltasToGraph(g, [deltas])
//         expect(typeof g).toBe('object');
//     });


//     test('reject duplicate connect', () => {
//         let deltas = {"op": "connect", "paths": [ "lfo_1.sine", "lfo_1.cv"]}
//         got.applyDeltasToGraph(g, [deltas])
//         expect(typeof g).toBe('object');
//     });

//     test('reject disconnect on nonexistent path', () => {
//         let deltas = {"op": "disconnect", "paths": [ "lfo_1.sine", "lfo_1.rate"]}
//         got.applyDeltasToGraph(g, [deltas])
//         expect(typeof g).toBe('object');
//     });

// })