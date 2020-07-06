const got = require('../got/got.js');
const app = require('../app.js');
let assert = require("assert");
let fs = require("fs")
let g;
let g1;
let d;
let ab;

const originalWarn = console.warn

let consoleOutput = []
const mockedWarn = output => mockedWarn.push(output)

// jest does this before running tests
describe('app.js: teaparty interaction', () => {
    beforeAll(() => {
    })
    afterAll(() => {
      /* Runs after all tests */
    })
    beforeEach(() => {
      /* Runs before each test */
      // d = JSON.parse(fs.readFileSync('__tests__/deltas/simple_scene.json'))
      // g = got.graphFromDeltas(d)
      // g1 = got.graphFromDeltas(d)

      console.warn = mockedWarn
    })
    afterEach(() => {
      /* Runs after each test */
      console.warn = originalWarn
    })


    test.only('connect to teaparty', () => {
      // return app.wsBrokerConnect().then(data => {
      //   expect(data).toBe('connected to teaparty');
      // });
      let teaparty = app.wsBrokerConnect()
      // fetchData(callback);
      expect(teaparty).toBe(Object)
    });


})

// describe('app.js: got nuclear option on malformed deltas', () => {
//   beforeAll(() => {
//   })
//   afterAll(() => {
//     /* Runs after all tests */
//   })
//   beforeEach(() => {
//     /* Runs before each test */
//     d = JSON.parse(fs.readFileSync('__tests__/deltas/simple_scene.json'))
//     g = got.graphFromDeltas(d)
//     g1 = got.graphFromDeltas(d)
//   })
//   afterEach(() => {
//     /* Runs after each test */
//   })



//   test('apply propchange', () => {
//       let deltas = {"op": "propchange","path": "lfo_1.rate", "name": "value","from": 0.17,"to": 0.7005339838596962,"timestamp": 1571343253980}
//       // // ab = got.deepCopy(g);
//       let g1 =  got.applyDeltasToGraph(g, [deltas]);
//       expect(g1).toBe('object');

//   });

// })