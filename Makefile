ROOT=.

all: download build view
-include $(ROOT)/asciidoc.mk

clean:
	rm -f 2-DartLanguageTour/1.txt 2-DartLanguageTour/2.txt

