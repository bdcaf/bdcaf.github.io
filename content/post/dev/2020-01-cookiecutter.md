---
title: "2020 01 Cookiecutter"
date: 2020-02-11T10:00:40+01:00
tags:
  - cookiecutter
---

Having some more time at hand I was able to add long overdue alterations to [cookiecutter-r-data-analysis](https://github.com/bdcaf/cookiecutter-r-data-analysis).
I left my template alone for about a year and during this time I have developed some new practices and given up on some others.
<!--more-->

In case you just got here: [Cookiecutter](https://github.com/audreyr/cookiecutter) is a templating system for programming projects. 
You find a template for your project and by calling `cookiecutter templatename` a project folder filled with filled templates is generated.

## R package structure

I now try to stick closer to the R package folder structure.
Although I am not working on packages this brings a few benefits. 
I can now use the functions provided by [usethis](https://usethis.r-lib.org/) and the `devtools::load_all()`.
Mostly I use the `load_all()`. 
Before I had to source all my functions. Often this got in a tedious recursive task, or even worse I had to build a package just for the functions.
The downside being I now need to manually create make rules to depend on the function definitions.

A nice side effect of the package structure is that it now is easier to turn a project into a package.
The greatest problem was to generate project slugs and folder names that will confirm Rs naming rules.
This issue arises for more often for such projects. Often a dataset from a user comes in and it is not clear what to do with it. 
Too often I end up with a title something like "Usernames measurement of xy beginning of 2019".

For now I sattle on a camel case format for the slug. 
The only snake case R would accept was with dots instead of the usual `_`.
Using `-` was out of the question.
Leaving it to the user to suggest naming if special characters need to be in the project name. 
Anyway it's just about the slug - I don't want to invest more time into it.

## File organization

I found it beneficial to work with lots of subfolders.
My typical project I have lots of almost identical subreports - think about reports for each sub campaign within a study. 
The campaigns are similar, but often with a few adjustments - say adding a new sensor, extending the protocol, etc.
The changes are simple enough so that they can be later aggregated, although almost every campaign has a spin that deserves a little subreport.
A chore to come up with unique names for the produced files. 
Having it separated in one folder per subreport achieves the same.

As a side effect of using R package functions I now need to split my R code now into *functions* in the `r` directory that will get repeatedly sourced and `scripts` that will operate on input files.

I still have not settled on the name of the folder for `Rnw` and `Rmd` files that generate the subreports.
Using `vignettes` as for R packages does cause problems with the R functions for building vignettes. 


## Automatic dependencies

I like to split my reports into multiple files.
This makes my live easier as I need to worry less about leftover temporary variables and import of conflicting packages.
In the Makefile this makes writing all dependencies down annoying. 
I'm working on ways to automate this.
My aim is not to find a perfect solution.
I doubt that is even possible with reasonable effort.
Rather I want to automate away some of the most boring patterns.

## Example project

I include a trivial example project so I can generate a little minimal working project as example.
There were leftover mentions of the previous example project in the generated files.
Don't know how they stayed - but I hope now all of those are gone.

This used to be the tutorial of Kaggle working on a dataset of Titanic passengers. Turns out is locked away behind a login page that I didn't see, and most annoyingly the data may only be downloaded by kaggle members.
Since the tutorial didn't matter I replaced it with something available under an open license and downloadable without registration. 
I chose a tutorial hosted by CERN.


## Conclusion

Well hope this template is also useful for you. 
I have some more strategies that I would like to have templated in there, but I am not sure yet how to tackle these.
