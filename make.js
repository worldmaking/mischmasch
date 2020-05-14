#!/usr/bin/env node

///// CONFIG /////

var contentpath = "content/";
var buildpath = "./";

///// GLOBALS /////

var fs = require('fs');
var path = require('path');
var peg = require('pegjs');
var markdown = require ("markdown").markdown;
marked = require("marked");
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

var markup = peg.buildParser(fs.readFileSync("markup.pegjs", "utf8"));

var convert = function(input) {
	var chunks = markup.parse(input);
	for (i in chunks) {
		var s = chunks[i];
		// ignore HTML chunks:
		if (s.charAt(0) != "<") {
			chunks[i] = marked(chunks[i]);
		} 
		
	}
	return chunks.join("\n");
}

var Handlebars = require ("Handlebars");

var has_md = /\.md$/;

function build() {
	// read the template:
	var template = fs.readFileSync("content/template.html", "utf8");
	template = Handlebars.compile(template);

	var files = fs.readdirSync(contentpath);
	for(var i=0;i<files.length;i++) {
		var filename = path.join(contentpath,files[i]);
		var stat = fs.lstatSync(filename);
		if (!stat.isDirectory()){
		
			var ext = path.extname(filename);
			var base = path.basename(filename, ext);
			
			console.log(base, ext);
			
			if (ext == ".md") {
				var src = fs.readFileSync(filename, "utf8");
				
				var data = {
					title: base,
					content: convert(src), //markdown.toHTML(src),
				};
				
				var html = template(data);
				
				var outpath = path.join(buildpath,base + ".html");
				
				console.log("writing", outpath);
				
				fs.writeFileSync(outpath, html);
			}
		
		}
	};
}

build();

// todo: if any file in /content is modified, rebuild