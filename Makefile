site: 
	hugo
	chmod -R a+r public

local:
	hugo server --buildDrafts --watch


deploy: site
	rsync -rmvzW --exclude '.*' --delete public/ -e ssh info-adm:homepage/
