#!/usr/bin/env node

const fs = require('fs');
const path = require('path');
//const peg = require('pegjs');
const marked = require("marked");
const jsdom = require("jsdom")
const { JSDOM } = jsdom;

///// CONFIG /////

const buildpath = "./";
const backuppath = "backup";
const input = path.join(buildpath, "index1.html");

marked.setOptions({
  renderer: new marked.Renderer(),
  gfm: true,
  tables: true,
  breaks: false,
  pedantic: false,
  sanitize: false,
  smartLists: true,
  smartypants: false
});

// create backup folder if neededs
fs.mkdirSync(backuppath,{ recursive:true })


function rebuild(input) {
	console.log("rebuild", input)
	console.log("unwatching file")
	fs.unwatchFile(input);

	// create a time-stamped backup:
	{
		let src = fs.readFileSync(input, "utf8");
		let backup_name = `${path.basename(input, path.extname(input))}_${new Date().getTime().toString()}${path.extname(input)}`
		fs.writeFileSync(path.join(backuppath, backup_name), src, "utf8");
	}

	// read the source file:
	JSDOM.fromFile(input).then(dom => {
		//console.log(dom.serialize());
		const body = dom.window.document.body;
		
		[...body.querySelectorAll("div")].forEach(node => {
			if (!node.id) return;
			// look for a corresponding script source:
			console.log("SCRIPT", node.tagName, node.id, node.innerHTML)

			// find the corresponding div:
			const srcid = `#${node.id}-markdown`;
			let src = body.querySelector(srcid)
			if (src) {
				node.innerHTML = marked(src.innerHTML);
			} else {
				//console.error("couldn't find ", srcid)
			}
		});
		//console.log(dom.serialize())

		// if everything looks OK, save this file.
		fs.writeFileSync(input, dom.serialize(), "utf8");
	});

	// start watching again:
	setTimeout(function() {
		console.log("watching file again")
		fs.watchFile(input, { interval: 500 }, (e) => {
			
			rebuild(input);
		});
	}, 1000);
}

rebuild(input);