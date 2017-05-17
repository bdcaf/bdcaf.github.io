---
Description: "short rant about machine learning"
Tags: ["xkcd", "machine learning"]
date: 2017-05-17T10:55:52+02:00
lang: en
title: Machine Learning
---

[XKCD](https://xkcd.com) has a wonderful new comic:

![the comic](https://imgs.xkcd.com/comics/machine_learning.png)


These days there also was an [article in MIT technology
review](https://www.technologyreview.com/s/604087/the-dark-secret-at-the-heart-of-ai/?set=607864)
criticising the same issue.

For me this is a daily issue.  My colleagues usually are happy to just
get a quick test procedure; usually on smallish data.  Chances are it
pattern matches some noise.  But nobody will find out as reading what a
classifier found is near impossible.  I mean sure we weed out all the
nonsensical predictor variables -- but even on the sensibel there is
additional information mixed in.  And once a machine learning procedure
is through all is hashed and mixed.

Personally I prefer hypothesis tests in research and leave
the classification to black magicians.  These point out 
effects that can be discussed; using not just stats but also all the
other scientific knowledge we have at hand.  Then we can make models and
start predicting on these.  Our models are on the more simplistic
side, but at least they make hypotheses that are testable.  And
ultimately can be used as classifier.

By the way another common misunderstanding is that the existence of a
classifier is evidence for a pattern.  It couldn't be more wrong --
machine learning will always produce a classifier, no matter whether
there is sense to it or not.  In scientific sense it means this can not
be falsified as there only is one outcome.

Too bad that too often I am required to quickly present a classifier.
These classifiers just are so attractive to medics.  I would like to
finish with [one weird kernel trick](http://oneweirdkerneltrick.com/).

[![weird kernel trick](http://oneweirdkerneltrick.com/paperfigs/vapnik.jpg)](http://oneweirdkerneltrick.com/)
