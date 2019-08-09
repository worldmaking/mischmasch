inlets = 1
outlets = 2			

function amplitudes(data){
	
var vf = new Dict("visualFeedback");
vf.parse(data);


var array1 = [1,2,3,4,5];
var array2 = ['a', 'b', 'c', 'd', 'e'];

var result = array1.reduce(function(arr, v, i) {
                              return arr.concat(v, array2[i]); 
                           }, []);
	outlet(0,result)

//post("msg data", ot.data, "\n")
}