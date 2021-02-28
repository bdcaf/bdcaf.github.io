BUILD_DIR:=public

publish: build
	cd $(BUILD_DIR) && git add . && git commit -am pub && git push

build:
	rm -rf $(BUILD_DIR)/*
	hugo --minify

update: 
	git fetch --all
	cd public && git reset --hard origin/master

#allinks.txt:
	#find public -type f -iname "*.html" -exec sed -n 's/.*href="\([^"]*\).*/\1/p' {} \; | sed '/https:\/\/bdcaf.github.io/d' | uniq > $@
	#wget --spider -r -nd -nv -H -l 1 -w 2 -o run1.log localhost:1313

#unused_css:
	#purifycss public/style.min.*.css      public/"**.html" -r -o tmp
	#rm tmp

#import_bibtex: 
	 #academic import --overwrite --bibtex ~/Downloads/cager.bib
