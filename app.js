const webSocket = require('ws');
const ip = require('ip');
const username = require('username')
const rws = require('reconnecting-websocket');
const thisMachine = username.sync()

let wsStatus = 0;
let peerCount = 0
let peerNames = []

let teapartyServer;

// eventually, app.js will maintain status of connected client(s) and report them to the teaparty
let vrClientStatus = null
let maxClientStatus = null
// for example, if someone wanted to observe a performance but not be a player:
let spectatorStatus = 0

const rwsOptions = {
  WebSocket: webSocket,
  connectionTimeout: 1000
}

process.env.PATH = [process.env.PATH, "/usr/local/bin"].join(":");

console.log('hostname', username.sync())

console.log('hostIP', ip.address())

let ws;

function wsConnect(){
  if (process.argv[2] === 'lan'){
    teapartyServer = process.argv[3]
    ws = new rws('ws://' + process.argv[3] + ':8090', [], rwsOptions);
  } else if (process.argv[2] === 'localhost'){
    teapartyServer = '127.0.0.1'
    ws = new rws('ws://localhost:8090', [], rwsOptions);
  } else {
    teapartyServer = ["http://teaparty.herokuapp.com/"];
    ws = new rws('ws://teaparty.herokuapp.com/8090', [], rwsOptions);
  }
}
wsConnect()

ws.addEventListener('open', () =>{
  console.log('websocket client opened')


  wsStatus = 1
  // inform the teaparty of important details
  let thisClient = JSON.stringify({
    cmd: 'newClient',
    data: 
      {
        username: thisMachine,
        ip: ip.address(),
        vr: vrClientStatus,
        sound: maxClientStatus,
        spectator: spectatorStatus
      },
    date: Date.now() 
  })

  ws.send(thisClient);
});


ws.addEventListener('message', (data) =>{
  
  msg = JSON.parse(data.data)
  cmd = msg.cmd
  //////////// these are messages broadcast to all clients from teaparty
  switch (cmd){
    // not in use at the moment, but might come in handy
    case "serverMsg":
      console.log('network update: ', msg.data)
    break
    case 'ping':
      // ignore this, the teaparty sends this as a hack to prevent heroku from stopping the dyno
    break

    // teaparty tells this app.js that a remote client is available to connect via p2p, or that this own instance has been registered
    case "addPeer":
      if (msg.data.username != thisMachine){
        console.log('add this peer to p2p mesh: ', msg.data)
      } else {
        console.log('the app.js instance on ' + thisMachine + ' is attending the tea party')
      }
    break
    // teaparty tells this app.js that a remote client is has disconnected, to break the connection, or that this own instance has been disconnected
    case "removePeer":
      if (msg.data != thisMachine){
        console.log('remove this peer from p2p mesh: ', msg.data)
      } else {
        console.log('this app.js has left the tea party')
      }
    break

    // lists all clients actively registered with the teaparty
    case 'network':
      console.log(msg)
    break

    default:
      console.log('\n\nFor developer: unhandled message from remote teaparty: ', msg)
    break
  }

});

function sendToteaparty(msg){
  if(wsStatus === 0){
    console.log('websocket client closed, did not send message:\n\n' + msg)
  } else{
    ws.send(msg)
  }
}




