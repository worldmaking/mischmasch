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

var md = document.getElementById("md").textContent;
var html = marked(md);
document.getElementById("html").innerHTML = html;