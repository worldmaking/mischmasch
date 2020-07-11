/*
  Goal:

  Want to establish P2P socket connections between clients over remote network, to make a teaparty
  But we don't know in advance the IP addresses or who is online, so we use a remote teaparty:
  - first we connect to the remote teaparty and let them know our IP, name, and other stats 
  - (we should also let the teaparty know when we leave)
  - the teaparty maintains a list of such connected users (called 'pals')
  - the teaparty shares with all pals the connection info for all the pals, including updating when pals join and leave
  - pals use this information to establish direct P2P connections between each other

  // Migrating host model (no longer in use)
  // - teaparty (signal server) chooses who is host (ground truth) at any time
  // - normally it would be the first to connect, but could be migrated to next partygoer if the host exits (e.g. internet dropout)
  // - everyone would have a socket connection to current host, and assume that the host has the 'ground truth' for merging OTs. 

  Future: many worlds, like server rooms. Anyone can start a world and invite. The default world is open like a lobby. 
  For now just do this default world.

  // Q: does it make sense to use websockets for this?
  // is there a more natural framework for such networks? e.g. the BUS pattern from nanomsg?

*/

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
const url = require('url')
const http = require('http');
const express = require('express');
const fs = require("fs");
const path = require("path");
// const bottleneck = require('Bottleneck')
const got = require(__dirname + "/gotlib/got.js")
// simplified cli args for script
const {argv} = require('yargs')
// interactive cli:
const vorpal = require('vorpal')();

// let ctrl-c quit:
{
	let stdin = process.stdin;
	// without this, we would only get streams once enter is pressed
	if (process.stdin.setRawMode){
		process.stdin.setRawMode(true)
	}
	// resume stdin in the parent process (node app won't quit all by itself
	// unless an error or process.exit() happens)
	stdin.resume();
	// i don't want binary, do you?
	stdin.setEncoding( 'utf8' );
	// on any data into stdin
	stdin.on( 'data', function( key ){
		// ctrl-c ( end of text )
		if ( key === '\u0003' ) {
			process.exit();
		}
		// write the key to stdout all normal like
		process.stdout.write( key );
	});
}

// LOCAL STUFF //
/// paths
const project_path = process.cwd();
const server_path = __dirname;
const client_path = path.join(server_path, "client");
console.log("project_path", project_path);
console.log("server_path", server_path);
console.log("client_path", client_path);

let name;
if (process.argv[3]){
  name = process.argv[3]
} else {
  name = username.sync()
}


// NETWORKING //

let localConfig = {
  // get a username for this machine:
  username: name,
  // ip is figured out during init()
  ip: null, 
  // eventually, app.js will maintain status of connected client(s) and report them to the teaparty
  vr: null,
  sound: null,
  // for example, if someone wanted to observe a performance but not be a player:
  spectator: 0,
  // this is set by the teaparty, or:
  //TODO option to set as localhost using a cli arg (todo)
  host: {},
  // TODO determine where this should run. 
  p2pSignalServer: {
    ip: null,
    port: null
  },
  recordStatus: 0
};

// all websockets

// teapartyWebsocket operates on port 8090, runs as a client, and connects to the 
// teaparty (heroku cloud instance)
let teapartyWebsocket

// deltaWebsocket operates on port 8080, and connects as a client to mischmasch-host.herokuapp.com
// it's what communicates with all other machines (for got deltas)
let deltaWebsocket

// localWebsocket operates on port 8081, and handles communication between other 
// clients apps like VR and the max client
let localWebsocket

// still up for debate, but this is for non-delta data (like HMD and controller pos), 
// should be broadcast to all nodes. so likely a ws is not the right choice, 
// instead see about a mesh implementation
let p2pWebsocket 

let teapartyHost
let teapartyAddress
let hostIP
const teapartyWebsocketPort = '8090';
let teapartyWebsocketAddress


// we receive this as an array from the host. 
let sceneList =[]

