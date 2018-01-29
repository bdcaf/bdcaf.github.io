---
title: "Vim builtin package manger"
date: 2018-01-26T09:33:42+01:00
tags:
  - vim
  - today_i_learnt
---

I was using [dein package manager](https://github.com/Shougo/dein.vim)
for some time happily.  Till yesterday it started acting up during
update and even messed up already installed plugins.  After some
messing around I admitted I will not be able to solve it easily so I
tried to give the new builtin package manager a try.  I followed this
[post](https://shapeshed.com/vim-packages/).  And it seems to work
like a charm, also within nvim.

I added all my packages using `git submodule add` in directories like
`pack/git/start` and `pack/helper/opt`.  The nice thing is I can now
update them easily using `git submodule update --init --recursive
--merge`.  So I won't need the features for asynchronous updates any
more.

The only difference I noted to the post guiding me was I had the
impression that I could put plugins directly in the `pack` directory.
For some reason they only load for me when placed in sub directories.
The optional plugins I will need to load using using `pacadd` - like
e.g. `packadd Nvim-R`.  I did not put these into `ftplugin` - but all
in all doesn't look like more hassle than what `dein` offered.


