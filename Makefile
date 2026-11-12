include Variables.ini

.PHONY: all clean

all:
	$(LATEXMK) -pdf -outdir="$(BUILD_DIR)" "$(THESIS).tex"

# Remove generated auxiliary files while retaining the PDF.
clean:
	$(LATEXMK) -c -outdir="$(BUILD_DIR)" "$(THESIS).tex"