if (argv.l){
  teapartyAddress = 'localhost'
  hostIP = "localhost"
  teapartyWebsocketAddress = `ws://${teapartyAddress}:${teapartyWebsocketPort}`
  console.log(`running app.js in local mode\nteaparty address 'ws://localhost:8090'\ndeltaWebsocket host address 'ws://localhost:8081'`)
  fs.readdirSync('./scenes').forEach(file=>{
    sceneList.push(file)
  })
  console.log(sceneList)
} else {
  teapartyAddress = "teaparty.herokuapp.com"
  hostIP = "mischmasch-host.herokuapp.com"
  teapartyWebsocketAddress = `ws://${teapartyAddress}/${teapartyWebsocketPort}`
  console.log('using heroku-based host.js at mischmasch-host.herokuapp.com')
}

const rwsOptions = {
  // make rws use the webSocket module implementation
  WebSocket: webSocket, 
  // ms to try reconnecting:
  connectionTimeout: 30000,
  //debug:true, 
}

// attempt to connect to teaparty 
// returns the websocket via a Promise
function teapartyWebsocketConnect() {
  return new Promise((resolve, reject) => {
    // create a websocket to find out who is at the teaparty:
    console.log(`attempting to connect to teaparty at ${teapartyWebsocketAddress}`)
    teapartyWebsocket = new ReconnectingWebSocket(teapartyWebsocketAddress, [], rwsOptions);
    // show a progress bar while connecting:
    let bar = new ProgressBar(':bar', { total: 25 });
    let progressBarTimer = setInterval(function () {
      bar.tick();
      if (bar.complete) {
          clearInterval(progressBarTimer)
          // TODO: should it give up like this, or maybe ask user if they want to retry?
          reject(`connection timeout: ${teapartyAddress} might be down`);
      }
    }, 1000);
    
    // fail the promise if the server responds with an error
    //! i commented this out because it was interfering with the progressBar and attempts to rws
    teapartyWebsocket.addEventListener('error', (error) => {
      // console.log(`connection error from ${teapartyAddress}:`)
      // clearInterval(progressBarTimer); 
      // reject(error.error);
    });
    
    // on successful connection to teaparty:
    teapartyWebsocket.addEventListener('open', () => {
      clearInterval(progressBarTimer);
      resolve(teapartyWebsocket);
    });
  });
}




// GOT STUFF

// a local copy of the current graph state, for synchronization purposes
let localGraph = {
	nodes: {},
	arcs: []
}








