---
title: "Mass editing tags"
date: 2018-06-14T08:42:28+02:00
tags:
  - site
  - script
categories: 
  - dev
---

Having read some about the
[blogdown](https://github.com/rstudio/blogdown) package I thought I
could cleanup my site some more.

I came up with some scripts to clean up tags.

<!--more-->

Within R I could use some of the new functionality.

```
a <- blogdown:::collect_yaml()
```
would give me a nice list of my categories and tags.

First I would check how many files would use the offending
tags.  I use [ripgrep](https://github.com/BurntSushi/ripgrep) for my
searches.  To avoid replacements inside text I chose to use a regexp
as search expression.  In my case that avoided all collisions.

```
rg '^- offending'
```

Then if it's just one or two I can edit them. Just a warning I use
fish and neovim - so adjust accordingly.

```
nvim (rg '^- offending')
```

To correct spelling I did replacements like this:
```
rg '^\W*- maths$' --files-with-matches | xargs sed -i '' 's/^\( *- *\) maths$/\1math/g'
```
annoyingly macs `sed` did not support the `\s` pattern.

Fully removing a tag was done so:
```
rg '^- Allgemein' --files-with-matches | xargs sed -i '' '/^- Allgemein/d'
```

I think soon I will move stuff in subfolders.  For now this shouldn't
be problematic as there are almost no files in the data folder.  Also
I still have unresolved links to images in the old imports.  But
that's for another day.

### trouble shooting

I soon ended up having errors about empty section lists.
Unfortunately it turned out too many.  And ripgrep wouldn't match
multiline patterns.  So time to also use the (slower) [silver searcher](https://github.com/ggreer/the_silver_searcher).

```
ag -l "^categories:\n--" | xargs sed -i -e '/^categories:/d'
ag -l "^categories:\n[^ -]" | xargs sed -i -e '/^categories:/d'
```

would delete the empty categories.

#### cases...

It was a bit tricky as the page of tags showed them all in lower case - and I could locate them nicely using `rg -i` - however mac os `sed`
  was not able to ignore cases in patterns.
