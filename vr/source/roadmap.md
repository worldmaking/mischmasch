
Stuff to work on (aka feature requests)

## Materials

Drawing demo (minimal tiltbrush-like)

Physics demos
- smashing hands into balloons
- picking up & throwing objects

Navigation demos
- 3d flying (move in direction of wand, speed set by trigger squeeze)
	- and have a @tripod mode for locking upvector & height to make a 2D vehicle/walk mode
- 2D walking (nausea-prone, but reduce field of view while moving)
	- reducing fov is a simple jit.gl.pix either applied to the texture or as a top-layer videoplane @transform_reset 2...
- Also, how to draw some things relative to nav, e.g. vehicle mode
	- head-locked is easy: jit.gl.node driven by hmd tracking data
	- apply constraints (e.g. constant Y) to the position first
- Scaling self/world up & down?
	- maybe just enable vr @scale?
- (Also something for the fake mode, when no HMD is available)
	- maybe enable the ob3d ui handler 

Teleport (ideally fishing rod-style like in Steam's Lab)
- two ways of getting intersections: 
	- use jit.phys.world + raycast. problems: 
		- requires jit.phys.body for all surfaces
		- how to send a curved ray? segments?
		- doesn't get a normal, so wouldn't filter out surfaces we can't stand on
	- use @capture 2 and grabbing the normal+depth texture to matrix. problems:
		- not sure if @capture 2 plays nice with two cameras/viewports
		- need to get depth into real space
		- need to get cast ray into screen space
		- how to send a curved ray? segments?
	- maybe some of this can be wrapped into the external?

Tracking space
- an option: create a `jit.gl.node @name reality` that receives the inverse of the raw hmd transform. 

UI demos
- UI should normally be in-world, not HUD...
- Utilize mira to expose UI devices in world?
	- not a simple way to get a matrix/texture from jweb; best I can think of is a CEF+Syphon project
	- alternative is to write a mira view for opengl...

Integrating with spatial audio
- I have some gen~ ambisonic stuff that could be used, but need to embed an HRTF somehow

## Eng

- Front-camera (VIVE) -- can't test here, mine isn't working
- detailed chaperone data (not just boundary)
- mirror texture outputs
- rendermodels
- Other headsets/drivers, e.g. OSVR