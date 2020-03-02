/**
 * Generate a random integer between a range (min, max)
 * @param {INT} min - minimum value for random int
 * @param {INT} max - maximum value for random int
 */
export function randomIntFromInterval(min,max) // min and max included
{
    return Math.floor(Math.random()*(max-min+1)+min);
}

/**
 * Keep a value between two amounts and wrap excess
 * @param {NUMBER} n - Value to wrap
 * @param {NUMBER} m - Top value to wrap around
 */
export function wrap(n,m){
    return ((n%m)+m)%m;
}

export function hashCode(str) { // java String#hashCode
    var hash = 0;
    for (var i = 0; i < str.length; i++) {
       hash = str.charCodeAt(i) + ((hash << 5) - hash);
    }
    return hash;
} 

export function intToRGB(i){
    var c = (i & 0x00FFFFFF)
        .toString(16)
        .toUpperCase();

    return "00000".substring(0, 6 - c.length) + c;
}

export function colorFromString(str) {
    let int = Math.abs(hashCode(str));
    let hue = int % 360;
    let result = [];
    new THREE.Color(`hsl(${hue}, 35%, 50%)`).toArray(result);
    return result;
}

export function hexColorFromString(str) {
    return "#" + intToRGB(hashCode(str));
}