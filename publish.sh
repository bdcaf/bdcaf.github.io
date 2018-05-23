#!/bin/sh
git worktree public master
hugo --cleanDestinationDir -d public 
cd public/ && git add . && git commit -am pub && git push && cd ..