let guestlist = {

}
/* 
  TEAPARTY WEBSOCKET: 
*/
// run everything inside an async() so we can await as needed:
async function init() {
  
  try {
    startLocalWebsocket()
    // get our public IP address:
    localConfig.ip = await publicIP.v4()
    //=> '46.5.21.123'
    //localConfig.ip = await publicIP.v6()
    //=> 'fe80::200:f8ff:fe21:67cf'
  } catch(e) {
    console.log("error resolving public IP", e);
    process.exit();
  }

  console.log('my hostname', localConfig.username)
  console.log('my public IP is', localConfig.ip);

  // connect:
  teapartyWebsocket;
  try{
    teapartyWebsocket = await teapartyWebsocketConnect();
  } catch(e) {
    console.log("error connecting to teaparty maître d'", e);
    console.trace()
    init()
    // process.exit();
  }
  console.log('\nconnected to teaparty\n')
  // TODO Q: shouldn't we be able to ask teapartyWebsocket this, rather than duplicating in a local variable?
  isConnectedToteaparty = 1;

  teapartyWebsocket.addEventListener('close', () => {
    isConnectedToteaparty = 0;
    console.log("teaparty teaparty connection closed");
    // TODO now what? 
    // shouldn't the ReconnectingWebSocket already be trying to reconnect?
    // didn't seem to be for me
  });

  // inform the teaparty teaparty of our important details
  let thisClient = JSON.stringify({
    cmd: 'newClient',
    date: Date.now(), 
    data: localConfig,
  })

  teapartyWebsocket.send(thisClient);

  // TODO: should have a way to send a message when we leave to notify teaparty we are gone
  // send a "goodbye" message
  // call teapartyWebsocket.close()
  // also notify partygoers via wsP2P.close(() => {});

  function sayGoodbye() {
    teapartyWebsocket.close();
    deltaWebsocket.close()
  }

  process.on('SIGINT', function() {
      console.log("Caught interrupt signal");
      sayGoodbye();
      process.exit();
  });




  teapartyWebsocket.addEventListener('message', (data) => {
    let msg = JSON.parse(data.data);
    let cmd = msg.cmd;
    switch (cmd) {

      // lists all clients actively registered with the teaparty
      // should be received at reasonable frequency (i.e. also serves as a ping)
      case 'guestlist': {
        console.log(msg.data)
        guestlist = msg.data
        let teapartyPals = msg.data.pals;
        let teapartyHeadCount = msg.data.headcount;
        teapartyHost = msg.data.host.name;



        // if the deltaWebsocket connection doesn't already exist
        if (!deltaWebsocket){
          // we are a pal! need to connect to host's websocket server

          // if previously connected to a different host, first close our pal websocket
          // if (deltaWebsocket){
          //   console.log('closing deltaWebsocket')
          //   deltaWebsocket.close()
          // }
          // if (localWebsocket){
          //   localWebsocket.close()
          // }
          // get host's ip
          if(!argv.l){
            hostIP = msg.data.host.ip          
          } else if (argv.host){
            // if the host ip is specified
            hostIP = argv.host
            console.log(hostIP)
          } 
            //startLocalWebsocket(hostIP, 8082)       
            pal(hostIP, '8081')
        }

        // update our list of Pals here
        // i.e. we want a remove list and an add list to update our set of Pals

        // TODO possibly also p2p connections to all other members, if we want to have direct lines?
        // (e.g. for sending head/hand position data with minimal lag)
        //? not sure why this is necessary:
        /* 
        let addList = [];
        for (let username in teapartyPals) {
          // don't add ourselves!
          //if (guest == localConfig.username) continue;
          // don't add if we already know about them
          if (pals[username]) continue;
          // otherwise, we need to add them
          addList.push(teapartyPals[username]);
        }

        let removeList = [];
        for (let guest in pals) {
          // is this in the teapartypals set?
          if (!teapartyPals[guest]) {
            removeList.push(guest);
          }
        }

        if (removeList.length) {
          console.log("removing", removeList);
          for (let username of removeList) {
            delete pals[username];
          }
          // console.log("received from teaparty: updated guestlist (removed)", msg.data)
        }
        if (addList.length) {
          // console.log("adding", addList);
          for (let o of addList) {
            pals[o.username] = o;
          }
          // console.log("received from teaparty: updated guestlist (added)", msg.data)
        }
        */
        // TODO implement these actions in separate functions, as they may be triggered in other ways.
        // adding should attempt to create a p2p rws-socket
        // removing should cancel such a socket


      } break;
      case "ping": {
        // ignore
      }
      break;

    
      // these cases are kind of subsumed by the "network" case (TODO consider renaming that)
      // case "addguest":
      // case "removeguest"

      // maybe this is redundant if we treat the "network" message as ping
      // case 'ping':
      //   // ignore this, the teaparty sends this as a hack to prevent heroku from stopping the dyno
      //   break;
  
      default:
       console.log('\n\nFor developer: unhandled message from remote teaparty: ', msg);
       break;
    }

  });

}

init();


