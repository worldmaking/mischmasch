const wrtc = require('wrtc');
const ws = require('ws');
const Coven = require('coven');

const path = require('path')
const filename = path.basename(__filename)
 
// const coven = new Coven({ ws, wrtc, signaling: 'wss://coven-broker.now.sh' });
// // const coven = new Coven({ ws, wrtc, signaling: 'ws://localhost:8082' });
 
// coven.once('open', () => console.log('Connected to signaling server'));
// coven.on('connection', peerId => {
    
//     console.log(`Connected to peer ${peerId}`)
//     console.log(coven.activePeers)

//     coven.sendTo(peerId, 'fsdfsd');


// });
// coven.on('disconnection', peerId =>
//   console.log(`Disconnected from peer ${peerId}`)
// );
// coven.on('message', ({ peerId, message }) => {
//   coven.sendTo(peerId, message);
// });
// //...
// const [peerId] = coven.activePeers;
// coven.sendTo(peerId, 'fsdfsd');

// let ip = msg.data.ip
// let port = msg.data.port
signal = 'ws://mischmasch-host.herokuapp.com/8082'
// signal = 'wss://coven-broker.now.sh'
// coven = new Coven({ ws, wrtc, signaling: 'ws://' + ip + ':' + port });
coven = new Coven({ ws, wrtc, signaling: signal });

coven
    .on('message', ({ peerId, message }) => {
        console.log(`${peerId}: ${message}`)
    })
    .on('connection', pid => {
        console.log(pid, coven.activePeers);
        
        // we use the filename var to route which client should get what message. alternately, could create a 2nd datachannel...
        let p2pMsg = JSON.stringify({
            cmd: 'handshake',
            source: filename,
            data: 'meow'
        })
        coven.sendTo(pid, p2pMsg);
    })
    .on('error', () =>{
        JSON.parse(console.error)
    });