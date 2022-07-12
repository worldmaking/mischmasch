const got = require('../got.js');
let assert = require("assert");
let fs = require("fs")
const argv = require('yargs').argv
let g;
let g1;
let d;
let ab;
// jest does this before running tests
describe('acceptable deltas', () => {
    beforeAll(() => {
    })
    afterAll(() => {
      /* Runs after all tests */
    })
    beforeEach(() => {
      /* Runs before each test */
      d = JSON.parse(fs.readFileSync('__tests__/deltas/simple_scene.json'))
      g = got.graphFromDeltas(d)
      g1 = got.graphFromDeltas(d)
    })
    afterEach(() => {
      /* Runs after each test */
    })

    test('setup initial scene', () => {
        expect(typeof got.deltasToString(d)).toBe('string');
        g = got.graphFromDeltas(d)
        g1 = got.graphFromDeltas(d)
        fs.writeFileSync('graphTest.json', JSON.stringify(g1, null, '\t'))

        expect(typeof g).toBe('object');
        expect(g).toMatchObject(simpleSceneSuccess);
        expect(got.deepEqual(g, g1)).toBe(true)
        expect(got.deepEqual(got.deltasFromGraph(g, []), got.deltasFromGraph(g1, []))).toBe(true)
    });

    test('apply propchange', () => {
        let deltas = {"op": "propchange","path": "lfo_1.rate", "name": "value","from": 0.17,"to": 0.7005339838596962,"timestamp": 1571343253980}
        // // ab = got.deepCopy(g);
        let g1 =  got.applyDeltasToGraph(g, [deltas]);
        expect(g1).toMatchObject(propchangeSuccess);

    });

    test('apply unique newnode', () => {
        let deltas = [[{"op":"newnode","path":"lfo_2","kind":"lfo","pos":[-2.326367085370336,1.5209056349935186,-0.7035861792005239],"orient":[0.12358177055502231,0.41713355199484253,0.13623412932103282,0.8900378687419946]},[{"op":"newnode","path":"lfo_2.fm_cv","kind":"inlet","index":0}],[{"op":"newnode","path":"lfo_2.phasor_sync","kind":"inlet","index":1}],[{"op":"newnode","path":"lfo_2.pulse_width_cv","kind":"inlet","index":2}],[{"op":"newnode","path":"lfo_2.rate","kind":"large_knob","range":[0,80],"taper":"log 3.8","value":0.17,"unit":"Hz"}],[{"op":"newnode","path":"lfo_2.index","kind":"small_knob","range":[0,10],"taper":"linear","value":3,"unit":"float"}],[{"op":"newnode","path":"lfo_2.pulse_width","kind":"small_knob","range":[0,1],"taper":"linear","value":5,"unit":"float"}],[{"op":"newnode","path":"lfo_2.onset","kind":"small_knob","range":[0,1],"taper":"linear","value":2.8,"unit":"float"}],[{"op":"newnode","path":"lfo_2.sine","kind":"outlet","index":0}],[{"op":"newnode","path":"lfo_2.phasor","kind":"outlet","index":1}],[{"op":"newnode","path":"lfo_2.pulse","kind":"outlet","index":2}],[{"op":"newnode","path":"lfo_2.sine_index","kind":"outlet","index":3}]]]
        // // ab = got.deepCopy(g);
        let g1 = got.applyDeltasToGraph(g, [deltas])
        
        expect(g1).toMatchObject(newnodeSuccess);
    });

    test('applied correct delnode', () => {
        let deltas = [[[{"op":"delnode","path":"lfo_1.sine_index","kind":"outlet","index":3}],[{"op":"delnode","path":"lfo_1.pulse","kind":"outlet","index":2}],[{"op":"delnode","path":"lfo_1.phasor","kind":"outlet","index":1}],[{"op":"delnode","path":"lfo_1.sine","kind":"outlet","index":0}],[{"op":"delnode","path":"lfo_1.onset","kind":"small_knob","range":[0,1],"taper":"linear","value":2.8,"unit":"float"}],[{"op":"delnode","path":"lfo_1.pulse_width","kind":"small_knob","range":[0,1],"taper":"linear","value":5,"unit":"float"}],[{"op":"delnode","path":"lfo_1.index","kind":"small_knob","range":[0,10],"taper":"linear","value":3,"unit":"float"}],[{"op":"delnode","path":"lfo_1.rate","kind":"large_knob","range":[0,80],"taper":"log 3.8","value":0.17,"unit":"Hz"}],[{"op":"delnode","path":"lfo_1.pulse_width_cv","kind":"inlet","index":2}],[{"op":"delnode","path":"lfo_1.phasor_sync","kind":"inlet","index":1}],[{"op":"delnode","path":"lfo_1.fm_cv","kind":"inlet","index":0}],{"op":"delnode","path":"lfo_1","kind":"lfo","pos":[-2.326367085370336,1.5209056349935186,-0.7035861792005239],"orient":[0.12358177055502231,0.41713355199484253,0.13623412932103282,0.8900378687419946]}]]
        // ab = got.deepCopy(g);
        let g1 = got.applyDeltasToGraph(g, [deltas])
        expect(g1).toMatchObject(delnodeSuccess);
    });



    test('apply connect', () => {
        let deltas = {"op": "connect", "paths": [ "lfo_1.sine", "lfo_1.phasor_sync"]}
        // // // ab = got.deepCopy(g);
        let g1 = got.applyDeltasToGraph(g, [deltas])
        expect(g1).toMatchObject(connectSuccess);
    });


    test('apply unique disconnect', () => {
        let deltas = {"op": "disconnect", "paths": [ "lfo_1.sine", "lfo_1.cv"]}
        g1 = got.applyDeltasToGraph(g, [deltas])
        expect(g1).toMatchObject(uniqueDisconnectSuccess);
    });

// fs.writeFileSync('graphTest.json', JSON.stringify(got.applyDeltasToGraph(g, [deltas]), null, '\t'))

    test('apply repath', () => {
        let deltas = {"op": "repath", "paths": [ "lfo_1.fm_cv", "lfo_1.sine"]}
        g1 = got.applyDeltasToGraph(g, [deltas])
        expect(g1).toMatchObject(repathSuccess);
    }); 


})