// attempt to connect to Host
function pal(ip, port){

  // update the p2p webrtc client(s) with the new host ip/port
  //TODO use the send_all_clients function for this. 
  let configp2p = JSON.stringify({
    cmd: 'p2pSignalServer',
    date: Date.now(), 
    data: localConfig.p2pSignalServer
  })
  sendAllLocalClients(configp2p)

  let deltaWebsocketAddress
  if(!argv.l){
    deltaWebsocketAddress = 'ws://' + ip + '/' + port

  } else {
    deltaWebsocketAddress = 'ws://' + ip + ':' + port
  }
   

    console.log(`attempting to connect to deltaWebsocket Host at `, deltaWebsocketAddress)

    deltaWebsocket = new ReconnectingWebSocket(deltaWebsocketAddress, [], rwsOptions);
    
    deltaWebsocket.addEventListener('error', (error) => {
      console.log(`connection error from ${deltaWebsocketAddress}:`, error)
      // nuclear option. discard localGraph because the host is about to send us the deltas to build the current form of the graph
      localGraph = {}
    });

    deltaWebsocket.addEventListener('close', (data)=>{
      console.log('deltaWebsocket closed: ', data)
      // nuclear option. discard localGraph because the host is about to send us the deltas to build the current form of the graph
      localGraph = {}
    })
    
    // on successful connection to deltaWebsocket Host:
    deltaWebsocket.addEventListener('open', () => {


      // console.log('connected to deltaWebsocket host')
      // let highFive = JSON.stringify({
      //   cmd: 'rsvp',
      //   date: Date.now(), 
      //   data: 'pal',
      // })
      // deltaWebsocket.send(highFive)

      deltaWebsocket.addEventListener('message', (data) =>{
        let msg = JSON.parse(data.data)

        switch(msg.cmd){

          case 'deltas':
            console.log('delta from Host: ', msg)
            // synchronize our local copy:
            try {
              //console.log('\n\npreApply', localGraph.nodes.resofilter_120)
              got.applyDeltasToGraph(localGraph, msg.data);
              //console.log('\n\npostApply', JSON.stringify(localGraph.nodes.resofilter_120.resonance))
            } catch (e) {
              console.warn(e);
            }

            //console.log(msg.data)
            // TODO: merge OTs
            
            let response = {
              cmd: "deltas",
              date: Date.now(),
              data: msg.data
            };
            console.log(msg.data)
            
            // check if the recording status is active, if so push received delta(s) to the recordJSON
            if (localConfig.recordStatus === 1){
              
              for(i = 0; i < msg.data.length; i++){
                
                msg.data[i]["timestamp"] = Date.now()
                recordJSON.deltas.push(msg.data[i])
              }
              
            }

            //fs.appendFileSync(OTHistoryFile, ',' + JSON.stringify(response), "utf-8")

            //OTHistory.push(JSON.stringify(response))
            console.log('localgraph',localGraph, '\n')
            // send to all LOCAL clients:
            sendAllLocalClients(JSON.stringify(response));
          break

          case "sceneList":
            sceneList = msg.data
          break 
          case 'ping':
            // keepAlive for heroku instance
            let keepAlive = JSON.stringify({
              cmd: 'keepAlive',
              date: Date.now(), 
              data: name,
            })
            deltaWebsocket.send(keepAlive)
            
          break
          default: console.log('unhandled deltaWS message: ', msg)
        }
        // console.log(msg)
      })

      
    });


}




