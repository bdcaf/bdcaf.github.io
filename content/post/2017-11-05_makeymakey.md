---
title: "Makey Makey"
date: 2017-11-05T08:51:41+01:00
tags: 
  - R
  - make
  - dev
---

I am quite confident using `make` to create complex reports.
As I dig into `R` I see they have an [interesting work flow
creating packages](http://r-pkgs.had.co.nz).  It addresses a
few important issues - tracking dependent packages,
documenting stuff and testing.  Most important packaging and
installing on other systems can be done automatically using
a single command.  I want that.

I found `Makefiles` mentioned several times included in the
documentation - but so far haven't figured out how they are
supposed to be used.  Eventually I decided to experiment
with an own project
[vignetteBuilderMake](https://github.com/bdcaf/vignetteEngineMake).
It is not supposed to change anything in the core R package
process however it is intended to build vignettes using
`make` while still allowing the nice features of the package
tools.

Feel free to try it out.  A word of warning, once I
understand the process better I hope I can make a better
suited package.
