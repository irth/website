GMI_FILES := $(shell find . -type f -name '*.gmi')
HTML_FILES := $(patsubst %.gmi,%.html,$(GMI_FILES))

.PHONY: all
all: $(HTML_FILES) blog/index.html blog/atom.xml

blog/index.html: blog/posts/*.gmi blog/blog.sh
	cd blog && ./blog.sh generate
	gm2html -header=header.html -footer=footer.html blog/index.gmi blog/index.html

blog/atom.xml: blog/posts/*.gmi blog/blog.sh
	gemfeed -b gemini://irth.pl/blog/posts -d blog/posts -o ../atom.xml -t "Personal blag" -a "Wojciech ~irth Kwolek" -e "me@irth.pl" && sed -i 's./posts/"./".' blog/atom.xml


%.html: %.gmi header.html footer.html blog/template
	gm2html -header=header.html -footer=footer.html $< $@


