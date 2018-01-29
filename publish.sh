#!/bin/sh
hugo && cd public/ && git add . && git commit -am pub && git push && cd ..