// any of these deltas should cause the whole packet of B to be rejected (stop the loop through deltas), and resync the user's graph by disconnecting them
describe('malformed deltas', () => {
    beforeAll(() => {
    })
    afterAll(() => {
      /* Runs after all tests */
    })
    beforeEach(() => {
      /* Runs before each test */
      d = JSON.parse(fs.readFileSync('__tests__/deltas/simple_scene.json'))
      g = got.graphFromDeltas(d)
      g1 = got.graphFromDeltas(d)})
    afterEach(() => {
      /* Runs after each test */
	})
	
	// newnode without a path
	test('reject newnode without a path', () => {
        let deltas = {"op":"newnode","path":"","kind":"lfo","pos":[-2.326367085370336,1.5209056349935186,-0.7035861792005239],"orient":[0.12358177055502231,0.41713355199484253,0.13623412932103282,0.8900378687419946]}
		let g1 = got.applyDeltasToGraph(g, deltas)
		// g1[0] is the graph, g1[1] is the errorMSG
		expect(g1[0]).toMatchObject(simpleSceneSuccess);
		expect(g1[1].error).toBe('newnode delta contains no path');
		// expect(() => got.applyDeltasToGraph(g, [deltas])).toThrowError('newnode delta contains no path')
    });
	// delnode without a path
	test('reject delnode without a path', () => {
		let deltas = {"op":"delnode","path":"","kind":"lfo","pos":[-2.326367085370336,1.5209056349935186,-0.7035861792005239],"orient":[0.12358177055502231,0.41713355199484253,0.13623412932103282,0.8900378687419946]}
		let g1 = got.applyDeltasToGraph(g, deltas)
		// g1[0] is the graph, g1[1] is the errorMSG
		expect(g1[0]).toMatchObject(simpleSceneSuccess);
		expect(g1[1].error).toBe('delnode delta contains no path');

		// expect(() => got.applyDeltasToGraph(g, [deltas])).toThrowError('delnode delta contains no path')
	}); 
	// propchange without a path
	test('reject propchange without a path', () => {
        let deltas = {"op": "propchange" ,"path": "", "name": "value","from": 0.17,"to": 0.7005339838596962,"timestamp": 1571343253980}
		let g1 = got.applyDeltasToGraph(g, deltas)
		// g1[0] is the graph, g1[1] is the errorMSG
		expect(g1[0]).toMatchObject(simpleSceneSuccess);
		expect(g1[1].error).toBe('propchange delta contains no path');
		// expect(() => got.applyDeltasToGraph(g, [deltas])).toThrowError('propchange delta contains no path')
	});	

	// propchange without a "from" value
	test('reject propchange without a "from" value', () => {
		let deltas = {"op": "propchange" ,"path": "lfo_1.rate", "name": "value","from": undefined,"to": 0.7005339838596962,"timestamp": 1571343253980}
		
		let g1 = got.applyDeltasToGraph(g, deltas)
		// g1[0] is the graph, g1[1] is the errorMSG
		expect(g1[0]).toMatchObject(simpleSceneSuccess);
		expect(g1[1].error).toBe('propchange delta contains no "from" value');
		
		// expect(() => got.applyDeltasToGraph(g, [deltas])).toThrowError('propchange delta contains no "from" value')
	});	
	// propchange without a "to" value
	test('reject propchange without a "to" value', () => {
		let deltas = {"op": "propchange" ,"path": "lfo_1.fm_cv", "name": "value","from": 0.17,"to": undefined,"timestamp": 1571343253980}
		
		let g1 = got.applyDeltasToGraph(g, deltas)
		// g1[0] is the graph, g1[1] is the errorMSG
		expect(g1[0]).toMatchObject(simpleSceneSuccess);
		expect(g1[1].error).toBe('propchange delta contains no "to" value');
		// expect(() => got.applyDeltasToGraph(g, [deltas])).toThrowError('propchange delta contains no "to" value')
	});	

	// Connect without either or both of the paths
	test('reject connect without either or both of the paths', () => {
        let deltas = {"op": "connect", "paths": [ "lfo_1.sine", ""]}
        // // // ab = got.deepCopy(g);
        // let g1 = got.applyDeltasToGraph(g, [deltas])
		// expect(g1).toMatchObject(connectSuccess);
		let g1 = got.applyDeltasToGraph(g, deltas)
		// g1[0] is the graph, g1[1] is the errorMSG
		expect(g1[0]).toMatchObject(simpleSceneSuccess);
		expect(g1[1].error).toBe('propchange connect is missing one or more path(s)');

		// expect(() => got.applyDeltasToGraph(g, [deltas])).toThrowError('propchange connect is missing one or more path(s)')

    });
	// Connect if both paths are equal
	test('reject connect if both paths  are equal', () => {
        let deltas = {"op": "connect", "paths": [ "lfo_1.sine", "lfo_1.sine"]}
        // // // ab = got.deepCopy(g);
        // let g1 = got.applyDeltasToGraph(g, [deltas])
		// expect(g1).toMatchObject(connectSuccess);
		let g1 = got.applyDeltasToGraph(g, deltas)
		// g1[0] is the graph, g1[1] is the errorMSG
		expect(g1[0]).toMatchObject(simpleSceneSuccess);
		expect(g1[1].error).toBe('propchange connect contains identical paths');

		// expect(() => got.applyDeltasToGraph(g, [deltas])).toThrowError('propchange connect contains identical paths')

	});
	
	// Disconnect without either or both of the paths
	test('reject disconnect without either or both of the paths', () => {
		let deltas = {"op": "disconnect", "paths": [ "lfo_1.sine", ""]}
		// // // ab = got.deepCopy(g);
		// let g1 = got.applyDeltasToGraph(g, [deltas])
		// expect(g1).toMatchObject(connectSuccess);
		let g1 = got.applyDeltasToGraph(g, deltas)
		// g1[0] is the graph, g1[1] is the errorMSG
		expect(g1[0]).toMatchObject(simpleSceneSuccess);
		expect(g1[1].error).toBe('propchange disconnect is missing one or more path(s)');
		// expect(() => got.applyDeltasToGraph(g, [deltas])).toThrowError('propchange disconnect is missing one or more path(s)')

	});
	// Disconnect if both paths are equal
	test('reject disconnect if both paths  are equal', () => {
		let deltas = {"op": "disconnect", "paths": [ "lfo_1.sine", "lfo_1.sine"]}
		// // // ab = got.deepCopy(g);
		// let g1 = got.applyDeltasToGraph(g, [deltas])
		// expect(g1).toMatchObject(connectSuccess);
		let g1 = got.applyDeltasToGraph(g, deltas)
		// g1[0] is the graph, g1[1] is the errorMSG
		expect(g1[0]).toMatchObject(simpleSceneSuccess);
		expect(g1[1].error).toBe('propchange disconnect contains identical paths');
		// expect(() => got.applyDeltasToGraph(g, [deltas])).toThrowError('propchange disconnect is missing one or more path(s)')

		// expect(() => got.applyDeltasToGraph(g, [deltas])).toThrowError('propchange disconnect contains identical paths')

	});
	// Repath missing either or both of the paths
	test.only('reject repath missing either or both of the paths', () => {
        let deltas = {"op": "repath", "paths": [ "", "lfo_1.sine"]}
		// // // ab = got.deepCopy(g);
		// let g1 = got.applyDeltasToGraph(g, [deltas])
		// expect(g1).toMatchObject(connectSuccess);
		let g1 = got.applyDeltasToGraph(g, deltas)
		// g1[0] is the graph, g1[1] is the errorMSG
		expect(g1[0]).toMatchObject(simpleSceneSuccess);
		expect(g1[1].error).toBe('propchange repath is missing one or more path(s)');
		// expect(() => got.applyDeltasToGraph(g, [deltas])).toThrowError('propchange disconnect is missing one or more path(s)')

		// expect(() => got.applyDeltasToGraph(g, [deltas])).toThrowError('propchange repath is missing one or more path(s)')

	});

});

