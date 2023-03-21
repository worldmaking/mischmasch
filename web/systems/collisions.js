import * as glutils from '../utilities/glutils.js'
import { vec3 } from 'gl-matrix'

// p0, p1 are the min/max bounding points of the cube
// rayDir is assumed to be normalized to length 1
// boxPos, boxQuat, rayOrigin, rayDir are all assumed to be in world space
function intersectCube(boxPos, boxQuat, p0, p1, rayOrigin, rayDir) {
	// convert ray origin/direction to object-space:
	let origin = vec3.sub(vec3.create(), rayOrigin, boxPos);
	glutils.quat_unrotate(origin, boxQuat, origin);
	let dir = glutils.quat_unrotate(vec3.create(), boxQuat, rayDir);
	// using p = origin + dir*t
	// get ray `t` for each bounding plane of the cube:
	let t0 = [
		(p0[0]-origin[0])/dir[0],
		(p0[1]-origin[1])/dir[1],
		(p0[2]-origin[2])/dir[2],
	];
	let t1 = [
		(p1[0]-origin[0])/dir[0],
		(p1[1]-origin[1])/dir[1],
		(p1[2]-origin[2])/dir[2],
	];
	// sort into first (entry) and second (exit) hits:
	let tmin = vec3.min(vec3.create(), t0, t1); 
	let tmax = vec3.max(vec3.create(), t0, t1);
	// ray is a hit if the last(furthest) entry plane is before the first(nearest) exit plane
	let tentry = Math.max(tmin[0], tmin[1], tmin[2])
	let texit = Math.min(tmax[0], tmax[1], tmax[2])

	// hit if entry is before exit:
	return [tentry <= texit && texit > 0, tentry];
}

export { intersectCube }