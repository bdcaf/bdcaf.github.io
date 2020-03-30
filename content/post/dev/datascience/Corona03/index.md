---
title: "Identifying change-points in the COVID19 infection growth"
author: "Clemens Ager"
date: "2020-03-30"
link-citations: yes
---

An update to the [previous post]({{< ref "../Corona" >}}). 
The data from [CSSEGISandData/COVID-19](https://github.com/CSSEGISandData/COVID-19) has changed so much that the method from the previous post didn't make sense. 
I am interested to visualize the effect of government interventions on the growth curve.
Unfortunately there is no dataset documenting the interventions, but I am able to detect some changes in the logarithmic growth curve.
Also a new post [Tidying the new Johns Hopkins datasets](https://joachim-gassen.github.io/2020/03/tidying-the-new-johns-hopkins-covid-19-datasests/) showed some nice ideas pulling in world bank data.
I created a Github repo [Corona03](https://github.com/bdcaf/Corona03).

{{< bundle-figure name="chinaplot-1..svg" class=""  caption="Changepoints for China" >}}

<!--more-->



```r
library(tidyverse)
library(segmented)

# svg for high quality plots
library(svglite)
knitr::opts_chunk$set(
		      dev = "svglite",
		      dev.args = list(),
		      fig.ext = ".svg"
)

devtools::load_all()
```


```r
timeSeries <- readRDS("data/timeSeries.RDS")
t_incub <- 5.2
```

{{% alert note %}}
The data was imported from [CSSEGISandData/COVID-19](https://github.com/CSSEGISandData/COVID-19) which aggregates data from several sources.
Data seems to be added daily, but not sure how reliable new sources are integrated.
The displayed data was retrieved on 2020-03-30, the last recorded data point is from 2020-03-29.
{{% /alert %}}

Set start date at when first 100 infections were reached.

```r
edates_confirmed <- timeSeries %>% 
  group_by(country) %>%
  dplyr::filter(confirmed >= 100) %>%
  summarise(edate_confirmed = min(date)) 
```


```r
countryData <- timeSeries %>% 
  left_join(edates_confirmed, by = "country") %>%
  mutate(
    edate_confirmed = as.numeric(date - edate_confirmed)
  ) %>%
  dplyr::filter(edate_confirmed >= 0) %>%
  group_by(country) %>%
  dplyr::filter (n() >= 7) %>% 
  ungroup() 
```

# use piecewise linear curve to approximate growth

Exponential growth is visualized as a straight line in plots with an exponential axis.
The idea is to identify a piecewise linear function that will approximate the growth curve. 
I found the [segmented](https://cran.r-project.org/web/packages/segmented/index.html) package a good fit.
It can also estimate the number of change points.

There were a few annoyances as the *bootstrap restart* that recently was added is not compatible with having a variable number of change points. 
The function then gives a cryptic error message. 

When looking at a graph the change point is supposed to happen about one incubation period after the intervention.  
Currently the incubation period is assumed to be around 5.2 days.


```r
changepoints <- function(isocode="CHN", 
			 cdata=countryData){
  wip <-  dplyr::filter(cdata, iso3c == isocode) 
  ymin  <- first(wip$confirmed)

  conf.lm <- lm(log10(confirmed) ~ edate_confirmed,
		data = wip)
  # erange  <- seq(from=7, to=last(wip$edate_confirmed), by = 14)
  segm.lm <- segmented(conf.lm, 
		 psi = NA,
		 control = seg.control(n.boot = 0,
				       quant = T,
				       K = 3,
				       fix.npsi = F,
				       display = F)
  )
  startDate <- filter(wip, edate_confirmed == 0) $ date

  dayFormat <- function(d) format(d, "%B %d")

  segm.conf <- as.data.frame(confint(segm.lm, level=0.9)) %>%
    mutate(day_change = `Est.`,
	   date = day_change + startDate,
	   day_interv = day_change - t_incub,
	   dayFst = startDate + `CI(90%).low`,
	   dayLast = startDate + `CI(90%).up`,
	   label = paste(dayFormat(dayFst), " - ", dayFormat(dayLast))
    )

    #geom_vline(data=psis, 
    #           mapping = aes(xintercept = day_interv), linetype=3, color="red") + 
    #geom_segment(data = psis,
    #           mapping = aes(x = day_interv, xend = day_change), 
    #           y = 1200, yend = 1200,
    #           linetype=1, color="red",
  #arrow = arrow(length = unit(0.03, "npc"), ends = "last")
    #) +

  ggplot(wip ) +
    geom_point(mapping = aes(x=edate_confirmed, y=confirmed), alpha = 0.5) +
    geom_line(mapping = aes(x=edate_confirmed, y = 10^(segm.lm$fitted.values))) + 
    geom_vline(data=segm.conf, mapping = aes(xintercept = day_change), linetype=3) + 
    geom_rect(data = segm.conf, 
	      aes(xmin = `CI(90%).low`, 
		  xmax = `CI(90%).up`,
		  ymin = ymin, 
		  ymax = Inf,
		  alpha = 1/(`CI(90%).up`- `CI(90%).low`)),
	      fill="red"
    ) + 
		      lims(alpha = c(0,1)) +
		      guides(alpha = F) +
    geom_text(data = segm.conf,
	      mapping = aes(x = day_change,
			    label = label),
	      y = 1.1 * ymin,
	      nudge_x= 0.2,
	      angle = 90,
	      hjust = 'left',
	      vjust = 'top'
	      ) +
		      xlab("days since pat. 100") + 
		      ylab("confirmed cases") + 
		      coord_trans(y = "log10") +
		      theme_light()

}
```


## China
First consider China as it has the longest time series. 


```r
changepoints("CHN")
```

{{< bundle-figure name="chinaplot-1..svg" class=""  caption="China" >}}
The plot shows the growth of number of infected people. This number is cumulative so it can only increase.  
I chose a logarithmic scale as in this scale the growth is linear - at least until a majority of population is infected, which luckily is not the case in any country yet - or as seen in Asian countries when the virus starts dieing out. 
The gray points are the actual reported numbers and a piecewise linear black line approximates the growth. 
A dashed black line marks the approximate change point and a shaded red rectangle behind the 90% confidence interval of this change point. As small changes can be hardly detected I lighten the shade the wider the range of this change point. Also there is a text giving the date range of the change point.
The intervention leading to the change likely happened one incubation time (currently estimated 5.2 days) ahead, although changes may be implemented gradually so the change could be stretched out. 
Personally I would look at the lower confidence minus incubation time for the start of the intervention.

Looking that the current figure for China.
The one at 2020-02-15 seems suspiciously close to the policy change a few days earlier when the definition was altered. 
The change at end of February is not very pronounced - maybe it's just an artifact of the growth no longer being exponential.

## Other Asian 

```r
changepoints("KOR")
```

{{< bundle-figure name="unnamed-chunk-5-1..svg" class=""  caption="Korea" >}}
Also here the last "Change" in South Korea. It may be an artifact of the disease dieing.


```r
changepoints("JPN")
```

{{< bundle-figure name="unnamed-chunk-6-1..svg" class=""  caption="Japan" >}}
Most curious about Japan is there seems to be an intervention that increased the rate of infection at end of March.

## European countries


```r
changepoints("ITA")
```

{{< bundle-figure name="unnamed-chunk-7-1..svg" class=""  caption="Italy" >}}
Italy shows three interventions gradually decreasing the ratio of infections.


```r
changepoints("ESP")
```

{{< bundle-figure name="unnamed-chunk-8-1..svg" class=""  caption="Spain" >}}


```r
changepoints("FRA")
```

{{< bundle-figure name="unnamed-chunk-9-1..svg" class=""  caption="France" >}}


```r
changepoints("DEU")
```

{{< bundle-figure name="unnamed-chunk-10-1..svg" class=""  caption="Germany" >}}


```r
changepoints("GBR")
```

{{< bundle-figure name="unnamed-chunk-11-1..svg" class=""  caption="Great Britain" >}}
For GB interventions are rather small and can barely be discerned.



```r
changepoints("CHE")
```

{{< bundle-figure name="unnamed-chunk-12-1..svg" class=""  caption="Switzerland" >}}

```r
changepoints("AUT")
```

{{< bundle-figure name="unnamed-chunk-13-1..svg" class=""  caption="Austria shows two mild interventions and one very vague one." >}}


```r
changepoints("USA")
```

{{< bundle-figure name="unnamed-chunk-14-1..svg" class=""  caption="USA" >}}