describe('incorrect deltas', () => {
    beforeAll(() => {
    })
    afterAll(() => {
      /* Runs after all tests */
    })
    beforeEach(() => {
      /* Runs before each test */
      d = JSON.parse(fs.readFileSync('__tests__/deltas/simple_scene.json'))
      g = got.graphFromDeltas(d)
      g1 = got.graphFromDeltas(d)})
    afterEach(() => {
      /* Runs after each test */
	})
    // works
    test('reject propchange to nonexistent path', () => {
        let deltas = {"op": "propchange" ,"path": "lfo_1.michael", "name": "value","from": 0.17,"to": 0.7005339838596962,"timestamp": 1571343253980}
        expect(() => got.applyDeltasToGraph(g, [deltas])).toThrowError('delta failed on path: ')
    });
    // works
    test('reject propchange to nonexistent property', () => {
        let deltas = {"op": "propchange" ,"path": "lfo_1.sine_index", "name": "value","from": 0.17,"to": 0.7005339838596962,"timestamp": 1571343253980}
        expect(() => got.applyDeltasToGraph(g, [deltas])).toThrowError('propchange failed: property not found')
    });

    // I don't yet know how  to test for this. what delta do i need. 
    // test.only('reject propchange to object with no properties', () => {
    //     let deltas = {"op": "propchange" ,"path": "lfo_1.sine_index"}
    //     expect(() => got.applyDeltasToGraph(g, [deltas])).toThrowError('propchange failed: property not found')
    // });
    
    // working
    test('reject propchange with incorrect value', () => {
        let deltas = {"op": "propchange","path": "lfo_1.rate", "name": "value","from": 0.78,"to": 0.7005339838596962,"timestamp": 1571343253980}
        expect(() => got.applyDeltasToGraph(g, [deltas])).toThrowError('propchange failed: delta.from does not match current property value')
    });
    // working
    test('reject a duplicate newnode', () => {
        let deltas = [[{"op":"newnode","path":"lfo_1","kind":"lfo","pos":[-2.326367085370336,1.5209056349935186,-0.7035861792005239],"orient":[0.12358177055502231,0.41713355199484253,0.13623412932103282,0.8900378687419946]},[{"op":"newnode","path":"lfo_1.fm_cv","kind":"inlet","index":0}],[{"op":"newnode","path":"lfo_1.phasor_sync","kind":"inlet","index":1}],[{"op":"newnode","path":"lfo_1.pulse_width_cv","kind":"inlet","index":2}],[{"op":"newnode","path":"lfo_1.rate","kind":"large_knob","range":[0,80],"taper":"log 3.8","value":0.17,"unit":"Hz"}],[{"op":"newnode","path":"lfo_1.index","kind":"small_knob","range":[0,10],"taper":"linear","value":3,"unit":"float"}],[{"op":"newnode","path":"lfo_1.pulse_width","kind":"small_knob","range":[0,1],"taper":"linear","value":5,"unit":"float"}],[{"op":"newnode","path":"lfo_1.onset","kind":"small_knob","range":[0,1],"taper":"linear","value":2.8,"unit":"float"}],[{"op":"newnode","path":"lfo_1.sine","kind":"outlet","index":0}],[{"op":"newnode","path":"lfo_1.phasor","kind":"outlet","index":1}],[{"op":"newnode","path":"lfo_1.pulse","kind":"outlet","index":2}],[{"op":"newnode","path":"lfo_1.sine_index","kind":"outlet","index":3}]]]
        expect(() => got.applyDeltasToGraph(g, [deltas])).toThrowError('newnode failed: path already exists')
    });

    // working
    test('reject an invalid parent path for newnode', () => {
        let deltas = [[{"op":"newnode","path":"michael.lfo_1","kind":"lfo","pos":[-2.326367085370336,1.5209056349935186,-0.7035861792005239],"orient":[0.12358177055502231,0.41713355199484253,0.13623412932103282,0.8900378687419946]},[{"op":"newnode","path":"michael.lfo_1.fm_cv","kind":"inlet","index":0}],[{"op":"newnode","path":"michael.lfo_1.phasor_sync","kind":"inlet","index":1}],[{"op":"newnode","path":"michael.lfo_1.pulse_width_cv","kind":"inlet","index":2}],[{"op":"newnode","path":"michael.lfo_1.rate","kind":"michael.large_knob","range":[0,80],"taper":"log 3.8","value":0.17,"unit":"Hz"}],[{"op":"newnode","path":"michael.lfo_1.index","kind":"small_knob","range":[0,10],"taper":"linear","value":3,"unit":"float"}],[{"op":"newnode","path":"michael.lfo_1.pulse_width","kind":"small_knob","range":[0,1],"taper":"linear","value":5,"unit":"float"}],[{"op":"newnode","path":"michael.lfo_1.onset","kind":"small_knob","range":[0,1],"taper":"linear","value":2.8,"unit":"float"}],[{"op":"newnode","path":"michael.lfo_1.sine","kind":"outlet","index":0}],[{"op":"newnode","path":"michael.lfo_1.phasor","kind":"outlet","index":1}],[{"op":"newnode","path":"michael.lfo_1.pulse","kind":"outlet","index":2}],[{"op":"newnode","path":"michael.lfo_1.sine_index","kind":"outlet","index":3}]]]
        expect(() => got.applyDeltasToGraph(g, [deltas])).toThrowError('newnode failed: failed to find path')
    });

    // working
    test('reject delnode with unknown path', () => {
        let deltas = [[[{"op":"delnode","path":"lfo_2.sine_index","kind":"outlet","index":3}],[{"op":"delnode","path":"lfo_2.pulse","kind":"outlet","index":2}],[{"op":"delnode","path":"lfo_2.phasor","kind":"outlet","index":1}],[{"op":"delnode","path":"lfo_2.sine","kind":"outlet","index":0}],[{"op":"delnode","path":"lfo_2.onset","kind":"small_knob","range":[0,1],"taper":"linear","value":2.8,"unit":"float"}],[{"op":"delnode","path":"lfo_2.pulse_width","kind":"small_knob","range":[0,1],"taper":"linear","value":5,"unit":"float"}],[{"op":"delnode","path":"lfo_2.index","kind":"small_knob","range":[0,10],"taper":"linear","value":3,"unit":"float"}],[{"op":"delnode","path":"lfo_2.rate","kind":"large_knob","range":[0,80],"taper":"log 3.8","value":0.17,"unit":"Hz"}],[{"op":"delnode","path":"lfo_2.pulse_width_cv","kind":"inlet","index":2}],[{"op":"delnode","path":"lfo_2.phasor_sync","kind":"inlet","index":1}],[{"op":"delnode","path":"lfo_2.fm_cv","kind":"inlet","index":0}],{"op":"delnode","path":"lfo_2","kind":"lfo","pos":[-2.326367085370336,1.5209056349935186,-0.7035861792005239],"orient":[0.12358177055502231,0.41713355199484253,0.13623412932103282,0.8900378687419946]}]]
        expect(() => got.applyDeltasToGraph(g, [deltas])).toThrowError('delta failed on path: ')
    });
    // working
    test('reject delnode with unmatched properties', () => {
        let deltas = [[[{"op":"delnode","path":"lfo_1.sine_index","kind":"outlet","index":3}],[{"op":"delnode","path":"lfo_1.pulse","kind":"outlet","index":2}],[{"op":"delnode","path":"lfo_1.phasor","kind":"outlet","index":1}],[{"op":"delnode","path":"lfo_1.sine","kind":"outlet","index":0}],[{"op":"delnode","path":"lfo_1.onset","kind":"small_knob","range":[0,1],"taper":"linear","value":2.8,"unit":"float"}],[{"op":"delnode","path":"lfo_1.pulse_width","kind":"small_knob","range":[0,1],"taper":"linear","value":5,"unit":"float"}],[{"op":"delnode","path":"lfo_1.index","kind":"small_knob","range":[0,10],"taper":"linear","value":3,"unit":"float"}],[{"op":"delnode","path":"lfo_1.rate","kind":"large_knob","range":[0,80],"taper":"log 3.8","value":0.17,"unit":"Hz"}],[{"op":"delnode","path":"lfo_1.pulse_width_cv","kind":"inlet","index":2}],[{"op":"delnode","path":"lfo_1.phasor_sync","kind":"inlet","index":1}],[{"op":"delnode","path":"lfo_1.fm_cv","kind":"inlet","index":0}],{"op":"delnode","path":"lfo_1","kind":"lfo","pos":[-2.326367085370336,9.5209056349935186,-0.7035861792005239],"orient":[0.12358177055502231,0.41713355199484253,0.13623412932103282,0.8900378687419946]}]]
        expect(() => got.applyDeltasToGraph(g, [deltas])).toThrowError('delnode failed; properties do not match')
        // got.applyDeltasToGraph(g, [deltas])
    });
    // working
    test('reject delnode with child nodes', () => {
        let deltas = [[{"op":"delnode","path":"lfo_1","kind":"lfo","pos":[-2.326367085370336,1.5209056349935186,-0.7035861792005239],"orient":[0.12358177055502231,0.41713355199484253,0.13623412932103282,0.8900378687419946]},[{"op":"delnode","path":"lfo_1.fm_cv","kind":"inlet","index":0}],[{"op":"delnode","path":"lfo_1.phasor_sync","kind":"inlet","index":1}],[{"op":"delnode","path":"lfo_1.pulse_width_cv","kind":"inlet","index":2}],[{"op":"delnode","path":"lfo_1.rate","kind":"large_knob","range":[0,80],"taper":"log 3.8","value":0.17,"unit":"Hz"}],[{"op":"delnode","path":"lfo_1.index","kind":"small_knob","range":[0,10],"taper":"linear","value":3,"unit":"float"}],[{"op":"delnode","path":"lfo_1.pulse_width","kind":"small_knob","range":[0,1],"taper":"linear","value":5,"unit":"float"}],[{"op":"delnode","path":"lfo_1.onset","kind":"small_knob","range":[0,1],"taper":"linear","value":2.8,"unit":"float"}],[{"op":"delnode","path":"lfo_1.sine","kind":"outlet","index":0}],[{"op":"delnode","path":"lfo_1.phasor","kind":"outlet","index":1}],[{"op":"delnode","path":"lfo_1.pulse","kind":"outlet","index":2}],[{"op":"delnode","path":"lfo_1.sine_index","kind":"outlet","index":3}]]]
        expect(() => got.applyDeltasToGraph(g, [deltas])).toThrowError('delnode failed; node has children')
        // got.applyDeltasToGraph(g, [deltas])
    });
    // working
    test('reject duplicate connect', () => {
        let deltas = {"op": "connect", "paths": [ "lfo_1.sine", "lfo_1.cv"]}
        expect(() => got.applyDeltasToGraph(g, [deltas])).toThrowError('connect failed: arc already exists')
        // expect(typeof g).toBe('object');
    });
    // working
    test('reject disconnect on nonexistent path', () => {
        let deltas = {"op": "disconnect", "paths": [ "lfo_1.sine", "lfo_1.rate"]}
        // got.applyDeltasToGraph(g, [deltas])
        expect(() => got.applyDeltasToGraph(g, [deltas])).toThrowError('disconnect failed: no matching arc found')
    });

    test('reject repath on nonexistent source-path', () => {
        let deltas = {"op": "repath", "paths": [ "lfo_1.bunk", "lfo_1.sineBank"]}
        // got.applyDeltasToGraph(g, [deltas])
        expect(() => got.applyDeltasToGraph(g, [deltas])).toThrowError("delta failed on path: ")
    });

    // works
    test('reject repath on nonexistent destination-path', () => {
       let deltas = [{"op": "repath", "paths": [ "lfo_1.fm_cv", "lfo_1.sine"]},
            {"op": "repath", "paths": [ "lfo_1.fm_cv", "lfo_1.sine"]}
        ]           
        // expect(() => got.applyDeltasToGraph(g, [deltas])).toThrowError("delta failed on path: ")
    });

})

