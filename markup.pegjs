doc = c:(special / markdown)* {
	// flatten:
	return [].concat.apply([], c);
}

// just keep consuming as much as possible until a special is hit
// and collapse into a single string via $
markdown = $(!special .)+ 

// special clauses that are handled independently
special = css_span

// wrap a hunk of markdown in a <span> with a css class
// also handles multiple classes e.g. 
// .foo, bar[markdown]
css_span = eol+ "." css:$[a-zA-Z1-9_, -]+ body:css_span_body { 
	return ["<span class='"+css+"'>", body, "</span>"]; 
}

// body should be any text until we hit a balancing "]"
// thus defined recursively
// might need to handle other content in the body variants
// e.g. strings and code blocks
// to avoid incorrectly counting unbalanced "[" and "]" terms therein
css_span_body = "[" body:$(css_span_body / [^\]])+ "]" { return body; }

eol = [\n\r]