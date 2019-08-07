IMAGES=$(patsubst %.svg, %.pdf, $(wildcard *.svg))

ALL: guide.pdf

guide.pdf: $(IMAGES)
	mkdir -p build
	latexmk -pdf -interaction=nonstopmode -jobname=build/guide guide.tex
	cp build/guide.pdf guide.pdf

%.pdf: %.svg
	rsvg-convert -f pdf -o "$@" "$<"

clean:
	rm -rf *.pdf
	rm -rf build
