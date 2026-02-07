---
Tags: ["dev","git"]
date: 2017-03-03T11:20:28+01:00
params: {"lang":"en"}
title: Publishing work flow template
---

After some time my
[cookiecutter](https://github.com/audreyr/cookiecutter) templates for
my data analysis work flow is finally in a state that I can show the
world.  You can get it from [github](https://github.com/bdcaf/cookiecutter-r-data-analysis).
All in all it is my way to setup a *reproducible research work flow* -
for too long I have just copied files around.

It is all about using external tools in addition to
[R](https://r-project.org/).  The most essential being
[make](https://www.gnu.org/software/make/).  I am very proud about the
makefile that keeps code and data directories clean.  I am still
considering to name the directories differently - but I have used this
scheme for so long that it has become my second nature.  Also the way
make tracks dependencies between code and data helps me keep sane in
more complex analysis work flow.

The longest I spent on getting [knitr](https://yihui.name/knitr/)
respect the directory layout on which I insist.  But finally it seems
to obey me.


I am looking forward how it will speed up my setup.
