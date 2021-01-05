SRC := $(find src -type f -name "*.md")
BUILD=$(echo $SRC | sed -e "s,\.md,.html,g" -e "s,src/,build/,g")
TMP="/tmp/temp.html"

RM=rm
MD='markdown2 --extras code-friendly,fenced-code-blocks,footnotes,header-ids,metadata,numbering,smarty-pants,strike,wiki-tables --encoding="utf-8" src/about.md | sed -e "s,&#8617;,\&uarr;,g"'

%.html : %.md
	@$(MD) $< > $TMP

# Targets and dependencies

.PHONY: all clean

all : $(BUILD)

clean:
	@- $(RM) -f $(BUILD)
