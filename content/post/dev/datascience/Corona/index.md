---
title: "Ternary plots for development of COVID19"
author: "Clemens Ager"
date: "2020-03-21"
link-citations: yes
draft: true
---

I found the inspiring post [corona virus data](https://towardsdatascience.com/chasing-the-data-coronavirus-802d8a1c4e9a). 
Since I'm not too interested in the current [tidytuesday] data I decided to have my go at it.
I'm currently studying [ternary plots](https://en.wikipedia.org/wiki/Ternary_plot).
These are great to investigate *mixtures* of three compounds.
The combination of *active*, *recovered* and *letal* cases seem to be a good fit.
I created a Github repo [Corona](https://github.com/bdcaf/Corona).

{{< bundle-figure name="top5plot-1..svg" class=""  caption="Ternary plot 5 most infected countries" >}}

<!--more-->



```r
library(dplyr)
library(tidyr)

library(Ternary)
library(emojifont)
load.emojifont('EmojiOne.ttf')

library(RColorBrewer)

# svg for high quality plots
library(svglite)
knitr::opts_chunk$set(
		      dev = "svglite",
		      dev.args = list(),
		      fig.ext = ".svg"
)

devtools::load_all()
```

It has the confusing American date format and `/` in the column labels.
Required some cleaning.


```r
timeSeries <- readRDS("data/timeSeries.RDS")
```

{{% alert warning %}}
It turns out that ggtern is not compatible with the recent ggplot2.  As the [github repo](https://github.com/nicholasehamilton/ggtern) was last updated 2015 I don't have much hope for an patch. 
Having a short glance at the issue seems it is something fundamental.

I moved over to the [Ternary](https://cran.r-project.org/web/packages/Ternary/index.html) package. Which is kept up to date. Unfortunately I still have the layout eating up the axis labelling.
{{% /alert %}}

{{% alert note %}}
The data was imported from [CSSEGISandData/COVID-19](https://github.com/CSSEGISandData/COVID-19) which aggregates data from several sources.
Data seems to be added daily, but not sure how reliable new sources are integrated.
The displayed data was retrieved on 2020-03-21, the last recorded data point is from 2020-03-20.
{{% /alert %}}

# Ternary plots


```r
countryData <- timeSeries %>% 
  group_by(Country, date) %>%
  summarise_at(vars(confirmed, recovered, deaths), sum ) %>%
  ungroup %>%
  convertToRatios

ternData <- timeSeries %>%
  mutate(rRec = recovered/confirmed,
	 rDeath = deaths/confirmed) %>%
  replace_na(list(rRec=0, rDeath=0)) %>%
  mutate(rRem = 1 - rRec -rDeath)
```


For starters I would focus on Hubei province as it has had the longest development.
It starts off with lots of active cases in the lower right corner, but now steadily moves to the left having about 4% lethality.



```r
d0 <- ternData %>% filter(Country == "China", Province == "Hubei")
coords  <- d0 %>% toTernCoord
corTernGrid(grid.lines = 5, grid.minor.lines=0)
ternOneCountry(data = d0,
	     col=rgb(255, 0, 0, 128, NULL, 255)
)
placeSymbols()
```

{{< bundle-figure name="unnamed-chunk-3-1..svg" class=""  caption="Hubei Province development" >}}

The red line follows the ratios. 
It starts to the lower left in the corner of *active* cases, meaning almost all cases are active.
There is a little moving around but over the course it moves to the left.
At the end when there are no more active cases it will settle at the axis between *recovered* and *Deaths*.
The trajectory seems to aim for 96% recovered, 4% deceased.

Zooming into the lower left corner to see the initial development.
Finding outstanding dates where the ratio of active was a local maximum:

```r
pander(
d0 %>% 
  select(-Lat, -Long) %>%
  filter(rRem > lag(rRem), rRem > lead(rRem)),
caption = "Dates with local maxima of active ratio.")
```



| Province | Country |    date    | confirmed | recovered | deaths |  rRec   | rDeath  |  rRem  |
|:--------:|:-------:|:----------:|:---------:|:---------:|:------:|:-------:|:-------:|:------:|
|  Hubei   |  China  | 2020-01-28 |   3554    |    80     |  125   | 0.02251 | 0.03517 | 0.9423 |
|  Hubei   |  China  | 2020-01-30 |   4903    |    90     |  162   | 0.01836 | 0.03304 | 0.9486 |
|  Hubei   |  China  | 2020-02-02 |   11177   |    295    |  350   | 0.02639 | 0.03131 | 0.9423 |
|  Hubei   |  China  | 2020-02-13 |   48206   |   3459    |  1310  | 0.07175 | 0.02718 | 0.9011 |

Table: Dates with local maxima of active ratio.
Three dates at end of January and one in mid-February. 
If I recall correctly in mid-February the rules for classification were altered explaining the jump.


```r
borders  <-  list(c(0.2, 0, 0.8), c(0,0.2,0.8), c(0,0,1))
corTernGrid(grid.lines = 5, 
	    grid.minor.lines=0,
	    borders = borders)
ternOneCountry(data = d0, col=rgb(255, 0, 0, 128, NULL, 255)
)
placeSymbols(borders=borders)

curPos  <- d0 %>% filter(rRem > lag(rRem), rRem > lead(rRem)) %>%
  mutate(date = as.factor(date))
markPos(curPos, col="red")
```

{{< bundle-figure name="unnamed-chunk-5-1..svg" class=""  caption="Hubei Province, zoom" >}}

The figure shows a *loop* at the onset of disease.  
Many countries show similar development. At the first few individual cases the curve is all over the place as each individual case has huge effect.
After a sufficient number of cases are present statistics take over.
Then first the number of active cases increases.
There is some movement between deceased and recovered depending on the countries situation.

Hubei provinces development should dominate the development over all of China.


```r
d0 <- ternData %>% filter(Country == "China", Province == "Hubei") %>% 
  select(Province, date, rRec, rDeath, rRem, confirmed)
d1 <- countryData %>% filter(confirmed > 100, Country %in% c("China")) %>%
  mutate(Province = "all China") %>%
  select(Province, date, rRec, rDeath, rRem, confirmed)

borders  <-  list(c(0.2, 0, 0.8), c(0,0.2,0.8), c(0,0,1))
corTernGrid(grid.lines = 5, 
	    grid.minor.lines=0,
	    borders = borders)
datalist <- list(d0,d1)
cols <- brewer.pal(4, "Set1")[1:2]
ternManyCountries(datalist=list(d0,d1),cols )
placeSymbols(borders=borders)
countryLegend(c("Hubei", "China"), cols)
```

{{< bundle-figure name="unnamed-chunk-6-1..svg" class=""  caption="Comparing the development of Hubei and all of China" >}}

### Countries

For clarity I exclude data points below 100 reported cases.

```r
topCountries <- countryData %>% 
  group_by(Country) %>%
  summarize(n_active = sum(confirmed > 0), 
	    infected = confirmed[n()]) %>%
  arrange(-infected) %>%
  top_n(5)
topData <- countryData %>% 
  filter(Country %in% topCountries$Country, confirmed > 100)
```

In the 5 countries with most infections Iran and Italy move quite around. 
Italy's trajectory currently heads to a much higher death ratio and China.
Iran started with high death ratio but now seems to get a trajectory close to the Chinese one.

```r
splits <- topData %>% group_by(Country) %>% group_split()
countryListPlot(splits)
```

{{< bundle-figure name="top5plot-1..svg" class=""  caption="Top 5 infectected Countries" >}}



```r
splits <- prepCountries(countryData,
			c("China", 
			  "Korea, South", 
			  "Japan"
			  ))
countryListPlot(splits,
           borders = list(c(0.3, 0, 0.7), c(0,0.3,0.7), c(0,0,1))
)
```

{{< bundle-figure name="unnamed-chunk-8-1..svg" class=""  caption="South east asian countries. South Korea has outstanding low mortality." >}}


```r
splits <- prepCountries(countryData,
	  c("Italy", 
	    "United Kingdom", 
	    "France",
	    "Spain",
	    "Germany"
	    ))
countryListPlot(splits, borders = makeBorders(0.2))
```

{{< bundle-figure name="unnamed-chunk-9-1..svg" class=""  caption="European Main, Italy seems to have twice lethality of China. Spain and UK on the level of China. Germany almost not visible." >}}


```r
splits <- prepCountries(countryData,
	  c(
	    "Germany",
	    "Austria",
	    "Switzerland"
	    )
)
countryListPlot(splits, borders = makeBorders(0.1))
```

{{< bundle-figure name="unnamed-chunk-10-1..svg" class=""  caption="European Central, all close together at low level. Austria and Germany overlap with Austria being a few days ahead. Switzerland having twice the mortality." >}}

## Summary

### Usefulness
One can question the usefulness of such a visualization.
It is hard to read the total number of cases from ternary plots. 
Situations with only single sick/deceased persons produce messy graphs. 
On the other hand it may help to see a pattern in the large scale.
I also miss information about the relation to the total population.

### Possible Interpretations
Besides the east Asian countries most of the world seems to just get started on infection. 
Their ternary plots are still very noisy.
The currently 2nd and 3rd most infected countries Italy and Iran. 
Italy seems to be on an rightward trajectory.
Iran had similar behavior a few days ago but now seems back to a trajectory as China.
Meanwhile the Chinese trajectory seems to head for its final position.
In the Hubei where only few more infections come in it is possible to estimate the worst and best case from the figure.
At the moment all momenta seem to be upward to the top as active cases decline.
It will be interesting if any country will develop an upward momentum and what could be the reason. 
The current one in Italy might be rooted in some systematic problems.
I'm considering doing another set of ternary plots  comparing the total population, active and deceased ratios.


