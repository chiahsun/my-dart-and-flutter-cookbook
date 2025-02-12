VERSION=11.11.1

JS=asciidoc.js bash.js dart.js diff.js dockerfile.js json.js makefile.js markdown.js python.js shell.js yaml.js
LANG_DIR=languages
TARGET_JS=$(patsubst %.js,$(LANG_DIR)/%.min.js,$(JS)) 

STL_DIR=styles
CSS=night-owl.min.css
TARGET_CSS=$(patsubst %.css,$(STL_DIR)/%.css,$(CSS))


all: highlight.min.js $(TARGET_JS) $(TARGET_CSS)

highlight.min.js:
	curl -LO "https://cdnjs.cloudflare.com/ajax/libs/highlight.js/$(VERSION)/highlight.min.js"


$(LANG_DIR) $(STL_DIR):
	mkdir -p $@

$(LANG_DIR)/%.js: $(LANG_DIR)
	cd $(LANG_DIR) && curl -LO "https://cdnjs.cloudflare.com/ajax/libs/highlight.js/$(VERSION)/$@" 


$(STL_DIR)/%.css: $(STL_DIR)
	cd $(STL_DIR) && curl -LO "https://cdnjs.cloudflare.com/ajax/libs/highlight.js/$(VERSION)/$@"

clean:
	rm -rf $(LANG_DIR) $(STL_DIR)
