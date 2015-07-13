site: 
	hugo

local:
	hugo server --buildDrafts --watch


deploy-list.txt: site
	find public -type f -and ! -name ".*" > $@

deploy: deploy-list.txt

