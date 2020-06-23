const WebSocket = require('ws')

url = 'ws://localhost:8080'
socket = new WebSocket(url)
socket.binaryType = 'arraybuffer';
socket.onopen = () => {
    console.log("websocket connected to "+url);
    socket.send(JSON.stringify({ cmd:"get_scene"})) 
}
socket.onerror = (error) => {
  console.error(`WebSocket error: ${error}`)
}
socket.onclose = function(e) {
    socket = null;
    console.log("websocket disconnected from "+url);
    setTimeout(function(){
        console.log("websocket reconnecting");
        serverConnect();
    }, 2000);		
}
socket.onmessage = (e) => {
    if (e.data instanceof ArrayBuffer) {
        console.log("ws received arraybuffer of " + e.data.byteLength + " bytes")
    } else {
        let msg = e.data;
        try {
            msg = JSON.parse(msg);
        } catch(e) {}
        onServerMessage(msg, socket);
    } 
}
// }

function onServerMessage(msg, sock) {
switch (msg.cmd) {
    case "deltas": {
        // insert into our TODO list:
        incomingDeltas.push.apply(incomingDeltas, msg.data);
    } break;

    // server assigns an iid for our session. use this to route controller and HMD data to local max client. 
    // case "assignID":{
         
    // }
    // break
    // case "contexts":{
    //     console.log(msg.data)
    //     vrContextID = msg.data.vrContext
    //     audioContextID = msg.data.audioContext
    // }
    break;
    default:
       console.log("received JSON", msg, typeof msg);
}
}