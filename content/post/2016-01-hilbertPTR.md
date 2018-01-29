---
Description: ""
Tags:
- sci
- visualization
date: 2016-03-30
title: Mass spectra visualization
---

I saw some [nice visualiztion for IP
adresses](http://datadrivensecurity.info/blog/posts/2015/Jan/mapping-ipv4-address-in-hilbert-space/)
which made use of the hilbert curve for mapping sequatial data into an
area. This has the nice benefit of assuring numbers that are close to
each other stay close in two dimensions as well.  Unfortunately the
opposite does not hold.  Conveniently a function to produce a hilbert
curve is provided via
[HilbertVis](https://bioconductor.org/packages/release/bioc/html/HilbertVis.html)
on bioconductor.


<!--more--> 

### PTR-MS spectra

I have been playing with PTR-MS data for some while.  It's always hard to 
visualize this datasets. There are some nice patterns showing up - isotopic and 
due to hydratization.

### data

I will not show out reading out the data - it was collected using a Ionicon PTR-TOF MS
which requires tedious preprocessing - most of which I can finally do in R but 
the code is poorly documented so far.  The measurment is actually from a proband 
who took a sip of ethanol a few minutes before measurement.

Just a glimpse of it looks like this:

 mass | counts 
------|--------
  21  | 142720 
  22  | 18708  
  23  |  8148  
  24  |  7137  
  25  |  6711  
  26  |  6468  

## Experiments

Since over m/z 100 there is only sparse signal I created the relevant Hilbert
curve doing



### Curves


The first plot uses scales the area of the dots at the masses to the observed counts.

![plot of chunk first try](/~c1891011/photo/2016-01-hilbertPTR_fig/2016-01-hilbertPTR_firsttry-1.png)

This plot shows a little structure - the main blocks are of 16 numbers. 

+ The numbers 1 to 16 are basically zero as there are no protonated ions at such masses.  
+ The next block contains the major precursors - the hydronium ion
  \\(H_3O^+\\) with its isotopes at m/z 19 to 21, \\(NO^+\\) at 30 and
  \\(O_2^+\\) at 32. A little visible is ammonia at m/z 18. 
+ The block from 33 to 48 contains the Zundel ion (\\(H_2O \cdot
  H_3O^+\\) ) as well as ethanol at 47 (with some isotops at 48) and its
  metabolite acetaldehyde at 45.
+ Following block contains the important compound acetone at 59 and
  not visible the next metabolite of ethanol acetic acid at 61.
+ Next block contains isoprene at 69 as well as hydrated ethanol ion at 65. 
+ The following blocks show no visible ions although at aromatics like toluene (m/z 93) should show up there.

Unfortunately when observed on the PTR-TOF it can be seen that the signal is 
saturated at m/z 19, 37 and 47. So lets scale down the max signal.  
The concentration of the observed compounds is in the ppm's.
![plot of chunk scaled in](/~c1891011/photo/2016-01-hilbertPTR_fig/2016-01-hilbertPTR_scaledin-1.png)

Finally we see a little more.  But still only compounds that occur in  
concentrations of several ppbs.

Lets try to use logarithmic scale instead.

![plot of chunk log scale](/~c1891011/photo/2016-01-hilbertPTR_fig/2016-01-hilbertPTR_logscale-1.png)

Now the plot shows many more compounds.  All the main ions are tailed by some ions of their isotopes. Though it is still hard to see where some traces occur. I experimentd with some zooming but overall there was little benefit to it.  My next try will be to see if I can create an animated version of this to follow a volunteers breath pattern.

The code for this page was written in `R`.  I will keep investigating and probably put a link to the git repo online once it reaches a more mature state.
