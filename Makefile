GMI_FILES := $(shell find . -type f -name '*.gmi')
HTML_FILES := $(patsubst %.gmi,%.html,$(GMI_FILES))

.PHONY: all blog_index
all: $(HTML_FILES)

blog/index.html: blog/posts/*.gmi blog/blog.sh
	cd blog && ./blog.sh generate
	gm2html -header=header.html -footer=footer.html blog/index.gmi blog/index.html


%.html: %.gmi header.html footer.html blog/template
	gm2html -header=header.html -footer=footer.html $< $@

