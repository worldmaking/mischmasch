

EDITING patterns



VR controllers:
- on every frame, we can ask what they are currently pointing at 
- maybe also what they intersect with, via Box3.intersectSphere etc. (first transform controller pose into geometry's world boundnig box)


Controller States:
- Default state -- can highlight objects, etc.
- Drag state -- moving an object (or objects)
- Knob state -- turning knob only until released
- Cabling state -- looking to intersect with a port
- (Multi select state?) -- select many items to drag
- (Menu state?)









state machine. machine is always in 1 state. State defines what events it responds to, and what states these events will leave it in. (Default is to stay in current state)
- easy to understand, can be defined in data quite easily
- handles mutually-exclusive states well, but not 'always responsive' interfaces (e.g. board of knobs)










MENU

is created using the same function that creates geometry etc. of objects in a project, but is not part of the OT workflow
















we have 1 universe, which is our current workspace, that is, the singular actual experience of the app at any time

in this, we can have many worlds (including worlds within worlds), which can be "saved" and "restored"

we also have other things that are not worlds, such as the floor, the UI menu, other people's headsets, etc.

OTs are relative to a specific world. 

Interest in idea of thinking of a world as a distinct server -- and a client can connect to multiple servers accordingly.

