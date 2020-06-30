const WebSocket = require('ws');
 
const ws = new WebSocket('ws://' + process.argv[2] + ':8081');
 
ws.on('open', function open() {
//   ws.send('something');
});
 
ws.on('message', function incoming(data) {
  console.log(data);
});