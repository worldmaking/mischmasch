let connection = { 
  "6b69be8b-c1f2-4e90-98f8-cd2cbd7e96e4": {
    "sync": "cable"
  }
}


let doc =
{
  "3ab0d984-a7cb-44a4-856f-e333d195b934": {
    "category": "abstraction",
    "inputs": [
      {
        "_props": {
          "index": 0,
          "kind": "inlet"
        },
        "name": "trig"
      },
      {
        "_props": {
          "index": 1,
          "kind": "inlet"
        },
        "name": "reset"
      }
    ],
    "name": "flipflop",
    "outputs": [
      {
        "_props": {
          "history": false,
          "index": 0,
          "kind": "outlet"
        },
        "connections": {},
        "name": "gate"
      },
      {
        "_props": {
          "history": false,
          "index": 1,
          "kind": "outlet"
        },
        "connections": {
          "6b69be8b-c1f2-4e90-98f8-cd2cbd7e96e4": {
            "sync": "cable"
          }
        },
        "name": "opentrig"
      },
      {
        "_props": {
          "history": false,
          "index": 2,
          "kind": "outlet"
        },
        "connections": {},
        "name": "closetrig"
      }
    ],
    "position": [
      -0.7641997337341309,
      1.8056508302688599,
      -1.296942114830017
    ],
    "quaternion": [
      -0.10935271432224007,
      0.45135196168107644,
      0.0466396190835992,
      0.8843913731473
    ],
    "uuid": "3ab0d984-a7cb-44a4-856f-e333d195b934"
  },
  "6b69be8b-c1f2-4e90-98f8-cd2cbd7e96e4": {
    "category": "abstraction",
    "inputs": [
      {
        "_props": {
          "kind": "knob",
          "range": [
            0.01,
            10
          ],
          "type": "float",
          "value": "1"
        },
        "name": "seconds"
      },
      {
        "_props": {
          "kind": "knob",
          "range": [
            -1,
            1
          ],
          "type": "float",
          "value": "0"
        },
        "name": "pulsewidth"
      },
      {
        "_props": {
          "index": 1,
          "kind": "inlet"
        },
        "name": "sync"
      }
    ],
    "name": "lfo",
    "outputs": [
      {
        "_props": {
          "history": false,
          "index": 0,
          "kind": "outlet"
        },
        "connections": {},
        "name": "ramp"
      },
      {
        "_props": {
          "history": false,
          "index": 1,
          "kind": "outlet"
        },
        "connections": {
          "3ab0d984-a7cb-44a4-856f-e333d195b934": {
            "trig": "cable"
          }
        },
        "name": "tri"
      },
      {
        "_props": {
          "history": false,
          "index": 2,
          "kind": "outlet"
        },
        "connections": {},
        "name": "pulse"
      },
      {
        "_props": {
          "history": false,
          "index": 3,
          "kind": "outlet"
        },
        "connections": {
          "6b69be8b-c1f2-4e90-98f8-cd2cbd7e96e4": {
            "sync": "history"
          }
        },
        "name": "sine"
      }
    ],
    "position": [
      -0.5480695366859436,
      1.818119764328003,
      -1.8259601593017578
    ],
    "quaternion": [
      -0.09629901009765686,
      0.3900032109437418,
      -0.0030909295239573797,
      0.9157589368058169
    ],
    "uuid": "6b69be8b-c1f2-4e90-98f8-cd2cbd7e96e4"
  }
}

let prop = Object.keys(doc).find(function(element){
  return element = "6b69be8b-c1f2-4e90-98f8-cd2cbd7e96e4"
})

console.log(prop)