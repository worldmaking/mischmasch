(function() {
	const isCommonjs = typeof module !== 'undefined' && module.exports;
	const performance = isCommonjs ? require('perf_hooks').performance : window.performance;

	// pick an element at random from an array
	function pick(array) {
		return array[Math.floor(Math.random() * array.length)];
	}

	function isPowerOf2(value) {
		return (value & (value - 1)) == 0;
	}

	class FPS {
		constructor() {
			this.t = 0.001*performance.now();
			this.fps = 60;
			this.dt = 1/this.fps;
			this.dtavg = this.dt;
			this.fpsavg = this.fps;
		}

		tick() {
			let t1 = 0.001*performance.now();
			this.dt = (t1-this.t);
			this.fps = (1/this.dt);
			let alpha = Math.min(1, Math.max(0.001, this.dtavg));
			this.dtavg += alpha*(this.dt-this.dtavg);
			this.fpsavg += alpha*(this.fps-this.fpsavg);
			this.t = t1;
		}
	};

	let utils = {
		FPS: FPS,
		pick: pick,
		isPowerOf2: isPowerOf2,
	};
	if (isCommonjs) {
		module.exports = utils;
	} else {
		window.utils = utils;
	}
})()