describe('conflicting delta sequences', () => {
    beforeAll(() => {
    })
    afterAll(() => {
      /* Runs after all tests */
    })
    beforeEach(() => {
      /* Runs before each test */
      d = JSON.parse(fs.readFileSync('__tests__/deltas/simple_scene.json'))
      g = got.graphFromDeltas(d)
      g1 = got.graphFromDeltas(d)})
    afterEach(() => {
      /* Runs after each test */
    })

    test('#1 Two propchanges with same path, same “from”, but different “to”',  () =>{
        let deltas = [
            {"op":"propchange","path":"lfo_1.rate","name":"value","from":0.17,"to":34},
            {"op":"propchange","path":"lfo_1.rate","name":"value","from":0.17,"to":36}
        ]
        
        expect(() => got.applyDeltasToGraph(g, [deltas])).toThrowError("2 deltas w/ same path and from, different to")

    })
    // test.only('catch 2 repaths with same path, same “from”, but different “to”', () => {
    //     let deltas = [
    //         {"op": "repath", "paths": [ "lfo_1.fm_cv", "lfo_1.sine"]},
    //         {"op": "repath", "paths": [ "lfo_1.fm_cv", "lfo_1.phasor"]}
    //     ]
    //     got.applyDeltasToGraph(g, [deltas])  
    //     expect(() => got.applyDeltasToGraph(g, [deltas])).toThrowError("snare")

    // })

})






