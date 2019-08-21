const path = require('path');
const Max = require('max-api');

// This will be printed directly to the Max console
Max.post(`Loaded the ${path.basename(__filename)} script`);

// Use the 'addHandler' function to register a function for a particular message
//Max.addHandler("bang", () => {
//	Max.post("Who you think you bangin'?");
//});

// Use the 'outlet' function to send messages out of node.script's outlet
Max.addHandler("echo", (msg) => {
	Max.outlet(msg);
});

/*
 * buffer-js-help.js
 * demonstrate buffer~ access from JS in Max 7
 */



Max.addHandler('package', (obj) => {

		//outlet(4, JSON.parse(buf))

		
	Max.outlet('buffer', JSON.stringify(obj))
//	outlet(4, newBuffer)

//	outlet(3, buf.length());
//	outlet(2, buf.framecount());
//	outlet(1, buf.channelcount());
})

array = new Array;
	
	
Max.addHandler('toArray', (index) =>{

	array.push(peek(1, index))
})
function msg_int(index)
{
	outlet(0, buf.peek(1, index));
}


function list(index, count)
{
	var samples = buf.peek(1, index, count);
	post(samples);
	post();
}


// make an array of zeroes, set the buffer content to that
// only clears the first channel
function clear()
{
	var samples = new Array;
	//outlet(4, samples)
	var frames = buf.framecount();

	for (var i=0; i<frames; i++)
		samples[i] = 0.0;

	buf.poke(1, 0, samples);
}
