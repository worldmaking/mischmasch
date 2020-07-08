const WebSocket = require('ws');
 
const ws = new WebSocket('ws://eastern-camp-281915.nn.r.appspot.com:8082');
 
ws.on('open', function open() {
  ws.send('something');
});
 
ws.on('message', function incoming(data) {
  console.log(data);
})

ws.on('error', function error(err){
    console.log(err)
})