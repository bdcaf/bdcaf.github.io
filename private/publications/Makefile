
%.yaml: %.bib
	pandoc-citeproc --bib2yaml $< > $@

mddir/.done: ccit.yaml awk_manip
	mkdir -p $(@:/.done=)
	./awk_manip < $<
	sed -i.orig -e "s/URL/url_pdf/" \
				-e "s/^container-title/containertitle/" \
				-e "s/^type:/pubtype:/" \
				-e "s/^\.$$//" \
				$(@:/.done=)/*.md
	touch $@
