---
title: "Readline"
date: 2018-01-23T17:55:06+01:00
tags:
  - today-i-learnt
  - shell
---

In many terminal programs readline is doing the editing of input.  It
is possible with `M-v` to quickly switch to vi mode and with `M-e` to
the default emacs mode.  In emacs mode one has a few commands like
`^A` to jump to the begin of line.  Usually I prefer vi - but in
command line it's not that useful to switch modes.

R in tmux got stuck in vi mode and was pasting `^A^K...` all over the
place. `M-e` fixed it.
