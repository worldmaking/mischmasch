const got = require('../got.js');
let assert = require("assert");
let fs = require("fs")
const argv = require('yargs').argv
let g;
let g1;
let d;
// jest does this before running tests
describe('apply got, then apply inverse', () => {
  beforeAll(() => {
  })
  afterAll(() => {
    /* Runs after all tests */
  })
  beforeEach(() => {
    /* Runs before each test */
    d = JSON.parse(fs.readFileSync('__tests__/deltas/simple_scene.json'))
    g = got.graphFromDeltas(d)
    g1 = got.graphFromDeltas(d)})
  afterEach(() => {
    /* Runs after each test */
  })

  test('deltas to string', () => {
    expect(got.deltasToString(d)).toBe("newnode (lfo_1) kind=\"lfo\", pos=[-2.326367085370336,1.5209056349935186,-0.7035861792005239], orient=[0.12358177055502231,0.41713355199484253,0.13623412932103282,0.8900378687419946]\n  newnode (lfo_1.fm_cv) kind=\"inlet\", index=0\n  newnode (lfo_1.phasor_sync) kind=\"inlet\", index=1\n  newnode (lfo_1.pulse_width_cv) kind=\"inlet\", index=2\n  newnode (lfo_1.rate) kind=\"large_knob\", range=[0,80], taper=\"log 3.8\", value=0.17, unit=\"Hz\"\n  newnode (lfo_1.index) kind=\"small_knob\", range=[0,10], taper=\"linear\", value=3, unit=\"float\"\n  newnode (lfo_1.pulse_width) kind=\"small_knob\", range=[0,1], taper=\"linear\", value=5, unit=\"float\"\n  newnode (lfo_1.onset) kind=\"small_knob\", range=[0,1], taper=\"linear\", value=2.8, unit=\"float\"\n  newnode (lfo_1.sine) kind=\"outlet\", index=0\n  newnode (lfo_1.phasor) kind=\"outlet\", index=1\n  newnode (lfo_1.pulse) kind=\"outlet\", index=2\n  newnode (lfo_1.sine_index) kind=\"outlet\", index=3\nconnect (lfo_1.sine, lfo_1.fm_cv) \nconnect (lfo_1.sine, lfo_1.cv) ")
  });

  test('graph from deltas', () => {
    g = got.graphFromDeltas(d)
    g1 = {
      "nodes": {
        "lfo_1": {
          "_props": {
            "kind": "lfo",
            "pos": [
              -2.326367085370336,
              1.5209056349935186,
              -0.7035861792005239
            ],
            "orient": [
              0.12358177055502231,
              0.41713355199484253,
              0.13623412932103282,
              0.8900378687419946
            ]
          },
          "fm_cv": {
            "_props": {
              "kind": "inlet",
              "index": 0
            }
          },
          "phasor_sync": {
            "_props": {
              "kind": "inlet",
              "index": 1
            }
          },
          "pulse_width_cv": {
            "_props": {
              "kind": "inlet",
              "index": 2
            }
          },
          "rate": {
            "_props": {
              "kind": "large_knob",
              "range": [
                0,
                80
              ],
              "taper": "log 3.8",
              "value": 0.17,
              "unit": "Hz"
            }
          },
          "index": {
            "_props": {
              "kind": "small_knob",
              "range": [
                0,
                10
              ],
              "taper": "linear",
              "value": 3,
              "unit": "float"
            }
          },
          "pulse_width": {
            "_props": {
              "kind": "small_knob",
              "range": [
                0,
                1
              ],
              "taper": "linear",
              "value": 5,
              "unit": "float"
            }
          },
          "onset": {
            "_props": {
              "kind": "small_knob",
              "range": [
                0,
                1
              ],
              "taper": "linear",
              "value": 2.8,
              "unit": "float"
            }
          },
          "sine": {
            "_props": {
              "kind": "outlet",
              "index": 0
            }
          },
          "phasor": {
            "_props": {
              "kind": "outlet",
              "index": 1
            }
          },
          "pulse": {
            "_props": {
              "kind": "outlet",
              "index": 2
            }
          },
          "sine_index": {
            "_props": {
              "kind": "outlet",
              "index": 3
            }
          }
        }
      },
      "arcs": [
        [
          "lfo_1.sine",
          "lfo_1.fm_cv"
        ],
        [
          "lfo_1.sine",
          "lfo_1.cv"
        ]
      ]
    }
    expect(g).toEqual(g1);
  });

  test('invert deltas', () =>{
    let id = got.inverseDelta(d);
    let id2 = [
      {
        "op": "disconnect",
        "paths": [
          "lfo_1.sine",
          "lfo_1.cv"
        ]
      },
      {
        "op": "disconnect",
        "paths": [
          "lfo_1.sine",
          "lfo_1.fm_cv"
        ]
      },
      [
        [
          {
            "op": "delnode",
            "path": "lfo_1.sine_index",
            "kind": "outlet",
            "index": 3
          }
        ],
        [
          {
            "op": "delnode",
            "path": "lfo_1.pulse",
            "kind": "outlet",
            "index": 2
          }
        ],
        [
          {
            "op": "delnode",
            "path": "lfo_1.phasor",
            "kind": "outlet",
            "index": 1
          }
        ],
        [
          {
            "op": "delnode",
            "path": "lfo_1.sine",
            "kind": "outlet",
            "index": 0
          }
        ],
        [
          {
            "op": "delnode",
            "path": "lfo_1.onset",
            "kind": "small_knob",
            "range": [
              0,
              1
            ],
            "taper": "linear",
            "value": 2.8,
            "unit": "float"
          }
        ],
        [
          {
            "op": "delnode",
            "path": "lfo_1.pulse_width",
            "kind": "small_knob",
            "range": [
              0,
              1
            ],
            "taper": "linear",
            "value": 5,
            "unit": "float"
          }
        ],
        [
          {
            "op": "delnode",
            "path": "lfo_1.index",
            "kind": "small_knob",
            "range": [
              0,
              10
            ],
            "taper": "linear",
            "value": 3,
            "unit": "float"
          }
        ],
        [
          {
            "op": "delnode",
            "path": "lfo_1.rate",
            "kind": "large_knob",
            "range": [
              0,
              80
            ],
            "taper": "log 3.8",
            "value": 0.17,
            "unit": "Hz"
          }
        ],
        [
          {
            "op": "delnode",
            "path": "lfo_1.pulse_width_cv",
            "kind": "inlet",
            "index": 2
          }
        ],
        [
          {
            "op": "delnode",
            "path": "lfo_1.phasor_sync",
            "kind": "inlet",
            "index": 1
          }
        ],
        [
          {
            "op": "delnode",
            "path": "lfo_1.fm_cv",
            "kind": "inlet",
            "index": 0
          }
        ],
        {
          "op": "delnode",
          "path": "lfo_1",
          "kind": "lfo",
          "pos": [
            -2.326367085370336,
            1.5209056349935186,
            -0.7035861792005239
          ],
          "orient": [
            0.12358177055502231,
            0.41713355199484253,
            0.13623412932103282,
            0.8900378687419946
          ]
        }
      ]
    ]
    expect(id).toEqual(id2)
  })

  test('apply inverse deltas to graph', () =>{
    let id = [
      {
        "op": "disconnect",
        "paths": [
          "lfo_1.sine",
          "lfo_1.cv"
        ]
      },
      {
        "op": "disconnect",
        "paths": [
          "lfo_1.sine",
          "lfo_1.fm_cv"
        ]
      },
      [
        [
          {
            "op": "delnode",
            "path": "lfo_1.sine_index",
            "kind": "outlet",
            "index": 3
          }
        ],
        [
          {
            "op": "delnode",
            "path": "lfo_1.pulse",
            "kind": "outlet",
            "index": 2
          }
        ],
        [
          {
            "op": "delnode",
            "path": "lfo_1.phasor",
            "kind": "outlet",
            "index": 1
          }
        ],
        [
          {
            "op": "delnode",
            "path": "lfo_1.sine",
            "kind": "outlet",
            "index": 0
          }
        ],
        [
          {
            "op": "delnode",
            "path": "lfo_1.onset",
            "kind": "small_knob",
            "range": [
              0,
              1
            ],
            "taper": "linear",
            "value": 2.8,
            "unit": "float"
          }
        ],
        [
          {
            "op": "delnode",
            "path": "lfo_1.pulse_width",
            "kind": "small_knob",
            "range": [
              0,
              1
            ],
            "taper": "linear",
            "value": 5,
            "unit": "float"
          }
        ],
        [
          {
            "op": "delnode",
            "path": "lfo_1.index",
            "kind": "small_knob",
            "range": [
              0,
              10
            ],
            "taper": "linear",
            "value": 3,
            "unit": "float"
          }
        ],
        [
          {
            "op": "delnode",
            "path": "lfo_1.rate",
            "kind": "large_knob",
            "range": [
              0,
              80
            ],
            "taper": "log 3.8",
            "value": 0.17,
            "unit": "Hz"
          }
        ],
        [
          {
            "op": "delnode",
            "path": "lfo_1.pulse_width_cv",
            "kind": "inlet",
            "index": 2
          }
        ],
        [
          {
            "op": "delnode",
            "path": "lfo_1.phasor_sync",
            "kind": "inlet",
            "index": 1
          }
        ],
        [
          {
            "op": "delnode",
            "path": "lfo_1.fm_cv",
            "kind": "inlet",
            "index": 0
          }
        ],
        {
          "op": "delnode",
          "path": "lfo_1",
          "kind": "lfo",
          "pos": [
            -2.326367085370336,
            1.5209056349935186,
            -0.7035861792005239
          ],
          "orient": [
            0.12358177055502231,
            0.41713355199484253,
            0.13623412932103282,
            0.8900378687419946
          ]
        }
      ]
    ]

    let graph = got.applyDeltasToGraph(g, id)
    expect(graph).toEqual({ nodes: {}, arcs: [] })
  })

})

