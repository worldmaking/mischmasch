// const wrtc = require('wrtc');
// const ws = require('ws');
// const Coven = require('coven');
 
// const coven = new Coven({ ws, wrtc, signaling: 'wss://coven-broker.now.sh' });
 
// coven.once('open', () => console.log('Connected to signaling server'));
// coven.on('connection', peerId => {
//     console.log(`Connected to peer ${peerId}`)
//     coven.sendTo(peerId, 'fsdfsd');
// });
// coven.on('disconnection', peerId =>
//   console.log(`Disconnected from peer ${peerId}`)
// );
// coven.on('message', ({ peerId, message }) => {
//   coven.sendTo(peerId, message);
//   console.log(peerId, message)
// });
// //...
// const [peerId] = coven.activePeers;

const wrtc = require('wrtc');
const ws = require('ws');
const Coven = require('coven');

const coven = new Coven({ ws, wrtc, signaling: 'ws://teaparty.herokuapp.com/8082' });
coven
  .on('message', ({ peerId, message }) => console.log(`${peerId}: ${message}`))
  .on('connection', pid => {
    console.log(pid, coven.activePeers);
    coven.sendTo(pid, 'Meow');
  })
  .on('error', console.error);