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

test('setup initial scene', () => {
    expect(typeof got.deltasToString(d)).toBe('string');
    g = got.graphFromDeltas(d)
    g1 = got.graphFromDeltas(d)
    expect(typeof g).toBe('object');
    expect(got.deepEqual(g, g1)).toBe(true)
    expect(got.deepEqual(got.deltasFromGraph(g, []), got.deltasFromGraph(g1, []))).toBe(true)
});

test('apply op.propchange', () => {
    let deltas = {"op": "propchange","path": "lfo_1.rate", "name": "value","from": 0.17,"to": 0.7005339838596962,"timestamp": 1571343253980}
    let ab = got.deepCopy(g);
    got.applyDeltasToGraph(ab, [deltas]);
});

test('apply op.propchange to nonexistent path', () => {
    let deltas = {"op": "propchange","path": "lfo_1.michael", "name": "value","from": 0.17,"to": 0.7005339838596962,"timestamp": 1571343253980}
    let ab = got.deepCopy(g);
    got.applyDeltasToGraph(ab, [deltas]);
});

test('apply op.propchange with incorrect value', () => {
    let deltas = {"op": "propchange","path": "lfo_1.rate", "name": "value","from": 0.78,"to": 0.7005339838596962,"timestamp": 1571343253980}
    let ab = got.deepCopy(g);
    got.applyDeltasToGraph(ab, [deltas]);
});

test('apply unique op.newnode', () => {
    let deltas = JSON.parse(fs.readFileSync('__tests__/deltas/newnode.unique.json'))
    let ab = got.deepCopy(g);
    got.applyDeltasToGraph(ab, [deltas])
    expect(typeof ab).toBe('object');
});

test('apply duplicate op.newnode', () => {
    let deltas = JSON.parse(fs.readFileSync('__tests__/deltas/newnode.json'))
    let ab = got.deepCopy(g);
    got.applyDeltasToGraph(ab, [deltas])
    expect(typeof ab).toBe('object');
});

test('apply op.delnode', () => {
    let deltas = JSON.parse(fs.readFileSync('__tests__/deltas/delnode.json'))
    let ab = got.deepCopy(g);
    got.applyDeltasToGraph(ab, [deltas])
    expect(typeof ab).toBe('object');
});

test('apply op.connect', () => {
    let deltas = {"op": "connect", "paths": [ "lfo_1.sine", "lfo_1.phasor_sync"]}
    // let ab = got.deepCopy(g);
    got.applyDeltasToGraph(g, [deltas])
    expect(typeof g).toBe('object');
});

test('apply duplicate op.connect', () => {
    let deltas = {"op": "connect", "paths": [ "lfo_1.sine", "lfo_1.cv"]}
    got.applyDeltasToGraph(g, [deltas])
    expect(typeof g).toBe('object');
});

test('apply unique op.disconnect', () => {
    let deltas = {"op": "disconnect", "paths": [ "lfo_1.sine", "lfo_1.cv"]}
    got.applyDeltasToGraph(g, [deltas])
    expect(typeof g).toBe('object');
});

test('apply op.disconnect on nonexistent path', () => {
    let deltas = {"op": "disconnect", "paths": [ "lfo_1.sine", "lfo_1.rate"]}
    got.applyDeltasToGraph(g, [deltas])
    expect(typeof g).toBe('object');
});

test('apply repath', () => {
    let deltas = {"op": "repath", "paths": [ "lfo_1.sine", "lfo_1.sineBank"]}
    let ab = got.deepCopy(g);
    got.applyDeltasToGraph(ab, [deltas])
    expect(typeof ab).toBe('object');
}); 

