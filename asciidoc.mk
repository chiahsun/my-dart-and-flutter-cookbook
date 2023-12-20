
.PHONY: build view watch download

TARGET_CSS=$(ROOT)/dark.css

build:
	asciidoctor -a stylesheet=$(ROOT)/dark.css -v -t index.adoc

view:
	open index.html -a Safari
	
watch:
	$(ROOT)/watch_build.sh

download: $(TARGET_CSS)

$(TARGET_CSS):
	curl -o $(ROOT)/dark.css -L https://github.com/darshandsoni/asciidoctor-skins/raw/gh-pages/css/dark.css
