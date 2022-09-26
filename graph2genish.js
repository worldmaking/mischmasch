let graph = {
    "71624ca3-1465-42a2-ba7b-73bff030086e": {
      "category": "source",
      "inputs": [
        {
          "_props": {
            "index": 0,
            "kind": "inlet"
          },
          "name": "freq"
        },
        {
          "_props": {
            "index": 1,
            "kind": "inlet"
          },
          "name": "phase"
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
            "48a3c67a-1f82-4c7c-a54e-944f62f4567d": {
              "freq": "cable"
            }
          },
          "name": "out1"
        },
        {
          "_props": {
            "history": false,
            "index": 1,
            "kind": "outlet"
          },
          "connections": {},
          "name": "out2"
        }
      ],
      "position": [
        0.3747916519641876,
        1.6486183404922485,
        -1.412360668182373
      ],
      "quaternion": [
        0.07021407425411384,
        -0.27171729228014174,
        0.005961854776044823,
        0.9597937969259097
      ],
      "uuid": "71624ca3-1465-42a2-ba7b-73bff030086e"
    },
    "48a3c67a-1f82-4c7c-a54e-944f62f4567d": {
      "category": "source",
      "inputs": [
        {
          "_props": {
            "index": 0,
            "kind": "inlet"
          },
          "name": "freq"
        },
        {
          "_props": {
            "index": 1,
            "kind": "inlet"
          },
          "name": "phase"
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
          "connections": {},
          "name": "out1"
        },
        {
          "_props": {
            "history": false,
            "index": 1,
            "kind": "outlet"
          },
          "connections": {},
          "name": "out2"
        }
      ],
      "position": [
        0.6051448583602905,
        1.6397514343261719,
        -1.2468757629394531
      ],
      "quaternion": [
        0.05902307659135185,
        -0.39606825426548437,
        -0.0058165816976738895,
        0.9163036426121353
      ],
      "uuid": "48a3c67a-1f82-4c7c-a54e-944f62f4567d"
    }
}

let nodes = Object.keys(graph)

console.log(nodes)