function handlemessage(msg, id) {

  console.log(msg)
  switch (msg.cmd) {
    case "deltas": {
      
      runGOT(id, msg.data)
    } break;

    // case "playback":{
    // 	//console.log(msg)/
    // 	console.log(msg.data)
    // 	/*
    // 	let response = {
    // 		cmd: "deltas",
    // 		date: Date.now(),
    // 		data: msg.data
    // 	};
    // 	// NOTE: this is copied from the deltas case, but i've commented out recording the playback since for now it'd just be redundant. 
    // 	// we might, though, at some point want to record when a playback occurred, and note when playback was stopped/looped/overdubbed/etc
    // 	//recordJSON.push(response)
    // 	//fs.writeFileSync(sessionRecording, JSON.stringify(recordJSON, null, "  "), "utf-8")
    // 	send_all_clients(JSON.stringify(response));
    // 	*/
    // } break;

    // case "initController":{

    //   // the max patch "control.maxpat" will request the current available sessions & scene files from the server:

    //   // get recorded sessions
    //   function fromDir(startPath,filter,callback){		
    //     if (!fs.existsSync(startPath)){
    //         console.log("no dir ",startPath);
    //         return;
    //     }
    //     var files=fs.readdirSync(startPath);
    //     for (var i=0;i<files.length;i++){
    //       var filename=path.join(startPath,files[i]);
    //       var stat = fs.lstatSync(filename);
    //       if (stat.isDirectory()){
    //           fromDir(filename,filter,callback); //recurse
    //       } else if (filter.test(filename)) callback(filename);
    //     };
    //   };
    
    //   fromDir(__dirname + '/session_recordings',/\.json$/,function(filename){
    //     filename = filename.split('\\').pop().split('/').pop();
    //     filesFound = {
    //       cmd: "sessionRecordings",
    //       date: Date.now(),
    //       data: filename
    //     };
    //     send_all_clients(JSON.stringify(filesFound));
    //   });

    //   // get scene files
    //   function fromDir(startPath,filter,callback){		
    //     if (!fs.existsSync(startPath)){
    //         console.log("no dir ",startPath);
    //         return;
    //     }
    //     var files=fs.readdirSync(startPath);
    //     for (var i=0;i<files.length;i++){
    //       var filename=path.join(startPath,files[i]);
    //       var stat = fs.lstatSync(filename);
    //       if (stat.isDirectory()){
    //           fromDir(filename,filter,callback); //recurse
    //       } else if (filter.test(filename)) callback(filename);
    //     };
    //   };
    
    //   fromDir(__dirname + '/scene_files',/\.json$/,function(filename){
    //     filename = filename.split('\\').pop().split('/').pop();
    //     filesFound = {
    //       cmd: "scene_files",
    //       date: Date.now(),
    //       data: filename
    //     };
    //     send_all_clients(JSON.stringify(filesFound));
    //   });
    // } break;

    // case "record":{
    // 	// reset session

    // 	// take OTHistory, turn it into a graph. 
    // 	// take that graph turn it back into an OT history (will this remove all redundant deltas? (we want this...))
    // 	// set these deltas as the header for the recorded session file
    // 	// then append the recordJSON in the stopRecord section.
    // 	//let header = {}

    // 	// header['header'] = localGraph
    // 	// console.log(header)
      
    // 	recordJSON = {
    // 		header:{
    // 			scene: localGraph,
    // 			timestamp: Date.now()
    // 		},
    // 		deltas:[]
        
    // 	}
    // 	// recordJSON.push(header)
    // 	let recording = msg.data.replace(/\s/g, "_")
    // 	// save session name as filename provided in this message
    // 	sessionRecording = __dirname + "/session_recordings/" + recording + ".json"
    // 	// push all received deltas to the recordJSON:
    // 	localConfig.recordStatus = 1
    // 	console.log('session will be stored at', sessionRecording)
      
    // } break;

    // case "stopRecord":{
    // 	localConfig.recordStatus = 0

      
    // 	fs.writeFileSync(sessionRecording, JSON.stringify(recordJSON, null, 2), "utf-8")
      
    // 	console.log('session saved at', sessionRecording)

    // } break;

    // case "clear_scene": {
    // 	// JSON not streamable format so close out the history file 
    // 	//fs.appendFileSync(OTHistoryFile, ']', "utf-8")

    // 	let deltas = load_scene("scene_speaker.json")
    // 	// create new history file & add scene as header
    // 	//OTHistoryFile = '../histories/OT_' + Date.now() + '.json'
    // 	// let header = {}
    // 	// header['header'] = deltas
    // 	//fs.writeFileSync(OTHistoryFile, '[' + JSON.stringify(header), "utf-8")
    // } break;
    // case "get_scene": {
      
    //   //demo_scene = JSON.parse(fs.readFileSync(scenefile, "utf-8")); 
    //   // turn this into deltas:
    //   let deltas = got.deltasFromGraph(localGraph, []);
    //   //console.log(deltas)

    //   // reply only to the requester:
    //   sock.send(JSON.stringify({
    //     cmd: "deltas",
    //     date: Date.now(),
    //     data: deltas //OTHistory
    //   }));

    // } break;
    // case "updated_scene": {
    //   // // Example sending some greetings:

    //   // ensure the blank scene isn't overwritten
    //   ensureBlank = __dirname + '/scene_files/blank_scene.json'
    //   if (scenefile === ensureBlank){
    //     console.log('writing to blank scene prevented')
    //   } else {
    //     let scenestr = JSON.stringify(msg.scene, null, "\t");
    //     fs.writeFileSync(scenefile, scenestr, "utf-8");
    //     //console.log(scenestr)
    //   }

    // } break;

    // case "loadScene": {
    //   load_scene(msg.data);
    // } break;

    // case "user_pose": {
    //   //console.log(JSON.stringify(msg.pose))
    //   // broadcast this data... 

    //   recordPose = {
    //     cmd: "user_pose",
    //     date: Date.now(),
    //     pose: msg.pose
    //   }
    //   let poseDelta = JSON.stringify(recordPose)
    //   send_all_clients(poseDelta);

    //   const limiter = new bottleneck({
    //     maxConcurrent: 1,
    //     minTime: 30
    //   });


    //   // Limit storing of pose data to rate of 30fps
    //   limiter.schedule(() => {
    //     //OTHistory.push(poseDelta)
    //     //fs.appendFileSync(OTHistoryFile, ',' + JSON.stringify(recordPose), "utf-8")

    //   });
    // } break;
    default: console.log("received JSON", msg, typeof msg);
  }
}


