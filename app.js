/*
  Goal:

  Want to establish P2P socket connections between clients over remote network, to make a teaparty
  But we don't know in advance the IP addresses or who is online, so we use a remote broker:
  - first we connect to the remote broker and let them know our IP, name, and other stats 
  - (we should also let the broker know when we leave)
  - the broker maintains a list of such connected users
  - the broker shares with all users the connection info for all the users, including updating when users join and leave
  - users use this information to establish direct P2P connections between each other

  Migrating host model
  - broker (signal server) chooses who is host (ground truth) at any time
  - normally it would be the first to connect, but could be migrated to next partygoer if the host exits (e.g. internet dropout)
  - everyone would have a socket connection to current host, and assume that the host has the 'ground truth' for merging OTs. 

  Future: many worlds, like server rooms. Anyone can start a world and invite. The default world is open like a lobby. 
  For now just do this default world.

  Q: does it make sense to use websockets for this?
  is there a more natural framework for such networks? e.g. the BUS pattern from nanomsg?


*/

// NOTE: The heroku app 'teaparty' will go to sleep if it goes 30 minutes before 
// receiving a connection request from an app.js. So, when you run app.js don't be 
// surprised if it takes 10-20 seconds to receive a response from teaparty

// most widely-used websocket module for node.js
const webSocket = require('ws');
const webSocketServer = webSocket.Server;
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

// this is the port used for P2P connections
const teapartyP2PWebsocketPort = 8080;

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
          // TODO: should it give up like this, or maybe ask user if they want to retry?
          reject(`connection timeout: ${teapartyBrokerAddress} might be down`);
      }
    }, 1000);

    // fail the promise if the server responds with an error
    wsBroker.addEventListener('error', () => {
      clearInterval(progressBarTimer); 
      reject(`connection error: ${teapartyBrokerAddress}`);
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
  // TODO Q: shouldn't we be able to ask wsBroker this, rather than duplicating in a local variable?
  isConnectedToBroker = 1;

  wsBroker.addEventListener('close', () => {
    isConnectedToBroker = 0;
    console.log("teaparty broker connection closed");
    // TODO now what? 
    // shouldn't the ReconnectingWebSocket already be trying to reconnect?
    // didn't seem to be for me
  });


  // start our own ws server for P2P communication:
  const wsP2P = new webSocketServer({port: teapartyP2PWebsocketPort});

  wsP2P.on('connection', function connection(wsPeer) {

    // TODO at this point we should be adding the wsPeer to our list of incoming peers somehow

    wsPeer.on('message', function incoming(message) {
      console.log('received: %s', message, 'from peer', wsPeer);
      // TODO dispatch this message accordingly
    });
   
    // why not say hello?
    wsPeer.send('good afternoon from ' + thisClientConfiguration.username);
  });

  // inform the teaparty broker of our important details
  let thisClient = JSON.stringify({
    cmd: 'newClient',
    date: Date.now(), 
    data: thisClientConfiguration,
  })

  wsBroker.send(thisClient);

  // TODO: should have a way to send a message when we leave to notify broker we are gone
  // send a "goodbye" message
  // call wsBroker.close()
  // also notify partygoers via wsP2P.close(() => {});

  wsBroker.addEventListener('message', (data) => {
    let msg = JSON.parse(data.data);
    let cmd = msg.cmd;

    switch (cmd) {
      // lists all clients actively registered with the teaparty
      case 'network': {
        let netpeers = msg.data;
        console.log("NETWORK", netpeers)

        // update our list of peers here
        // i.e. we want a remove list and an add list to update our set of peers

        // TODO: want ot know which peer is host, and make sure we have a p2p connection to them
        // (unless we are the host!)

        // TODO possibly also p2p connections to all other members, if we want to have direct lines?
        // (e.g. for sending head/hand position data with minimal lag)

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

        // TODO implement these actions in separate functions, as they may be triggered in other ways.
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