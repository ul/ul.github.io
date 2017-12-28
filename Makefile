blog:
	tiddlywiki ${TIDDLY_DIR} --rendertiddlers [tag[public]] BlogTemplate "$(shell pwd)/compiled" text/plain
	sed -i '' -E 's_href="#([^"]+)"_href="/\1"_g' compiled/*.html
	mv compiled/* ./

cv:
	pdflatex CV.tex
