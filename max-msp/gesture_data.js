outlets = 6

function client (msg){
	data = JSON.parse(msg)
	var id = data.id
	
	
		
	//post('\n','id', id, 'head', 'pos', data.head.pos.x, data.head.pos.y, data.head.pos.z, 'orient', data.head.orient._x, data.head.orient._y, data.head.orient._z, data.head.orient._sw)
	outlet(0, 'id', id, 'headPos', data.head.pos.x, data.head.pos.y, data.head.pos.z)
	outlet(1, 'id', id, 'headOrient', data.head.orient._x, data.head.orient._y, data.head.orient._z, data.head.orient._w)
	outlet(2, 'id', id, 'controller1Pos', data.controller1.pos.x, data.controller1.pos.y, data.controller1.pos.z)
	outlet(3, 'id', id, 'controller1Orient', data.controller1.orient._x, data.controller1.orient._y, data.controller1.orient._z, data.controller1.orient._w)
	outlet(4, 'id', id, 'controller2Pos', data.controller2.pos.x, data.controller2.pos.y, data.controller2.pos.z)
	outlet(5, 'id', id, 'controller2Orient', data.controller2.orient._x, data.controller2.orient._y, data.controller2.orient._z, data.controller2.orient._w)

}