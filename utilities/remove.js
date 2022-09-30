let graph = {
  "2d13fca1a2db4c8f8401cc26877da333": {
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
      -0.3080175220966339,
      1.626819372177124,
      -1.468716025352478
    ],
    "quaternion": [
      -0.012138617634373359,
      0.17837472841977034,
      -0.08233421786636864,
      0.9804367182376236
    ],
    "uuid": "2d13fca1a2db4c8f8401cc26877da333"
  },
  "a691911670704e69bde96afcb04f1abf": {
    "category": "source",
    "inputs": [
      {
        "_props": {
          "index": 0,
          "kind": "knob",
          "range": [
            0.005,
            10
          ],
          "value": 8.676091470044497
        },
        "index": 0,
        "kind": "knob",
        "name": "freq",
        "range": [
          0.005,
          10
        ],
        "trim": "add",
        "value": 8.676091470044497
      },
      {
        "_props": {
          "index": 1,
          "kind": "inlet",
          "range": [
            0,
            1
          ],
          "value": 8.676091470044497
        },
        "index": 1,
        "kind": "inlet",
        "name": "reset",
        "value": 8.676091470044497
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
          "8c5839f937cf47c8941344e4997f771a": {
            "freq": "cable"
          }
        },
        "name": "phase"
      }
    ],
    "position": [
      -0.7807492017745972,
      1.7259478569030762,
      -1.3225374221801758
    ],
    "quaternion": [
      0.19456690282526162,
      0.4339877247603208,
      -0.1329683503461066,
      0.8695503555011107
    ],
    "uuid": "a691911670704e69bde96afcb04f1abf"
  },
  "8c5839f937cf47c8941344e4997f771a": {
    "category": "source",
    "inputs": [
      {
        "_props": {
          "index": 0,
          "kind": "knob",
          "range": [
            0.1,
            10
          ],
          "value": 8.974071586327522
        },
        "index": 0,
        "kind": "knob",
        "name": "freq",
        "range": [
          0.1,
          10
        ],
        "trim": "add",
        "value": 8.974071586327522
      },
      {
        "_props": {
          "index": 1,
          "kind": "inlet",
          "range": [
            0,
            1
          ],
          "value": 8.974071586327522
        },
        "index": 1,
        "kind": "inlet",
        "name": "reset",
        "value": 8.974071586327522
      }
    ],
    "name": "cycle",
    "outputs": [
      {
        "_props": {
          "history": false,
          "index": 0,
          "kind": "outlet"
        },
        "connections": {
          "2d13fca1a2db4c8f8401cc26877da333": {
            "audio": "cable"
          },
          "a691911670704e69bde96afcb04f1abf": {
            "reset": "cable"
          }
        },
        "name": "sinusoid"
      }
    ],
    "position": [
      -0.8838728666305542,
      1.6281023025512695,
      -0.9980221390724182
    ],
    "quaternion": [
      0.20886022802350937,
      0.6369753253875059,
      -0.14179609452785547,
      0.7283774311950588
    ],
    "uuid": "8c5839f937cf47c8941344e4997f771a"
  },
  "56abae0e4d8f47ea9dd05f69d9bae80f": {
    "category": "source",
    "inputs": [
      {
        "_props": {
          "index": 0,
          "kind": "knob",
          "range": [
            0.005,
            10
          ],
          "value": 3
        },
        "index": 0,
        "kind": "knob",
        "name": "freq",
        "range": [
          0.005,
          10
        ],
        "trim": "add",
        "value": 3
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
          "a691911670704e69bde96afcb04f1abf": {
            "freq": "cable"
          }
        },
        "name": "phase"
      }
    ],
    "position": [
      -0.6058958768844604,
      1.722747802734375,
      -1.511444330215454
    ],
    "quaternion": [
      0.27805098067576034,
      0.3360859674734938,
      -0.20318713600434368,
      0.8766121557593821
    ],
    "uuid": "56abae0e4d8f47ea9dd05f69d9bae80f"
  }
}


let payload = 'a691911670704e69bde96afcb04f1abf'
for(let m = 0; m < Object.keys(graph).length; m++){
  let op = graph[Object.keys(graph)[m]]
  let outputs = op.outputs
  for(let i = 0; i< outputs.length; i++){
    for(let j = 0; j< Object.keys(outputs[i].connections).length; j++){
      if(Object.keys(outputs[i].connections)[j] == payload){
        delete outputs[i].connections[Object.keys(outputs[i].connections)[j]]
        // delete the connection

      }
    }
  }
}
