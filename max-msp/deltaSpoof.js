
let delta = {
  "cmd" : "deltas",
  "date" : 1579284764858,
  "data" : [ 
    {
      op: 'propchange',
      kind: 'pos',
      path: 'speaker_1',
      from: [0.75, 1, 0],
      to: [1., 0.5, 0]
      }
    ]
  }
 
  const WebSocket = require('ws');


  const ReconnectingWebSocket = require('reconnecting-websocket');

  const options = {
      WebSocket: WebSocket, // custom WebSocket constructor
      connectionTimeout: 1000,
     // maxRetries: 10,
  };
  
  // create a ws connection which can automatically attempt reconnections if server goes down
  //let connection = new ReconnectingWebSocket('ws://192.168.137.1:8080/', [], options);
  let connection;
  console.log('node connecting to ip ' + process.argv[2])
  if (process.argv[2] === 'localhost'){
    
    connection  = new ReconnectingWebSocket('ws://localhost:8080/', [], options);
  
    } else if (process.argv[2] && process.argv[2] !== 'localhost'){
    
    connection = new ReconnectingWebSocket('ws://' + process.argv[2] + ':8080/', [], options);
  
  } else {
    console.log('\n\nERROR: websocket server host IP not provided.\nUse \'localhost\' or network IP')
    process.exit()
  }

  connection.send(JSON.stringify(delta));