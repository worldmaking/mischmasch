const max = require('max-api')
const WebSocket = require('ws');

const wss = new WebSocket.Server({ port: 8084 });

wss.on('connection', function connection(ws) {
  ws.on('message', function incoming(message) {
    console.log('received: %s', message);
  });

  ws.send('something');
});

max.addHandler('vizData', (data) =>{


  let viz = JSON.stringify({
    cmd: 'vizData',
    data: data,
    date: Date.now()
  })
  max.post(data, viz)
  send_all_clients(viz)
})


// send a (string) message to all connected clients:
function send_all_clients(msg, ignore) {
	wss.clients.forEach(function each(client) {
		if (client == ignore) return;
		try {
			client.send(msg);
		} catch (e) {
			console.error(e);
		};
	});
}