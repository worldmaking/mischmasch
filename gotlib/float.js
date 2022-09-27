let floatApproximatelyEqual = function(x, y){
    return (Math.abs(x-y)/Math.abs(x)) < 0.0001;
}

console.log(floatApproximatelyEqual(3.08, 3.00005))