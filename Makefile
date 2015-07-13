site: 
	hugo

local:
	hugo server --buildDrafts --watch


deploy: site
	rsync -amzW --exclude '.*' --delete public/ -e ssh info-adm:homepage/
