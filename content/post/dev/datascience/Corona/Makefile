REPORT_DIR:=render
CACHEDIR= cache
LMK=latexmk -pdf -f --interaction=nonstopmode -outdir=$(REPORT_DIR) -bibtex
.PHONY= all clean
WORKSCRIPTS:=$(wildcard scripts/*.R) 
DOCSCRIPTS:=$(wildcard doc/*.Rnw) $(wildcard doc/*/*.Rnw) $(wildcard doc/*.Rmd) $(wildcard doc/*/*.Rmd) $(wildcard doc/*.tex) $(wildcard doc/*/*.tex)

R:=Rscript
# note: No `:` in knitBase - it must be able to expand at call!
knitBase=$R \
	-e "require(knitr); require(markdown);" \
	-e "knitr::opts_knit[['set']](root.dir = normalizePath('./'))" \
	-e "knitr::opts_chunk[['set']](cache.path='$(@D)/')" \
	-e "knitr::opts_chunk[['set']](fig.path='$(@D)/')" \
	-e "knitr::opts_chunk[['set']](fig.lp='fig:')" \
	-e "knitr::opts_chunk[['set']](fig.show='asis')" \
	-e "library(pander)" \
	-e "panderOptions('table.style', 'rmarkdown')" \
	-e "panderOptions('table.split.table', Inf)" 

all: reports 

reports: artifacts/cern.docx artifacts/vignette.pdf

Makefile.auto: $(WORKSCRIPTS) $(DOCSCRIPTS)
	@REPORTDIR=$(REPORT_DIR) perl scripts/recursive.pl $^ > $@
include Makefile.auto
include Makefile.project
include Makefile.blog

## data-raw
data-raw/%: 
	make -C data-raw $(patsubst data-raw/%,%,$@)

## data
data: 
data/%.RDS: scripts/create_%.R
	$R $< $@


$(REPORT_DIR)/%.md : doc/%.md
	-mkdir -p $(@D)
	cp $< $@

$(REPORT_DIR)/%.md : doc/%.Rmd
	-mkdir -p $(@D)
	$(knitBase) -e "knit('$<', '$@')"
	sed -i.bak -E 's:^!\[([^#]*)#?(.*)\]\($(@D)/(.*)\):{{< bundle-figure name="\3" class="\2"  caption="\1" >}}:g' $@ 

artifacts/%.docx: $(REPORT_DIR)/%.md
		pandoc $+ -o $@


## latex report
$(REPORT_DIR)/%.bib: doc/%.bib
	-mkdir -p $(REPORT_DIR)	
	cp $< $@

$(REPORT_DIR)/%.tex: doc/%.Rnw
	-mkdir -p $(REPORT_DIR)	
	$R  -e "require(knitr)" \
		-e "knitr::opts_knit[['set']](root.dir = normalizePath('./'))" \
		-e "knitr::opts_chunk[['set']](cache.path='$(REPORT_DIR)/$(basename $(@F))/')" \
		-e "knitr::opts_chunk[['set']](fig.path='$(REPORT_DIR)/$(basename $(@F))/')" \
		-e "knitr::opts_chunk[['set']](fig.lp='fig:')" \
		-e "knitr::opts_chunk[['set']](echo=TRUE, warning=FALSE)" \
		-e "knitr::opts_chunk[['set']](results='asis', dpi=144, fig.width=4, fig.height=3)" \
		-e "knitr::knit('$<', output='$@')"


artifacts/%.pdf: $(REPORT_DIR)/%.pdf
	cp $< $@

$(REPORT_DIR)/%.pdf: $(REPORT_DIR)/%.tex $(REPORT_DIR)/bibliography.bib
	$(LMK) $<
# end generic 

#cleaning
clean: docclean articlean dataclean

dataclean:
	-rm -rf data/*

articlean:
	-rm -rf artifacts/*

docclean:
	-rm -rf $(REPORT_DIR)/*
# end cleaning 
