/**
 * Handler of the WebRTC data channel. In its three functions (onOpen, onMessage, onClose) you
 *     specify what to do with the data sent across the data channel over the peer connection.
 *
 * @param {String} ourPeerId - Peer ID of our peer
 * @param {String} ourPeerType - Peer Type of our peer
 * @param {Object} peer - The peer object with the useful properties below.
 * @param {String} peer.peerId - Id of peer
 * @param {String} peer.peerType - Type of peer
 * @param {RTCPeerConnection} peer.rtcPeerConnection - RTC peer connection object
 * @param {RTCDataChannel} peer.dataChannel - RTC data channel object
 * @param {Function} peer.remove - Closes all connections and removes the peer. Automatically called when peer leaves signaling server.
 * @param {Object} syncStates - automerge sync states for each connected peer
 * @param {String} docId - automerge document id (for now its only ever going to be 'doc1')
 */

const Automerge = require('automerge')

function dataChannelHandler(ourPeerId, ourPeerType, peer, syncStates, docId, emitMessage) {
    const peerId = peer.peerId;
    syncStates[peerId] = {}
    // add peer to syncStates
    // syncStates[peerId] = { }

    const channel = peer.dataChannel;
    let thisConnection
    const onOpen = (event) => {
        /* 
            YOUR CODE HERE - This code is executed when the data channel opens.
            For example, you can send data to the peer:
        */
        // channel.send(`Hello from ${ourPeerId}`);
        
        channel.send(JSON.stringify({
            arg: 'requestScene',
            peer: ourPeerId
        }))    

        // if (syncStates[peerId] === undefined) {
        //     syncStates[peerId] = {}
        //     syncStates[peerId][docId] = Automerge.decodeSyncState(db.getSyncState(docId, peerId))
        //     channel.send({ peerId: workerId, target: peerId, type: 'HELLO' })
        // }



        thisConnection = event.type         
    };
    const onMessage = (event) => {

        
        /* 
            YOUR CODE HERE - This code is executed when a message is recieved from the peer.
            For example, extract the data and log it to the console:
        */
        // const { data } = event;
        // console.log(peerId, "says:", `"${data}"`); // put peer data inside quotation marks
        emitMessage.emit('msg', event.data)
    };
    const onClose = (event) => {
        /* 
            YOUR CODE HERE - This code is executed when the data channel is closed.
            For example, log the closing event to the console:
        */
        console.log(`Channel with ${peerId} is closing `);
              
        thisConnection = event.type
    };

    channel.onopen = (event) => {
        if (event.type === "open") {
            console.log("Data channel with", peerId, "is open");
            channel.onmessage = onMessage;
            channel.onclose = onClose;
            onOpen(event);
        }
    };
}

module.exports = dataChannelHandler;
