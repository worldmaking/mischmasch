const WebSocket = require('ws');
 
const ws = new WebSocket('ws://174.93.84.70:8081');
 
ws.on('open', function open() {
  ws.send('something');
});
 
ws.on('message', function incoming(data) {
  console.log(data);
});