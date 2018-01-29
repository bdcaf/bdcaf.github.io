publish: build
	cd public && git add . && git commit -am pub && git push
build:
	hugo
