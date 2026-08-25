# Build the Information Security assignments with TeX Live.
#
# Every assignment lives in src/<name>/main.tex and is built into
# build/<name>.pdf. latexmk runs from src/, because the assignments refer to
# the class as ../is-assignment and the class refers to the fonts as ../fonts/;
# both are resolved relative to that directory.

# TEXINPUTS puts the repository root and the shared latex/ subtree ahead of the
# TeX tree, so is-assignment.cls and teaching-base.sty are the ones that load.
TEXINPUTS_ROOT := ..:../latex:

LATEXMK ?= latexmk
LATEXMKFLAGS ?= -xelatex -shell-escape -halt-on-error -interaction=nonstopmode

ASSIGNMENTS := $(patsubst src/%/main.tex,%,$(wildcard src/*/main.tex))
PDFS := $(patsubst %,build/%.pdf,$(ASSIGNMENTS))

.PHONY: all
all: $(PDFS)

build/%.pdf: src/%/main.tex is-assignment.cls $(wildcard latex/*.sty) $(wildcard latex/fonts/*.ttf)
	@mkdir -p build
	cd src && TEXINPUTS=$(TEXINPUTS_ROOT) $(LATEXMK) $(LATEXMKFLAGS) -jobname=$* -outdir=../build $*/main.tex

.PHONY: list
list:
	@for assignment in $(ASSIGNMENTS); do echo "$$assignment"; done

.PHONY: clean
clean:
	cd src && TEXINPUTS=$(TEXINPUTS_ROOT) $(LATEXMK) -outdir=../build -C >/dev/null 2>&1 || true
	rm -rf build src/_minted-*

.PHONY: help
help:
	@echo "make          build every assignment into build/"
	@echo "make list     list the assignments"
	@echo "make clean    remove build artefacts"
