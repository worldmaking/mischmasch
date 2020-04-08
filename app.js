// NOTE: The heroku app 'teaparty' will go to sleep if it goes 30 minutes before 
// receiving a connection request from an app.js. So, when you run app.js don't be 
// surprised if it takes 10-20 seconds to receive a response from teaparty

// most widely-used websocket module for node.js
const webSocket = require('ws');
// 
const publicIP = require('public-ip');
// https://www.npmjs.com/package/username Get the username of the current user
// It first tries to get the username from the SUDO_USER LOGNAME USER LNAME USERNAME environment letiables. Then falls back to $ id -un on macOS / Linux and $ whoami on Windows, in the rare case none of the environment letiables are set. The result is cached.
const username = require('username')
// https://www.npmjs.com/package/reconnecting-websocket WebSocket that will automatically reconnect if the connection is closed
const ReconnectingWebSocket = require('reconnecting-websocket');
// https://www.npmjs.com/package/progress
// cute way to show progress on the command line
const ProgressBar = require('progress');

// fix for OSX because /usr/local/bin is not inherited by the Node.js script 
// (.bash etc. profile is not inherited automatically)
//process.env.PATH = [process.env.PATH, "/usr/local/bin"].join(":");

// list of peers as notifed from the broker:
let peers = {};

// figure out where the broker for to the teaparty is?
let isConnectedToBroker = 0; // becomes 1 when connected to broker
const teapartyBrokerAddress = 
    (process.argv[2] === 'lan' && process.argv[3]) ? process.argv[3]
  : (process.argv[2] === 'localhost') ? '127.0.0.1'
  : "teaparty.herokuapp.com";
const teapartyBrokerWebsocketPort = '8090';
const teapartyBrokerWebsocketAddress = `ws://${teapartyBrokerAddress}/:${teapartyBrokerWebsocketPort}`;

const rwsOptions = {
  // make rws use the webSocket module implementation
  WebSocket: webSocket, 
  // ms to try reconnecting:
  connectionTimeout: 1000,
  //debug:true, 
}


// attempt to connect to teaparty broker
// returns the websocket via a Promise
function wsBrokerConnect() {
  return new Promise((resolve, reject) => {
    // create a websocket to find out who is at the teaparty:
    console.log(`attempting to connect to teaparty at ${teapartyBrokerWebsocketAddress}`)
    let wsBroker = new ReconnectingWebSocket(teapartyBrokerWebsocketAddress, [], rwsOptions);
    // show a progress bar while connecting:
    let bar = new ProgressBar(':bar', { total: 25 });
    let progressBarTimer = setInterval(function () {
      bar.tick();
      if (bar.complete) {
          clearInterval(progressBarTimer)
          console.log(`connection timeout: ${teapartyBrokerAddress} might be down`)
          // TODO: should it give up like this, or maybe ask user if they want to retry?
          reject();
      }
    }, 1000);

    // fail the promise if the server responds with an error
    wsBroker.addEventListener('error', () => {
      clearInterval(progressBarTimer); 
      reject();
    });
    
    // on successful connection to broker:
    wsBroker.addEventListener('open', () => {
      clearInterval(progressBarTimer);
      resolve(wsBroker);
    });
  });
}



let thisClientConfiguration = {
  // get a username for this machine:
  username: username.sync(),
  // ip is figured out during init()
  ip: null, 
  // eventually, app.js will maintain status of connected client(s) and report them to the teaparty
  vr: null,
  sound: null,
  // for example, if someone wanted to observe a performance but not be a player:
  spectator: 0
};