//! Keep  these down here:
// confirmed graphs:

let repathSuccess =  {
	"nodes": {
		"lfo_1": {
			"_props": {
				"kind": "lfo",
				"pos": [
					-2.326367085370336,
					1.5209056349935186,
					-0.7035861792005239
				],
				"orient": [
					0.12358177055502231,
					0.41713355199484253,
					0.13623412932103282,
					0.8900378687419946
				]
			},
			"phasor_sync": {
				"_props": {
					"kind": "inlet",
					"index": 1
				}
			},
			"pulse_width_cv": {
				"_props": {
					"kind": "inlet",
					"index": 2
				}
			},
			"rate": {
				"_props": {
					"kind": "large_knob",
					"range": [
						0,
						80
					],
					"taper": "log 3.8",
					"value": 0.17,
					"unit": "Hz"
				}
			},
			"index": {
				"_props": {
					"kind": "small_knob",
					"range": [
						0,
						10
					],
					"taper": "linear",
					"value": 3,
					"unit": "float"
				}
			},
			"pulse_width": {
				"_props": {
					"kind": "small_knob",
					"range": [
						0,
						1
					],
					"taper": "linear",
					"value": 5,
					"unit": "float"
				}
			},
			"onset": {
				"_props": {
					"kind": "small_knob",
					"range": [
						0,
						1
					],
					"taper": "linear",
					"value": 2.8,
					"unit": "float"
				}
			},
			"sine": {
				"_props": {
					"kind": "inlet",
					"index": 0
				}
			},
			"phasor": {
				"_props": {
					"kind": "outlet",
					"index": 1
				}
			},
			"pulse": {
				"_props": {
					"kind": "outlet",
					"index": 2
				}
			},
			"sine_index": {
				"_props": {
					"kind": "outlet",
					"index": 3
				}
			}
		}
	},
	"arcs": [
		[
			"lfo_1.sine",
			"lfo_1.sine"
		],
		[
			"lfo_1.sine",
			"lfo_1.cv"
		]
	]
}

