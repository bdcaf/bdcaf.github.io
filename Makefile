site: 
	hugo
	#find public -type f -exec chmod a+r {} \;
	#find public -type d -exec chmod a+rx {} \;

local:
	hugo server --buildDrafts --watch


deploy: site deploy_bplaced

deploy_bplaced: 
	lftp -e "mirror --parallel=3 -R public /; quit" ager.bplaced

deploy_uibk:
	rsync -iIprmvz --exclude '.*' \
	  --chmod=Da+rx,Fa+r --delete \
	  public/ \
	  -e ssh info-adm:homepage/

init_themes:
	git submodule update --init --recursive

update_themes:
	git submodule update --recursive
