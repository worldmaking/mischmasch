const toChars = n => `${n >= 26 ? toChars(Math.floor(n / 26) - 1) : ''}${'ABCDEFGHIJKLMNOPQRSTUVWXYZ'[n % 26]}`;

let opCategory = 'mathemagical'
let num = [];
for(let i=0;i<opCategory.length;i++){
	num.push(opCategory.charCodeAt(i))
	
}
num.length = 5
console.log(num.join(''))