let uniqueDisconnectSuccess =  {
	"nodes": {
		"lfo_1": {
			"_props": {
				"kind": "lfo",
				"pos": [
					-2.326367085370336,
					1.5209056349935186,
					-0.7035861792005239
				],
				"orient": [
					0.12358177055502231,
					0.41713355199484253,
					0.13623412932103282,
					0.8900378687419946
				]
			},
			"fm_cv": {
				"_props": {
					"kind": "inlet",
					"index": 0
				}
			},
			"phasor_sync": {
				"_props": {
					"kind": "inlet",
					"index": 1
				}
			},
			"pulse_width_cv": {
				"_props": {
					"kind": "inlet",
					"index": 2
				}
			},
			"rate": {
				"_props": {
					"kind": "large_knob",
					"range": [
						0,
						80
					],
					"taper": "log 3.8",
					"value": 0.17,
					"unit": "Hz"
				}
			},
			"index": {
				"_props": {
					"kind": "small_knob",
					"range": [
						0,
						10
					],
					"taper": "linear",
					"value": 3,
					"unit": "float"
				}
			},
			"pulse_width": {
				"_props": {
					"kind": "small_knob",
					"range": [
						0,
						1
					],
					"taper": "linear",
					"value": 5,
					"unit": "float"
				}
			},
			"onset": {
				"_props": {
					"kind": "small_knob",
					"range": [
						0,
						1
					],
					"taper": "linear",
					"value": 2.8,
					"unit": "float"
				}
			},
			"sine": {
				"_props": {
					"kind": "outlet",
					"index": 0
				}
			},
			"phasor": {
				"_props": {
					"kind": "outlet",
					"index": 1
				}
			},
			"pulse": {
				"_props": {
					"kind": "outlet",
					"index": 2
				}
			},
			"sine_index": {
				"_props": {
					"kind": "outlet",
					"index": 3
				}
			}
		}
	},
	"arcs": [
		[
			"lfo_1.sine",
			"lfo_1.fm_cv"
		]
	]
}

