site: 
	hugo
	find public -type f -exec chmod a+r {} \;
	find public -type d -exec chmod a+rx {} \;

local:
	hugo server --buildDrafts --watch


deploy: site
	rsync -rmvzW --exclude '.*' --delete public/ -e ssh info-adm:homepage/
