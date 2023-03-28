// speaker, phasor, train
let funzo = {
  "4614e4e247cb428397f39a6c11c015ae": {
    "category": "speaker",
    "inputs": [
      {
        "_props": {
          "index": 0,
          "kind": "inlet",
          "range": [
            -1,
            1
          ]
        },
        "index": 0,
        "kind": "inlet",
        "name": "audio"
      }
    ],
    "name": "speaker",
    "outputs": [],
    "position": [
      0.4963545501232147,
      1.918148159980774,
      -1.0676943063735962
    ],
    "quaternion": [
      0.10615726193832999,
      -0.14827140997441468,
      -0.03335743388383641,
      0.9826665354209653
    ],
    "uuid": "4614e4e247cb428397f39a6c11c015ae"
  },
  "29eb8c722de94e0394f06219bad6647b": {
    "category": "source",
    "inputs": [
      {
        "_props": {
          "index": 0,
          "kind": "knob",
          "range": [
            -10,
            7
          ],
          "value": 0.7706815213787781
        },
        "index": 0,
        "kind": "knob",
        "name": "freq",
        "range": [
          -10,
          7
        ],
        "trim": "add",
        "value": 0.7706815213787781
      },
      {
        "_props": {
          "index": 1,
          "kind": "knob",
          "range": [
            0,
            1
          ],
          "value": 0.16684976456107503
        },
        "index": 1,
        "kind": "knob",
        "name": "width",
        "range": [
          0,
          1
        ],
        "trim": "add",
        "value": 0.16684976456107503
      }
    ],
    "name": "train",
    "outputs": [
      {
        "_props": {
          "history": false,
          "index": 0,
          "kind": "outlet"
        },
        "connections": {
          "4614e4e247cb428397f39a6c11c015ae": {
            "audio": "cable"
          }
        },
        "name": "out1"
      }
    ],
    "position": [
      0.08591998368501663,
      1.9532592296600342,
      -0.9937823414802551
    ],
    "quaternion": [
      0.23206047473984479,
      0.1971046287688853,
      -0.003900848163891672,
      0.9525137762873106
    ],
    "uuid": "29eb8c722de94e0394f06219bad6647b"
  },
  "de824969ed9540f2915d80bb0b924923": {
    "category": "source",
    "inputs": [
      {
        "_props": {
          "index": 0,
          "kind": "knob",
          "range": [
            -10,
            7
          ],
          "value": -4.269799838767161
        },
        "index": 0,
        "kind": "knob",
        "name": "freq",
        "range": [
          -10,
          7
        ],
        "trim": "add",
        "value": -4.269799838767161
      },
      {
        "_props": {
          "index": 1,
          "kind": "inlet",
          "range": [
            0,
            1
          ],
          "value": 0
        },
        "index": 1,
        "kind": "inlet",
        "name": "reset"
      }
    ],
    "name": "phasor",
    "outputs": [
      {
        "_props": {
          "history": false,
          "index": 0,
          "kind": "outlet"
        },
        "connections": {
          "29eb8c722de94e0394f06219bad6647b": {
            "freq": "cable"
          }
        },
        "name": "phase"
      }
    ],
    "position": [
      -0.13064013421535492,
      2.04113507270813,
      -0.7197325229644775
    ],
    "quaternion": [
      0.3206894384331359,
      0.3737659365685298,
      -0.07691454777228311,
      0.8669149555493271
    ],
    "uuid": "de824969ed9540f2915d80bb0b924923"
  }
}

export { funzo }