let connectSuccess =  {
	"nodes": {
		"lfo_1": {
			"_props": {
				"kind": "lfo",
				"pos": [
					-2.326367085370336,
					1.5209056349935186,
					-0.7035861792005239
				],
				"orient": [
					0.12358177055502231,
					0.41713355199484253,
					0.13623412932103282,
					0.8900378687419946
				]
			},
			"fm_cv": {
				"_props": {
					"kind": "inlet",
					"index": 0
				}
			},
			"phasor_sync": {
				"_props": {
					"kind": "inlet",
					"index": 1
				}
			},
			"pulse_width_cv": {
				"_props": {
					"kind": "inlet",
					"index": 2
				}
			},
			"rate": {
				"_props": {
					"kind": "large_knob",
					"range": [
						0,
						80
					],
					"taper": "log 3.8",
					"value": 0.17,
					"unit": "Hz"
				}
			},
			"index": {
				"_props": {
					"kind": "small_knob",
					"range": [
						0,
						10
					],
					"taper": "linear",
					"value": 3,
					"unit": "float"
				}
			},
			"pulse_width": {
				"_props": {
					"kind": "small_knob",
					"range": [
						0,
						1
					],
					"taper": "linear",
					"value": 5,
					"unit": "float"
				}
			},
			"onset": {
				"_props": {
					"kind": "small_knob",
					"range": [
						0,
						1
					],
					"taper": "linear",
					"value": 2.8,
					"unit": "float"
				}
			},
			"sine": {
				"_props": {
					"kind": "outlet",
					"index": 0
				}
			},
			"phasor": {
				"_props": {
					"kind": "outlet",
					"index": 1
				}
			},
			"pulse": {
				"_props": {
					"kind": "outlet",
					"index": 2
				}
			},
			"sine_index": {
				"_props": {
					"kind": "outlet",
					"index": 3
				}
			}
		}
	},
	"arcs": [
		[
			"lfo_1.sine",
			"lfo_1.fm_cv"
		],
		[
			"lfo_1.sine",
			"lfo_1.cv"
		],
		[
			"lfo_1.sine",
			"lfo_1.phasor_sync"
		]
	]
}

let delnodeSuccess = {
	"nodes": {},
	"arcs": [
		[
			"lfo_1.sine",
			"lfo_1.fm_cv"
		],
		[
			"lfo_1.sine",
			"lfo_1.cv"
		]
	]
}

let newnodeSuccess = {
	"nodes": {
		"lfo_1": {
			"_props": {
				"kind": "lfo",
				"pos": [
					-2.326367085370336,
					1.5209056349935186,
					-0.7035861792005239
				],
				"orient": [
					0.12358177055502231,
					0.41713355199484253,
					0.13623412932103282,
					0.8900378687419946
				]
			},
			"fm_cv": {
				"_props": {
					"kind": "inlet",
					"index": 0
				}
			},
			"phasor_sync": {
				"_props": {
					"kind": "inlet",
					"index": 1
				}
			},
			"pulse_width_cv": {
				"_props": {
					"kind": "inlet",
					"index": 2
				}
			},
			"rate": {
				"_props": {
					"kind": "large_knob",
					"range": [
						0,
						80
					],
					"taper": "log 3.8",
					"value": 0.17,
					"unit": "Hz"
				}
			},
			"index": {
				"_props": {
					"kind": "small_knob",
					"range": [
						0,
						10
					],
					"taper": "linear",
					"value": 3,
					"unit": "float"
				}
			},
			"pulse_width": {
				"_props": {
					"kind": "small_knob",
					"range": [
						0,
						1
					],
					"taper": "linear",
					"value": 5,
					"unit": "float"
				}
			},
			"onset": {
				"_props": {
					"kind": "small_knob",
					"range": [
						0,
						1
					],
					"taper": "linear",
					"value": 2.8,
					"unit": "float"
				}
			},
			"sine": {
				"_props": {
					"kind": "outlet",
					"index": 0
				}
			},
			"phasor": {
				"_props": {
					"kind": "outlet",
					"index": 1
				}
			},
			"pulse": {
				"_props": {
					"kind": "outlet",
					"index": 2
				}
			},
			"sine_index": {
				"_props": {
					"kind": "outlet",
					"index": 3
				}
			}
		},
		"lfo_2": {
			"_props": {
				"kind": "lfo",
				"pos": [
					-2.326367085370336,
					1.5209056349935186,
					-0.7035861792005239
				],
				"orient": [
					0.12358177055502231,
					0.41713355199484253,
					0.13623412932103282,
					0.8900378687419946
				]
			},
			"fm_cv": {
				"_props": {
					"kind": "inlet",
					"index": 0
				}
			},
			"phasor_sync": {
				"_props": {
					"kind": "inlet",
					"index": 1
				}
			},
			"pulse_width_cv": {
				"_props": {
					"kind": "inlet",
					"index": 2
				}
			},
			"rate": {
				"_props": {
					"kind": "large_knob",
					"range": [
						0,
						80
					],
					"taper": "log 3.8",
					"value": 0.17,
					"unit": "Hz"
				}
			},
			"index": {
				"_props": {
					"kind": "small_knob",
					"range": [
						0,
						10
					],
					"taper": "linear",
					"value": 3,
					"unit": "float"
				}
			},
			"pulse_width": {
				"_props": {
					"kind": "small_knob",
					"range": [
						0,
						1
					],
					"taper": "linear",
					"value": 5,
					"unit": "float"
				}
			},
			"onset": {
				"_props": {
					"kind": "small_knob",
					"range": [
						0,
						1
					],
					"taper": "linear",
					"value": 2.8,
					"unit": "float"
				}
			},
			"sine": {
				"_props": {
					"kind": "outlet",
					"index": 0
				}
			},
			"phasor": {
				"_props": {
					"kind": "outlet",
					"index": 1
				}
			},
			"pulse": {
				"_props": {
					"kind": "outlet",
					"index": 2
				}
			},
			"sine_index": {
				"_props": {
					"kind": "outlet",
					"index": 3
				}
			}
		}
	},
	"arcs": [
		[
			"lfo_1.sine",
			"lfo_1.fm_cv"
		],
		[
			"lfo_1.sine",
			"lfo_1.cv"
		]
	]
}