function startLocalWebsocket(){
  // host webapp (only on mojave)
  const app = express();
  app.use(express.static(client_path))
  app.use(express.static(path.join(__dirname, '/got/')))	
  app.get('/', function(req, res) {
    res.sendFile(path.join(client_path, 'index.html'));
    res.sendFile(path.join(__dirname, '/got/got.js'));
  });
  //app.get('*', function(req, res) { console.log(req); });
  const server = http.createServer(app);
  // add a websocket service to the http server:
  // const wss = new WebSocket.Server({ 
  //   server: server,
  //   maxPayload: 1024 * 1024, 
  // });
  // ws for deltas


  localWebsocketServer = new webSocket.Server({ 
    server: server,
    // port: 8080,
    maxPayload: 1024 * 1024, 
  });
  let sessionId = 0;
  console.log('running localWebsocket Server')
      
  // whenever a pal connects to this websocket:
  localWebsocketServer.on('connection', function(ws, req) {
    localWebsocket = ws
    // inform client that the p2p signal server is running on localhost
    let configp2p = JSON.stringify({
      cmd: 'p2pSignalServer',
      date: Date.now(), 
      data: localConfig.p2pSignalServer
    })
    localWebsocket.send(configp2p)
    // do any
    console.log("server received a connection");
    // console.log("server has "+ws.clients.size+" connected clients");
    //	ws.id = uuid.v4();
    const id = ++sessionId;
    const location = url.parse(req.url, true);
    // ip = req.connection.remoteAddress.split(':')[3] 
    // ip = req.headers.host.split(':')[0]
    // if(!ip){
    //   // console.log('vr', req.connection)
    //   ip = req.ip
    // }
    //console.log(ip)
    // const location = urlw.parse(req.url, true);
    // console.log(location)

    localWebsocket.on('error', function (e) {
      if (e.message === "read ECONNRESET") {
        // ignore this, client will still emit close event
      } else {
        console.error("websocket error: ", e.message);
      }
    });

    // what to do if client disconnects?
    localWebsocket.on('close', function(connection) {
      //clearInterval(handShakeInterval);
      console.log("connection closed");
          // console.log("server has "+ws.clients.size+" connected clients");
    });
    
    // respond to any messages from the client:
    localWebsocket.on('message', function(e) {
      if (e instanceof Buffer) {
        // get an arraybuffer from the message:
        const ab = e.buffer.slice(e.byteOffset,e.byteOffset+e.byteLength);
        //console.log("received arraybuffer", ab);
        // as float32s:
        //console.log(new Float32Array(ab));

      } else {
        try {
          // handlemessage(JSON.parse(e), ws, id);
          let msg = JSON.parse(e)
          switch(msg.cmd){
            case 'vrClientStatus':
              localConfig.vr = msg.data
              teapartyWebsocket.send
              console.log(msg)
            break;

            case 'get_scene':
              console.log(msg)

              if (localGraph){
                console.log(localGraph)
                let deltas = got.deltasFromGraph(localGraph, [])
                let msg = JSON.stringify({
                  cmd: 'deltas',
                  date: Date.now(),
                  data: deltas
                })
                localWebsocket.send(msg)
              }

            break

            case 'deltas':
              console.log('delta from VR client', msg.data)
              deltaWebsocket.send(JSON.stringify(msg))
              // runGOT(id, msg.data)
            break
          }
        } catch (e) {
          console.log('bad JSON: ', e);
        }
      }
    });

  });
  server.listen(8080, function() {
    console.log(`server listening`);
    console.log(`vr view on http://localhost:${server.address().port}/index.html`);
  });

}




