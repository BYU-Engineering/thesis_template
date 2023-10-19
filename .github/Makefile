all: onesided twosided

onesided: ../src/template.pdf
twosided: ../src/template_twosided.pdf

../src/template.pdf: ../src/template.tex
	cd ../src && latexmk -pdf template.tex

../src/template_twosided.pdf: ../src/template_twosided.tex
	cd ../src && latexmk -pdf template_twosided.tex

.PHONY: all onesided twosided