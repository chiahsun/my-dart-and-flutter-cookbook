
.PHONY: adoc-build adoc-view adoc-watch

adoc-build: dark.css highlight/highlight.min.js
	asciidoctor -a stylesheet=dark.css -a highlightjsdir=highlight -v -t index.adoc

adoc-view:
	open index.html -a Safari
	
adoc-watch:
	$(ROOT)/watch_build.sh

adoc-download-css: dark.css

dark.css:
	curl -LO https://github.com/darshandsoni/asciidoctor-skins/raw/gh-pages/css/dark.css
