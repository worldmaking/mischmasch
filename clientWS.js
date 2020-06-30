const WebSocket = require('ws')
const wrtc = require('wrtc');
const Coven = require('coven');
const ws = require('ws');
const path = require('path')
const filename = path.basename(__filename)
let p2pDataChannel;

function serverConnect(){


    url = 'ws://localhost:8080'
    socket = new WebSocket(url)
    socket.binaryType = 'arraybuffer';
    socket.onopen = () => {
        console.log("websocket connected to "+url);
        socket.send(JSON.stringify({ cmd:"get_scene"})) 
    }
    socket.onerror = (error) => {
    console.error(JSON.stringify(error))
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
}

serverConnect()

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
    // the p2p won't run until the app.js passes along who is running as host:
    case "p2pSignalServer":
        let ip = msg.data.ip
        let port = msg.data.port
        p2pDataChannel = new Coven({ ws, wrtc, signaling: 'ws://' + ip + ':' + port });
        p2pDataChannel
            .on('message', ({ peerId, message }) => console.log(`${peerId}: ${message}`))
            .on('connection', pid => {
                console.log(pid, p2pDataChannel.activePeers);
                
                // we use the filename var to route which client should get what message. alternately, could create a 2nd datachannel...
                let p2pMsg = JSON.stringify({
                    cmd: 'hello',
                    source: filename,
                    message: 'meow'
                })
                p2pDataChannel.sendTo(pid, p2pMsg);
            })
            .on('error', () =>{
                JSON.parse(console.error)
            });

    break;
    default:
       console.log("received JSON", msg, typeof msg);
    }
}