function runGOT(src, delta){
  console.log('runGOT', src, delta)
      // synchronize our local copy:
      try {
        //console.log('\n\npreApply', localGraph.nodes.resofilter_120)
        got.applyDeltasToGraph(localGraph, delta)
        //console.log('\n\npostApply', JSON.stringify(localGraph.nodes.resofilter_120.resonance))
      } catch (e) {
        console.warn(e);
      }

      //console.log(msg.data)
      // TODO: merge OTs
      
      let response = JSON.stringify({
        cmd: "deltas",
        date: Date.now(),
        data: delta
      });
      console.log(delta)
      
      // check if the recording status is active, if so push received delta(s) to the recordJSON
      // if (localConfig.recordStatus === 1){
        
      //   for(i = 0; i < delta.length; i++){
          
      //     delta[i]["timestamp"] = Date.now()
      //     recordJSON.deltas.push(delta[i])
      //   }
        
      // }

      //fs.appendFileSync(OTHistoryFile, ',' + JSON.stringify(response), "utf-8")

      //OTHistory.push(JSON.stringify(response))
      console.log('localgraph',localGraph, '\n')

      if (teapartyHost === localConfig.username){
        // if this app.js is host, just send using the localWebsocket
        localWebsocket.send(response)
      } else {
        deltaWebsocket.send(response)

      }
      // send_all_clients(JSON.stringify(response));
}

function sendAllLocalClients(msg){
  localWebsocketServer.clients.forEach(function each(client) {
		// if (client == ignore) return;
		try {
			client.send(msg);
		} catch (e) {
			console.error(e);
		};
	});
}


// CLI stuff
var inquirer = require('inquirer');

vorpal
  .command('scenes', 'Outputs "list of scenes from the host".')
  .action(function(args, callback) {
    
    inquirer
      .prompt([
        {
          type: 'list',
          name: 'loadScene',
          message: 'What do you want to do?',
          choices: sceneList,
        },
        // {
        //   type: 'list',
        //   name: 'size',
        //   message: 'What size do you need?',
        //   choices: ['Jumbo', 'Large', 'Standard', 'Medium', 'Small', 'Micro'],
        //   filter: function (val) {
        //     return val.toLowerCase();
        //   },
        // },
      ])
      .then((answers) => {
        let msg = JSON.stringify({
          cmd: 'loadScene',
          date: Date.now(),
          data: answers.loadScene
        })
        deltaWebsocket.send(msg)
        

      });
      
    callback();
    
  });
 
vorpal
  .delimiter('appjs$')
  .show();

