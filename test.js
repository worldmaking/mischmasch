

      let obj = {
        "f490da5cdfe0479680ae57e7bd8d43d6": {
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
            0.04373663663864136,
            1.5785640478134155,
            -1.4863920211791992
          ],
          "quaternion": [
            -0.07822894598525577,
            0.3131609969378115,
            0.0217710121153631,
            0.9462221986120759
          ],
          "uuid": "f490da5cdfe0479680ae57e7bd8d43d6"
        },
        "6fd0d5a7109644938ed2541fb2ed42dc": {
          "category": "mathemagical",
          "inputs": [
            {
              "_props": {
                "index": 0,
                "kind": "inlet",
                "range": [
                  0,
                  1
                ],
                "value": 0
              },
              "index": 0,
              "kind": "inlet",
              "name": "value1"
            },
            {
              "_props": {
                "index": 1,
                "kind": "knob",
                "range": [
                  0,
                  1
                ],
                "value": 0
              },
              "index": 1,
              "kind": "knob",
              "name": "value2",
              "range": [
                0,
                1
              ],
              "trim": "add",
              "value": 0
            }
          ],
          "name": "lte",
          "outputs": [
            {
              "_props": {
                "history": false,
                "index": 0,
                "kind": "outlet"
              },
              "connections": {
                "4eacd4e411f14d8e8bddc79f5161680d": {
                  "time": "cable"
                }
              },
              "name": "out1"
            }
          ],
          "position": [
            -0.6577974557876587,
            1.918928623199463,
            -1.6728585958480835
          ],
          "quaternion": [
            0.02133823753845814,
            0.37604131011275,
            0.010482844840590642,
            0.9262978703139099
          ],
          "uuid": "6fd0d5a7109644938ed2541fb2ed42dc"
        }
      }

      


      const recursiveRemoveKey = (object, deleteKey) => {
        delete object[deleteKey];
        
        Object.values(object).forEach((val) => { 
          if (typeof val !== 'object') return;
          
          recursiveRemoveKey(val, deleteKey);
        })
      }
      
      recursiveRemoveKey(obj, '4eacd4e411f14d8e8bddc79f5161680d');
      
      console.log(obj);

            prettyPrint(obj)

      function prettyPrint(object){
        console.log(JSON.stringify(object, null, 4))
      }