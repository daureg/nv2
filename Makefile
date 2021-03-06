include config/info.mk
SAVE=$(NAME)-`date +"%Y%m%d"`
PYTHON	=	python2
ifeq ($(FINI), 1)
	TEXFILE=print
else
	TEXFILE=print_pas_fini
endif

all: html xetex txt
	$(PYTHON) mk_html_page.py $(FULL_TITLE) $(DESC) $(KEYWORD) $(NAME) $(ROOT_LEVEL) $(DATE) > index.php
	$(PYTHON) mk_html_link.py $(FULL_TITLE) $(NAME) $(DESC) > link.htm

html:
	sh nv2htm.sh $(NAME).nv

html_full: html
	cat file/start.htm > full.htm
	$(PYTHON) mk_header.py $(FULL_TITLE) $(KEYWORD) $(DESC) $(DATE) >> full.htm
	cat file/clean.css >> full.htm
	cat file/body.htm >> full.htm
	printf '<h1 style="text-align:center;margin-bottom:3em;">%s</h1>' $(FULL_TITLE) >> full.htm
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
ifneq ($(FINI), 1)
	echo "\begin{center} \emph{" $(FULL_TITLE) "\\\\" $(DATE)"}\\\\\end{center}" > tmp
else
	echo "" > tmp
endif
	cat texte.tex >> tmp
	@mv tmp texte.tex
	xelatex $(TEXFILE).tex
	# Run twice to make sur that the TOC is complete.
	# xelatex print.tex
	mv $(TEXFILE).pdf $(NAME)-print.pdf

latex: pdf
	#latex latex && bibtex latex
	pdflatex latex.tex
	# Run twice to make sur that the TOC is complete.
	# pdflatex latex.tex
	mv latex.pdf $(NAME)-alternate.pdf
	
pdf:
	sh nv2tex.sh $(NAME).nv
	echo "\title{$(FULL_TITLE)}" > config/titre.tex
	echo "\author{Géraud Le Falher}" >> config/titre.tex
	echo "\date{$(DATE)}" >> config/titre.tex

txt:
	$(PYTHON) mk_title.py $(FULL_TITLE) ${DATE} > $(NAME).txt
	sh nv2txt.sh $(NAME) >> $(NAME).txt
	sh nv2plain.sh $(NAME).nv

clean:
	rm -f *.aux *.toc *.log full.* tmp .__* *~ *.~ config/*~ config/*.aux config/titre.tex

distclean: clean
	rm -f *.pdf *.htm *.txt *.php *.xhtml
	rm -f texte.tex
	rm -f $(NAME)-$(VERSION).tar.bz2 $(NAME)-src-$(VERSION).tar.bz2 $(SAVE).tar.bz2

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

save:
	mkdir $(SAVE)
	cp $(NAME).nv config/info.mk $(SAVE)
	tar -cjf $(SAVE).tar.bz2 $(SAVE)
	rm -rf $(SAVE)
