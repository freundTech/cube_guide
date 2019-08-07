IMAGES=$(patsubst %.svg, %.pdf, $(wildcard images/*.svg))

ALL: guide.pdf

guide.pdf: $(IMAGES)
	mkdir -p build
	latexmk -pdf -interaction=nonstopmode -jobname=build/guide guide.tex
	cp build/guide.pdf guide.pdf

images/%.pdf: images/%.svg
	rsvg-convert -f pdf -o "$@" "$<"

clean:
	rm -f images/*.pdf
	rm -f guide.pdf
	rm -rf build/
