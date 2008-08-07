include config/info.mk

all: html xetex txt
	python mk_html_page.py $(FULL_TITLE) $(DESC) $(KEYWORD) $(NAME) $(ROOT_LEVEL) > index.php
	python mk_html_link.py $(FULL_TITLE) $(NAME) $(DESC) > link.htm

html:
	sh nv2htm.sh $(NAME).nv

html_full: html
	cat file/start.htm > full.htm
	python mk_header.py $(FULL_TITLE) $(KEYWORD) $(DESC) >> full.htm
	cat file/clean.css >> full.htm
	cat file/body.htm >> full.htm
	cat $(NAME).htm >> full.htm
	cat file/end.htm >> full.htm
	mv full.htm $(NAME).xhtml

xetex: pdf
	#latex xetex && bibtex xetex
	xelatex xetex.tex
	# Run twice to make sur that the TOC is complete.
	# xelatex xetex.tex
	mv xetex.pdf $(NAME).pdf

print: pdf
	#latex print && bibtex print
	xelatex print.tex
	# Run twice to make sur that the TOC is complete.
	# xelatex print.tex
	mv print.pdf $(NAME)-print.pdf

latex: pdf
	#latex latex && bibtex latex
	pdflatex latex.tex
	# Run twice to make sur that the TOC is complete.
	# pdflatex latex.tex
	mv latex.pdf $(NAME)-alternate.pdf
	
pdf:
	sh nv2tex.sh $(NAME).nv

txt:
	python mk_title.py $(FULL_TITLE) ${DATE} > $(NAME).txt
	sh nv2txt.sh $(NAME) >> $(NAME).txt
	sh nv2plain.sh $(NAME).nv

clean:
	rm -f *.aux *.toc *.log full.* tmp .__* *~ *.~ config/*~ config/*.aux

distclean: clean
	rm -f *.pdf *.htm *.txt *.php *.xhtml
	rm -f texte.tex
	rm -f $(NAME)-$(VERSION).tar.bz2 $(NAME)-src-$(VERSION).tar.bz2

dist: xetex html_full txt clean
	mkdir $(NAME)-$(VERSION)
	cp *.txt $(NAME).xhtml *.pdf $(NAME)-$(VERSION)
	tar -cjf $(NAME)-$(VERSION).tar.bz2 $(NAME)-$(VERSION)
	rm -rf $(NAME)-$(VERSION)

src-dist: distclean
	mkdir $(NAME)-src-$(VERSION)
	cp -r *.nv 80fmt.py iso2htm.sed nv* mk* Makefile *.tex file/ config/ $(NAME)-src-$(VERSION)
	tar -cjf $(NAME)-src-$(VERSION).tar.bz2 $(NAME)-src-$(VERSION)
	rm -rf $(NAME)-src-$(VERSION)