// run everything inside an async() so we can await as needed:
async function init() {

  // get our public IP address:
  thisClientConfiguration.ip = await publicIP.v4()
  //=> '46.5.21.123'
  //thisClientConfiguration.ip = await publicIP.v6()
  //=> 'fe80::200:f8ff:fe21:67cf'

  console.log('my hostname', thisClientConfiguration.username)
  console.log('my public IP is', thisClientConfiguration.ip);


  // connect:
  let wsBroker = await wsBrokerConnect();
  console.log('\nconnected to teaparty\n')
  isConnectedToBroker = 1;

  wsBroker.addEventListener('close', () => {
    isConnectedToBroker = 0;
    console.log("teaparty broker connection closed");
    // now what? 
    // shouldn't the ReconnectingWebSocket already be trying to reconnect?
  });
      
  // inform the teaparty broker of our important details
  let thisClient = JSON.stringify({
    cmd: 'newClient',
    data: thisClientConfiguration,
    date: Date.now() 
  })

  wsBroker.send(thisClient);

    
  // TODO: should have a way to send a message when we leave to notify broker we are gone
  // send a "goodbye" message
  // call wsBroker.close()


  wsBroker.addEventListener('message', (data) => {
    let msg = JSON.parse(data.data);
    let cmd = msg.cmd;

    switch (cmd) {
      // lists all clients actively registered with the teaparty
      case 'network': {
        let netpeers = msg.data;
        console.log("NETWORK", netpeers)

        // update our list of peers here
        // any changes should trigger attempts to make p2p connections
        // (also, any removals should break p2p connections)

        // i.e. we want a remove list and an add list

        let addList = [];
        for (let peer in netpeers) {
          
          // TODO: fix this in the broker. the message data shouldn't mix data and metadata like this
          if (peer == "peers") continue;

          // don't add ourselves!
          if (peer == thisClientConfiguration.username) continue;

          addList.push(msg.data[peer]);
        }

        let removeList = [];
        for (let peer in peers) {
          // is this in the netpeer set?
          if (!netpeers[peer.username]) {
            removeList.push(peer);
          }
        }

        console.log("removing", removeList);
        console.log("adding", addList);

        // implement these actions in separate functions, as they may be triggered in other ways.

        // adding should attempt to create a p2p rws-socket
        // removing should cancel such a socket

      } break;

      // these cases are kind of subsumed by the "network" case (TODO consider renaming that)
      // case "addPeer":
      // case "removePeer"

      case 'ping':
        // ignore this, the teaparty sends this as a hack to prevent heroku from stopping the dyno
        break;
  
      default:
       console.log('\n\nFor developer: unhandled message from remote teaparty: ', msg);
       break;
    }

  });

}

init();




// // handle messages from broker
// wsBroker.addEventListener('message', (data) =>{
//   let msg = JSON.parse(data.data)
//   let cmd = msg.cmd
//   //////////// these are messages broadcast to all clients from teaparty
//   switch (cmd){
//     // not in use at the moment, but might come in handy
//     case "serverMsg":
//       console.log('network update: ', msg.data)
//     break
//     case 'ping':
//       // ignore this, the teaparty sends this as a hack to prevent heroku from stopping the dyno
//     break

//     // teaparty tells this app.js that a remote client is available to connect via p2p, or that this own instance has been registered
//     case "addPeer":
//       if (msg.data.username != thisMachineUserName){
//         console.log('add this peer to p2p mesh: ', msg.data)
//       } else {
//         console.log('the app.js instance on ' + thisMachineUserName + ' is attending the tea party')
//       }
//     break
//     // teaparty tells this app.js that a remote client is has disconnected, to break the connection, or that this own instance has been disconnected
//     case "removePeer":
//       if (msg.data != thisMachineUserName){
//         console.log('remove this peer from p2p mesh: ', msg.data)
//       } else {
//         console.log('this app.js has left the tea party')
//       }
//     break

//     // lists all clients actively registered with the teaparty
//     case 'network':
//       console.log(msg)

//       // update our list of peers here
//       // any changes should trigger attempts to make p2p connections
//     break

//     default:
//       console.log('\n\nFor developer: unhandled message from remote teaparty: ', msg)
//     break
//   }

// });

// function sendToteapartyBroker(msg){
//   if(isConnectedToBroker === 0){
//     console.log('websocket client closed, did not send message:\n\n' + msg)
//   } else{
//     wsBroker.send(msg)
//   }
// }
