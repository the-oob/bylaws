all: bylaws.pdf

ifeq ($(shell uname -s),Darwin)
XSL := /usr/local/opt/docbook-xsl/docbook-xsl/fo/docbook.xsl
else
XSL := /usr/share/sgml/docbook/xsl-stylesheets/fo/docbook.xsl
endif

%.pdf: %.fo
	fop $< -pdf $*.pdf

%.fo: %.docbook
	xsltproc --stringparam section.label.includes.component.label 1 --stringparam section.autolabel 1 ${XSL} $< > $*.fo

clean:
	rm -f *.fo *.pdf