let propchangeSuccess =  {
	"nodes": {
		"lfo_1": {
			"_props": {
				"kind": "lfo",
				"pos": [
					-2.326367085370336,
					1.5209056349935186,
					-0.7035861792005239
				],
				"orient": [
					0.12358177055502231,
					0.41713355199484253,
					0.13623412932103282,
					0.8900378687419946
				]
			},
			"fm_cv": {
				"_props": {
					"kind": "inlet",
					"index": 0
				}
			},
			"phasor_sync": {
				"_props": {
					"kind": "inlet",
					"index": 1
				}
			},
			"pulse_width_cv": {
				"_props": {
					"kind": "inlet",
					"index": 2
				}
			},
			"rate": {
				"_props": {
					"kind": "large_knob",
					"range": [
						0,
						80
					],
					"taper": "log 3.8",
					"value": 0.7005339838596962,
					"unit": "Hz"
				}
			},
			"index": {
				"_props": {
					"kind": "small_knob",
					"range": [
						0,
						10
					],
					"taper": "linear",
					"value": 3,
					"unit": "float"
				}
			},
			"pulse_width": {
				"_props": {
					"kind": "small_knob",
					"range": [
						0,
						1
					],
					"taper": "linear",
					"value": 5,
					"unit": "float"
				}
			},
			"onset": {
				"_props": {
					"kind": "small_knob",
					"range": [
						0,
						1
					],
					"taper": "linear",
					"value": 2.8,
					"unit": "float"
				}
			},
			"sine": {
				"_props": {
					"kind": "outlet",
					"index": 0
				}
			},
			"phasor": {
				"_props": {
					"kind": "outlet",
					"index": 1
				}
			},
			"pulse": {
				"_props": {
					"kind": "outlet",
					"index": 2
				}
			},
			"sine_index": {
				"_props": {
					"kind": "outlet",
					"index": 3
				}
			}
		}
	},
	"arcs": [
		[
			"lfo_1.sine",
			"lfo_1.fm_cv"
		],
		[
			"lfo_1.sine",
			"lfo_1.cv"
		]
	]
}

let simpleSceneSuccess  = {
	"nodes": {
		"lfo_1": {
			"_props": {
				"kind": "lfo",
				"pos": [
					-2.326367085370336,
					1.5209056349935186,
					-0.7035861792005239
				],
				"orient": [
					0.12358177055502231,
					0.41713355199484253,
					0.13623412932103282,
					0.8900378687419946
				]
			},
			"fm_cv": {
				"_props": {
					"kind": "inlet",
					"index": 0
				}
			},
			"phasor_sync": {
				"_props": {
					"kind": "inlet",
					"index": 1
				}
			},
			"pulse_width_cv": {
				"_props": {
					"kind": "inlet",
					"index": 2
				}
			},
			"rate": {
				"_props": {
					"kind": "large_knob",
					"range": [
						0,
						80
					],
					"taper": "log 3.8",
					"value": 0.17,
					"unit": "Hz"
				}
			},
			"index": {
				"_props": {
					"kind": "small_knob",
					"range": [
						0,
						10
					],
					"taper": "linear",
					"value": 3,
					"unit": "float"
				}
			},
			"pulse_width": {
				"_props": {
					"kind": "small_knob",
					"range": [
						0,
						1
					],
					"taper": "linear",
					"value": 5,
					"unit": "float"
				}
			},
			"onset": {
				"_props": {
					"kind": "small_knob",
					"range": [
						0,
						1
					],
					"taper": "linear",
					"value": 2.8,
					"unit": "float"
				}
			},
			"sine": {
				"_props": {
					"kind": "outlet",
					"index": 0
				}
			},
			"phasor": {
				"_props": {
					"kind": "outlet",
					"index": 1
				}
			},
			"pulse": {
				"_props": {
					"kind": "outlet",
					"index": 2
				}
			},
			"sine_index": {
				"_props": {
					"kind": "outlet",
					"index": 3
				}
			}
		}
	},
	"arcs": [
		[
			"lfo_1.sine",
			"lfo_1.fm_cv"
		],
		[
			"lfo_1.sine",
			"lfo_1.cv"
		]
	]
}