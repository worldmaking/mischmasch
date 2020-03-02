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