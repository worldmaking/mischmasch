const { v4: uuidv4 } = require('uuid');

module.exports = class FeedbackCable{

  constructor(dst, input, type){
    this.cable = {}
    this.id = uuidv4().replace(/-/g, "")
    this.bufferName = `ssd_buffer_${this.id}`
    this.cable = {
      "category": "delay",
      "inputs": [
        {
          "_props": {
            "index": 0,
            "kind": "buffer",
            "range": [
              0,
              100
            ],
            "value": 0
          },
          "index": 0,
          "kind": "buffer",
          "name": "name",
          "range": [
            0,
            100
          ],
          "trim": "add",
          "value": 0
        },
        {
          "_props": {
            "index": 1,
            "kind": "inlet",
            "range": [
              1,
              2
            ],
            "value": 1
          },
          "index": 1,
          "kind": "inlet",
          "name": "value"
        }
      ],
      "name": "history",
      "outputs": [
        {
          "_props": {
            "history": false,
            "index": 0,
            "kind": "outlet"
          },
          "connections": {},
          "name": "out1"
        }
      ],
      "position": [
        -0.8165416255546141,
        0.9931506849315068,
        -0.7936076286083759
      ],
      "quaternion": [
        0,
        0.5555702330196022,
        0,
        0.8314696123025452
      ],
      "uuid": this.id
    }
    this.cable.outputs[0].connections[dst] = {}
    this.cable.outputs[0].connections[dst][input] = type
  }
}