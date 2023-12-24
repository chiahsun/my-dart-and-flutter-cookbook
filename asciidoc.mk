
.PHONY: build view watch

build:
	asciidoctor -a stylesheet=$(ROOT)/dark.css -v -t index.adoc

build-with-diagram:
	asciidoctor -a stylesheet=$(ROOT)/dark.css -r asciidoctor-diagram -v -t index.adoc

view:
	open index.html -a Safari
	
watch:
	$(ROOT)/watch_build.sh

# dark.css modified from https://github.com/darshandsoni/asciidoctor-skins/raw/gh-pages/css/dark.css
