let canvas = document.getElementById("webgl-canvas");

let sock
try {
    if (window.location.hostname == "localhost") {
        sock = new Socket({
            reload_on_disconnect: true,
            reconnect_period: 1000,
            onopen: function() {
                //this.send({ cmd: "getdata", date: Date.now() });
            },
            onmessage: function(msg) { 
                console.log("received", msg);
            },
            onbuffer(data, byteLength) {
                console.log ("received binary:", byteLength);
            },
        });
    }
} catch (e) {
	console.error(e);
}
