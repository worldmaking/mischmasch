import { systemSettings } from '../settings/systemSettings.js'

function scale(t, ilo, ihi, olo, ohi) {
	return (t-ilo)*(ohi-olo)/(ihi-ilo) + olo;
}

function hashCode(str) { // java String#hashCode
  let hash = 0;
  for (let i = 0; i < str.length; i++) {
     hash = str.charCodeAt(i) + ((hash << 5) - hash);
  }
  return hash;
} 

function colorFromString(str) {
	return chroma.hsl(Math.abs(hashCode(str)) % 360, 0.35, 0.5).gl()
}

function opMenuColour(opCategory){
	let num = hashCode(opCategory)
	return chroma.hsl(Math.abs(num) % 360, 0.35, 0.5).gl()
}

function value2angle(val) {
	return scale(val, 0., 1., -systemSettings.UI_KNOB_ANGLE_LIMIT, systemSettings.UI_KNOB_ANGLE_LIMIT);
}
function angle2value(a) {
	return scale(a, -systemSettings.UI_KNOB_ANGLE_LIMIT, systemSettings.UI_KNOB_ANGLE_LIMIT, 0., 1.);
}

function prettyPrint(object){
	console.log(JSON.stringify(object, null, 4))
}

export { 
  scale,
  hashCode,
  colorFromString,
  opMenuColour,
  value2angle,
  angle2value,
  prettyPrint

}