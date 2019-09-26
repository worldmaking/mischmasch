(function() {
	const isCommonjs = typeof module !== 'undefined' && module.exports;
	const performance = isCommonjs ? require('perf_hooks').performance : window.performance;

	const webutils = {

		// add a message to the overlay <div> element on the page:
		print(...args) {
			const el = document.createElement("pre");
			el.textContent = [...args].join(' ');
			console.log(el.textContent);
			document.body.appendChild(el);
		},
		
		// save the contents of a <canvas> to a PNG file
		saveCanvasToPNG(canvas, filename="canvas_image") {
			function dataURLtoBlob(dataurl) {
				let arr = dataurl.split(','), mime = arr[0].match(/:(.*?);/)[1],
					bstr = atob(arr[1]), n = bstr.length, u8arr = new Uint8Array(n);
				while(n--) u8arr[n] = bstr.charCodeAt(n);
				return new Blob([u8arr], {type:mime});
			}
			let link = document.createElement("a");
			let imgData = canvas.toDataURL({ format:'png', multiplier:4});
			let strDataURI = imgData.substr(22, imgData.length);
			let blob = dataURLtoBlob(imgData);
			let objurl = URL.createObjectURL(blob);
			link.download = filename + ".png";
			link.href = objurl;
			link.target = '_blank';
			link.click();
		},

		// load an img and draw it into a canvas
		img2canvas(path, canvas) {
			let img = new Image();   // Create new img element
			img.onload = function() {
				let ctx = canvas.getContext("2d");
				ctx.drawImage(this, 0, 0);
				let imgdata = ctx.getImageData(0, 0, canvas.width, canvas.height);
				let binary = new Uint8ClampedArray(imgdata.data.buffer);
			}
			img.src = path; // Set source path
		},

		// loads an image and turns it into a typedarray and offscreen canvas
		ArrayFromImg: class {
			constructor(path, callback) {
				let self = this;
				let img = new Image();   // Create new img element
				this.canvas = new OffscreenCanvas(64, 64);
				img.onload = function() {
					self.width = this.width;
					self.height = this.height;
					self.canvas.width = self.width;
					self.canvas.height = self.height;
					let length = self.width * self.height;
					let ctx = self.canvas.getContext("2d");
					ctx.drawImage(img, 0, 0);
					self.imgdata = ctx.getImageData(0, 0, self.width, self.height);
					let binary = new Uint8ClampedArray(self.imgdata.data.buffer);
					let data = new Float32Array(length*4);
					for (let i=0; i<length; i++) {
						data[i*4+0] = (binary[i*4+0] / 255);
						data[i*4+1] = (binary[i*4+1] / 255);
						data[i*4+2] = (binary[i*4+2] / 255);
						data[i*4+3] = (binary[i*4+3] / 255);
					}
					self.data = data;

					if (callback) callback.apply(self);
				}
				img.src = path; // Set source path
			}

			setA(x, y, a) {
				if (!this.data) return 0;

				let idx = 4*(Math.floor(x) + Math.floor(y) * this.width);
				this.data[idx+3] = a;
			}

			read(x, y) {
				if (!this.data) return 0;

				let idx = 4*(Math.floor(x) + Math.floor(y) * this.width);
				return this.data[idx+1];
			}

			readInto(x, y, v) {
				if (this.data) {
					let idx = 4*(Math.floor(x) + Math.floor(y) * this.width);
					v[0] = this.data[idx];
					v[1] = this.data[idx+1];
					v[2] = this.data[idx+2];
					v[3] = this.data[idx+3];
				}
				return v;
			}

			readDot(x, y, xyz) {
				if (!this.data) return 0;
				let idx = 4*(Math.floor(x) + Math.floor(y) * this.width);
				return this.data[idx] * xyz[0]
					+ this.data[idx+1] * xyz[1]
					+ this.data[idx+2] * xyz[2];
			}
		},

		getQueryStringParamterByName(name, url) {
			if (!url) url = window.location.href;
			name = name.replace(/[\[\]]/g, '\\$&');
			var regex = new RegExp('[?&]' + name + '(=([^&#]*)|&|#|$)'),
				results = regex.exec(url);
			if (!results) return null;
			if (!results[2]) return '';
			return decodeURIComponent(results[2].replace(/\+/g, ' '));
		},

		makeStyleSheet(css) {
			// Create the <style> tag
			var styleNode = document.createElement("style");
			styleNode.type = "text/css";
			// WebKit hack :(
			styleNode.appendChild(document.createTextNode(""));

			// Add a media (and/or media query) here if you'd like!
			// styleNode.setAttribute("media", "screen")
			// styleNode.setAttribute("media", "only screen and (max-width : 1024px)")

			if (css) {
				//styleNode.styleSheet.cssText = ;
				styleNode.appendChild(document.createTextNode(css));
			}

			// Add the <style> element to the page
			document.head.appendChild(styleNode);

			return styleNode.sheet;
		},
	};

	if (isCommonjs) {
		module.exports = webutils;
	} else {
		window.webutils = webutils;
	}

})()