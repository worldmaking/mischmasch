// NOTE: The heroku app 'teaparty' will go to sleep if it goes 30 minutes before 
// receiving a connection request from an app.js. So, when you run app.js don't be 
// surprised if it takes 10-20 seconds to receive a response from teaparty

const webSocket = require('ws');
const publicIP = require('public-ip');
const username = require('username')
const rws = require('reconnecting-websocket');
const ProgressBar = require('progress');



let ipv4;
let ipv6;
 
(async () => {
    ipv4 = await publicIP.v4()
    //=> '46.5.21.123'

    ipv6 = await publicIP.v6()
    // //=> 'fe80::200:f8ff:fe21:67cf'
})();


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

// fix for OSX because /usr/local/bin is not inherited by the Node.js script 
// (.bash etc. profile is not inherited automatically)
//process.env.PATH = [process.env.PATH, "/usr/local/bin"].join(":");

console.log('hostname', username.sync())

console.log('hostIP', ipv4)

let ws;
let timer;

// attempt to connect to a teaparty server
function wsConnect(){
  if (process.argv[2] === 'lan'){
    teapartyServer = process.argv[3]
    ws = new rws('ws://' + process.argv[3] + ':8090', [], rwsOptions);
    var bar = new ProgressBar(':bar', { total: 25 });
    console.log('attempting to connect to teaparty:\n')
    timer = setInterval(function () {
    bar.tick();
    if (bar.complete) {
        clearInterval(timer)
        console.log('connection timeout: teaparty server on ' + process.argv[3] + ' might be down')
        process.exit()
    }
    }, 1000);
  } else if (process.argv[2] === 'localhost'){
    teapartyServer = '127.0.0.1'
    ws = new rws('ws://localhost:8090', [], rwsOptions);
    var bar = new ProgressBar(':bar', { total: 25 });
    console.log('attempting to connect to teaparty:\n')
    timer = setInterval(function () {
    bar.tick();
    if (bar.complete) {
        clearInterval(timer)
        console.log('connection timeout: teaparty server on localhost might be down')
        process.exit()
    }
    }, 1000);
  } else {
    teapartyServer = ["http://teaparty.herokuapp.com/"];
    ws = new rws('ws://teaparty.herokuapp.com/8090', [], rwsOptions);
    var bar = new ProgressBar(':bar', { total: 25 });
    console.log('attempting to connect to teaparty:\n')
    timer = setInterval(function () {
    bar.tick();
    if (bar.complete) {
        clearInterval(timer)
        console.log('connection timeout: teaparty server on heroku app might be down')
        process.exit()
    }
    }, 1000);
  }
}
wsConnect()

wsConnect();

ws.addEventListener('open', () =>{
  console.log('\nconnected to teaparty\n\n')
  clearInterval(timer)

  wsStatus = 1
  // inform the teaparty of important details
  let thisClient = JSON.stringify({
    cmd: 'newClient',
    data: 
      {
        username: thisMachine,
        ip: ipv4,
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
<<<<<<< HEAD

=======
>>>>>>> code commenting
