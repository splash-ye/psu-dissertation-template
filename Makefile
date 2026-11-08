.DEFAULT_GOAL := all

LATEXMK ?= latexmk
BUILD_DIR := build
MAIN := dissertation
LATEX_FLAGS := -xelatex -interaction=nonstopmode -halt-on-error -file-line-error -synctex=1

# Always invoke latexmk: its recorder tracks nested inputs, bibliography files,
# class/package changes, and figures, and skips work when everything is current.
.PHONY: all clean
all:
	@command -v "$(LATEXMK)" >/dev/null 2>&1 || { echo "latexmk is required. Install MacTeX or TeX Live (including latexmk)." >&2; exit 1; }
	@command -v xelatex >/dev/null 2>&1 || { echo "xelatex is required. Install MacTeX or TeX Live, plus the Times New Roman font." >&2; exit 1; }
	@command -v bibtex >/dev/null 2>&1 || { echo "bibtex is required. Install MacTeX or TeX Live." >&2; exit 1; }
	@mkdir -p "$(BUILD_DIR)"
	$(LATEXMK) $(LATEX_FLAGS) -outdir="$(BUILD_DIR)" "$(MAIN).tex"

# Keep the compiled PDF; remove only this project's generated auxiliary files.
clean:
	$(LATEXMK) -c -outdir="$(BUILD_DIR)" "$(MAIN).tex"
	@rm -f "$(BUILD_DIR)/$(MAIN).bbl" "$(BUILD_DIR)/$(MAIN).synctex.gz"
