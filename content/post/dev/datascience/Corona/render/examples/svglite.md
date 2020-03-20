# Example emoji with svg


```r
library(dplyr)
```

```
## 
## Attaching package: 'dplyr'
```

```
## The following objects are masked from 'package:stats':
## 
##     filter, lag
```

```
## The following objects are masked from 'package:base':
## 
##     intersect, setdiff, setequal, union
```

```r
library(tidyr)

library(ggplot2)
library(scales)
library(ggtern)
```

```
## Registered S3 methods overwritten by 'ggtern':
##   method           from   
##   +.gg             ggplot2
##   grid.draw.ggplot ggplot2
##   plot.ggplot      ggplot2
##   print.ggplot     ggplot2
```

```
## --
## Remember to cite, run citation(package = 'ggtern') for further info.
## --
```

```
## 
## Attaching package: 'ggtern'
```

```
## The following objects are masked from 'package:ggplot2':
## 
##     %+%, aes, annotate, calc_element, ggplot, ggplot_build,
##     ggplot_gtable, ggplotGrob, ggsave, layer_data, theme, theme_bw,
##     theme_classic, theme_dark, theme_gray, theme_light, theme_linedraw,
##     theme_minimal, theme_void
```

```r
library(emojifont)
load.emojifont('EmojiOne.ttf')

library(fontquiver)
#fonts <- fontquiver::font_families("Liberation")
#fonts$symbol$symbol <- fontquiver::font_symbol("Symbola")

# fontquiver::font_symbol("EmojiOne")

library(svglite)
knitr::opts_chunk$set(
		      dev = "svglite",
		      dev.args = list(),
		      fig.ext = ".svg"
)
```


```r
# see https://mran.microsoft.com/snapshot/2016-07-03/web/packages/emojifont/vignettes/emojifont.html
list.emojifonts()
```

```
## [1] "EmojiOne.ttf"      "OpenSansEmoji.ttf"
```

```r
load.emojifont('EmojiOne.ttf')

# test
set.seed(123)
x <- rnorm(10)
set.seed(321)
y <- rnorm(10)
plot(x, y, cex=0)
text(x, y, labels=emoji('cow'), cex=1.5, col='steelblue', family='Apple Color Emoji')
```

```
## Warning in text.default(x, y, labels = emoji("cow"), cex = 1.5, col =
## "steelblue", : font family 'Apple Color Emoji' not found, will use 'wqy-
## microhei' instead
```

```
## Warning in text.default(x, y, labels = emoji("cow"), cex = 1.5, col =
## "steelblue", : font family 'Apple Color Emoji' not found, will use 'sans'
## instead
```

```
## Warning in text.default(x, y, labels = emoji("cow"), cex = 1.5, col =
## "steelblue", : font family 'Apple Color Emoji' not found, will use 'wqy-
## microhei' instead

## Warning in text.default(x, y, labels = emoji("cow"), cex = 1.5, col =
## "steelblue", : font family 'Apple Color Emoji' not found, will use 'wqy-
## microhei' instead

## Warning in text.default(x, y, labels = emoji("cow"), cex = 1.5, col =
## "steelblue", : font family 'Apple Color Emoji' not found, will use 'wqy-
## microhei' instead

## Warning in text.default(x, y, labels = emoji("cow"), cex = 1.5, col =
## "steelblue", : font family 'Apple Color Emoji' not found, will use 'wqy-
## microhei' instead

## Warning in text.default(x, y, labels = emoji("cow"), cex = 1.5, col =
## "steelblue", : font family 'Apple Color Emoji' not found, will use 'wqy-
## microhei' instead

## Warning in text.default(x, y, labels = emoji("cow"), cex = 1.5, col =
## "steelblue", : font family 'Apple Color Emoji' not found, will use 'wqy-
## microhei' instead

## Warning in text.default(x, y, labels = emoji("cow"), cex = 1.5, col =
## "steelblue", : font family 'Apple Color Emoji' not found, will use 'wqy-
## microhei' instead

## Warning in text.default(x, y, labels = emoji("cow"), cex = 1.5, col =
## "steelblue", : font family 'Apple Color Emoji' not found, will use 'wqy-
## microhei' instead

## Warning in text.default(x, y, labels = emoji("cow"), cex = 1.5, col =
## "steelblue", : font family 'Apple Color Emoji' not found, will use 'wqy-
## microhei' instead

## Warning in text.default(x, y, labels = emoji("cow"), cex = 1.5, col =
## "steelblue", : font family 'Apple Color Emoji' not found, will use 'wqy-
## microhei' instead

## Warning in text.default(x, y, labels = emoji("cow"), cex = 1.5, col =
## "steelblue", : font family 'Apple Color Emoji' not found, will use 'wqy-
## microhei' instead

## Warning in text.default(x, y, labels = emoji("cow"), cex = 1.5, col =
## "steelblue", : font family 'Apple Color Emoji' not found, will use 'wqy-
## microhei' instead

## Warning in text.default(x, y, labels = emoji("cow"), cex = 1.5, col =
## "steelblue", : font family 'Apple Color Emoji' not found, will use 'wqy-
## microhei' instead

## Warning in text.default(x, y, labels = emoji("cow"), cex = 1.5, col =
## "steelblue", : font family 'Apple Color Emoji' not found, will use 'wqy-
## microhei' instead

## Warning in text.default(x, y, labels = emoji("cow"), cex = 1.5, col =
## "steelblue", : font family 'Apple Color Emoji' not found, will use 'wqy-
## microhei' instead

## Warning in text.default(x, y, labels = emoji("cow"), cex = 1.5, col =
## "steelblue", : font family 'Apple Color Emoji' not found, will use 'wqy-
## microhei' instead

## Warning in text.default(x, y, labels = emoji("cow"), cex = 1.5, col =
## "steelblue", : font family 'Apple Color Emoji' not found, will use 'wqy-
## microhei' instead

## Warning in text.default(x, y, labels = emoji("cow"), cex = 1.5, col =
## "steelblue", : font family 'Apple Color Emoji' not found, will use 'wqy-
## microhei' instead

## Warning in text.default(x, y, labels = emoji("cow"), cex = 1.5, col =
## "steelblue", : font family 'Apple Color Emoji' not found, will use 'wqy-
## microhei' instead

## Warning in text.default(x, y, labels = emoji("cow"), cex = 1.5, col =
## "steelblue", : font family 'Apple Color Emoji' not found, will use 'wqy-
## microhei' instead

## Warning in text.default(x, y, labels = emoji("cow"), cex = 1.5, col =
## "steelblue", : font family 'Apple Color Emoji' not found, will use 'wqy-
## microhei' instead

## Warning in text.default(x, y, labels = emoji("cow"), cex = 1.5, col =
## "steelblue", : font family 'Apple Color Emoji' not found, will use 'wqy-
## microhei' instead

## Warning in text.default(x, y, labels = emoji("cow"), cex = 1.5, col =
## "steelblue", : font family 'Apple Color Emoji' not found, will use 'wqy-
## microhei' instead

## Warning in text.default(x, y, labels = emoji("cow"), cex = 1.5, col =
## "steelblue", : font family 'Apple Color Emoji' not found, will use 'wqy-
## microhei' instead

## Warning in text.default(x, y, labels = emoji("cow"), cex = 1.5, col =
## "steelblue", : font family 'Apple Color Emoji' not found, will use 'wqy-
## microhei' instead

## Warning in text.default(x, y, labels = emoji("cow"), cex = 1.5, col =
## "steelblue", : font family 'Apple Color Emoji' not found, will use 'wqy-
## microhei' instead

## Warning in text.default(x, y, labels = emoji("cow"), cex = 1.5, col =
## "steelblue", : font family 'Apple Color Emoji' not found, will use 'wqy-
## microhei' instead

## Warning in text.default(x, y, labels = emoji("cow"), cex = 1.5, col =
## "steelblue", : font family 'Apple Color Emoji' not found, will use 'wqy-
## microhei' instead

## Warning in text.default(x, y, labels = emoji("cow"), cex = 1.5, col =
## "steelblue", : font family 'Apple Color Emoji' not found, will use 'wqy-
## microhei' instead

## Warning in text.default(x, y, labels = emoji("cow"), cex = 1.5, col =
## "steelblue", : font family 'Apple Color Emoji' not found, will use 'wqy-
## microhei' instead

## Warning in text.default(x, y, labels = emoji("cow"), cex = 1.5, col =
## "steelblue", : font family 'Apple Color Emoji' not found, will use 'wqy-
## microhei' instead

## Warning in text.default(x, y, labels = emoji("cow"), cex = 1.5, col =
## "steelblue", : font family 'Apple Color Emoji' not found, will use 'wqy-
## microhei' instead

## Warning in text.default(x, y, labels = emoji("cow"), cex = 1.5, col =
## "steelblue", : font family 'Apple Color Emoji' not found, will use 'wqy-
## microhei' instead

## Warning in text.default(x, y, labels = emoji("cow"), cex = 1.5, col =
## "steelblue", : font family 'Apple Color Emoji' not found, will use 'wqy-
## microhei' instead

## Warning in text.default(x, y, labels = emoji("cow"), cex = 1.5, col =
## "steelblue", : font family 'Apple Color Emoji' not found, will use 'wqy-
## microhei' instead

## Warning in text.default(x, y, labels = emoji("cow"), cex = 1.5, col =
## "steelblue", : font family 'Apple Color Emoji' not found, will use 'wqy-
## microhei' instead

## Warning in text.default(x, y, labels = emoji("cow"), cex = 1.5, col =
## "steelblue", : font family 'Apple Color Emoji' not found, will use 'wqy-
## microhei' instead

## Warning in text.default(x, y, labels = emoji("cow"), cex = 1.5, col =
## "steelblue", : font family 'Apple Color Emoji' not found, will use 'wqy-
## microhei' instead

## Warning in text.default(x, y, labels = emoji("cow"), cex = 1.5, col =
## "steelblue", : font family 'Apple Color Emoji' not found, will use 'wqy-
## microhei' instead
```

{{< bundle-figure name="configEmojiFont-1..svg" class=""  caption="plot of chunk configEmojiFont" >}}

```r
#
d <- data.frame(x=x, y=y,
     label = sample(c(emoji('cow'), emoji('camel')), 10, replace=TRUE),
     type = sample(LETTERS[1:3], 10, replace=TRUE))

ggplot(d, aes(x, y, color=type, label=label)) + 
    geom_text(family="Apple Color Emoji", size=6)
```

```
## Warning in grid.Call.graphics(C_text, as.graphicsAnnot(x$label), x$x, x$y, :
## font family 'Apple Color Emoji' not found, will use 'wqy-microhei' instead
```

```
## Warning in grid.Call.graphics(C_text, as.graphicsAnnot(x$label), x$x, x$y, :
## font family 'Apple Color Emoji' not found, will use 'sans' instead
```

```
## Warning in grid.Call.graphics(C_text, as.graphicsAnnot(x$label), x$x, x$y, :
## font family 'Apple Color Emoji' not found, will use 'wqy-microhei' instead

## Warning in grid.Call.graphics(C_text, as.graphicsAnnot(x$label), x$x, x$y, :
## font family 'Apple Color Emoji' not found, will use 'wqy-microhei' instead

## Warning in grid.Call.graphics(C_text, as.graphicsAnnot(x$label), x$x, x$y, :
## font family 'Apple Color Emoji' not found, will use 'wqy-microhei' instead

## Warning in grid.Call.graphics(C_text, as.graphicsAnnot(x$label), x$x, x$y, :
## font family 'Apple Color Emoji' not found, will use 'wqy-microhei' instead

## Warning in grid.Call.graphics(C_text, as.graphicsAnnot(x$label), x$x, x$y, :
## font family 'Apple Color Emoji' not found, will use 'wqy-microhei' instead

## Warning in grid.Call.graphics(C_text, as.graphicsAnnot(x$label), x$x, x$y, :
## font family 'Apple Color Emoji' not found, will use 'wqy-microhei' instead

## Warning in grid.Call.graphics(C_text, as.graphicsAnnot(x$label), x$x, x$y, :
## font family 'Apple Color Emoji' not found, will use 'wqy-microhei' instead

## Warning in grid.Call.graphics(C_text, as.graphicsAnnot(x$label), x$x, x$y, :
## font family 'Apple Color Emoji' not found, will use 'wqy-microhei' instead

## Warning in grid.Call.graphics(C_text, as.graphicsAnnot(x$label), x$x, x$y, :
## font family 'Apple Color Emoji' not found, will use 'wqy-microhei' instead

## Warning in grid.Call.graphics(C_text, as.graphicsAnnot(x$label), x$x, x$y, :
## font family 'Apple Color Emoji' not found, will use 'wqy-microhei' instead

## Warning in grid.Call.graphics(C_text, as.graphicsAnnot(x$label), x$x, x$y, :
## font family 'Apple Color Emoji' not found, will use 'wqy-microhei' instead

## Warning in grid.Call.graphics(C_text, as.graphicsAnnot(x$label), x$x, x$y, :
## font family 'Apple Color Emoji' not found, will use 'wqy-microhei' instead

## Warning in grid.Call.graphics(C_text, as.graphicsAnnot(x$label), x$x, x$y, :
## font family 'Apple Color Emoji' not found, will use 'wqy-microhei' instead

## Warning in grid.Call.graphics(C_text, as.graphicsAnnot(x$label), x$x, x$y, :
## font family 'Apple Color Emoji' not found, will use 'wqy-microhei' instead

## Warning in grid.Call.graphics(C_text, as.graphicsAnnot(x$label), x$x, x$y, :
## font family 'Apple Color Emoji' not found, will use 'wqy-microhei' instead

## Warning in grid.Call.graphics(C_text, as.graphicsAnnot(x$label), x$x, x$y, :
## font family 'Apple Color Emoji' not found, will use 'wqy-microhei' instead

## Warning in grid.Call.graphics(C_text, as.graphicsAnnot(x$label), x$x, x$y, :
## font family 'Apple Color Emoji' not found, will use 'wqy-microhei' instead

## Warning in grid.Call.graphics(C_text, as.graphicsAnnot(x$label), x$x, x$y, :
## font family 'Apple Color Emoji' not found, will use 'wqy-microhei' instead

## Warning in grid.Call.graphics(C_text, as.graphicsAnnot(x$label), x$x, x$y, :
## font family 'Apple Color Emoji' not found, will use 'wqy-microhei' instead

## Warning in grid.Call.graphics(C_text, as.graphicsAnnot(x$label), x$x, x$y, :
## font family 'Apple Color Emoji' not found, will use 'wqy-microhei' instead

## Warning in grid.Call.graphics(C_text, as.graphicsAnnot(x$label), x$x, x$y, :
## font family 'Apple Color Emoji' not found, will use 'wqy-microhei' instead

## Warning in grid.Call.graphics(C_text, as.graphicsAnnot(x$label), x$x, x$y, :
## font family 'Apple Color Emoji' not found, will use 'wqy-microhei' instead

## Warning in grid.Call.graphics(C_text, as.graphicsAnnot(x$label), x$x, x$y, :
## font family 'Apple Color Emoji' not found, will use 'wqy-microhei' instead

## Warning in grid.Call.graphics(C_text, as.graphicsAnnot(x$label), x$x, x$y, :
## font family 'Apple Color Emoji' not found, will use 'wqy-microhei' instead

## Warning in grid.Call.graphics(C_text, as.graphicsAnnot(x$label), x$x, x$y, :
## font family 'Apple Color Emoji' not found, will use 'wqy-microhei' instead

## Warning in grid.Call.graphics(C_text, as.graphicsAnnot(x$label), x$x, x$y, :
## font family 'Apple Color Emoji' not found, will use 'wqy-microhei' instead

## Warning in grid.Call.graphics(C_text, as.graphicsAnnot(x$label), x$x, x$y, :
## font family 'Apple Color Emoji' not found, will use 'wqy-microhei' instead

## Warning in grid.Call.graphics(C_text, as.graphicsAnnot(x$label), x$x, x$y, :
## font family 'Apple Color Emoji' not found, will use 'wqy-microhei' instead

## Warning in grid.Call.graphics(C_text, as.graphicsAnnot(x$label), x$x, x$y, :
## font family 'Apple Color Emoji' not found, will use 'wqy-microhei' instead
```

```
## Warning in grid.Call.graphics(C_text, as.graphicsAnnot(x$label), x$x, x$y, :
## font family 'Apple Color Emoji' not found, will use 'sans' instead

## Warning in grid.Call.graphics(C_text, as.graphicsAnnot(x$label), x$x, x$y, :
## font family 'Apple Color Emoji' not found, will use 'sans' instead

## Warning in grid.Call.graphics(C_text, as.graphicsAnnot(x$label), x$x, x$y, :
## font family 'Apple Color Emoji' not found, will use 'sans' instead

## Warning in grid.Call.graphics(C_text, as.graphicsAnnot(x$label), x$x, x$y, :
## font family 'Apple Color Emoji' not found, will use 'sans' instead

## Warning in grid.Call.graphics(C_text, as.graphicsAnnot(x$label), x$x, x$y, :
## font family 'Apple Color Emoji' not found, will use 'sans' instead

## Warning in grid.Call.graphics(C_text, as.graphicsAnnot(x$label), x$x, x$y, :
## font family 'Apple Color Emoji' not found, will use 'sans' instead

## Warning in grid.Call.graphics(C_text, as.graphicsAnnot(x$label), x$x, x$y, :
## font family 'Apple Color Emoji' not found, will use 'sans' instead

## Warning in grid.Call.graphics(C_text, as.graphicsAnnot(x$label), x$x, x$y, :
## font family 'Apple Color Emoji' not found, will use 'sans' instead

## Warning in grid.Call.graphics(C_text, as.graphicsAnnot(x$label), x$x, x$y, :
## font family 'Apple Color Emoji' not found, will use 'sans' instead

## Warning in grid.Call.graphics(C_text, as.graphicsAnnot(x$label), x$x, x$y, :
## font family 'Apple Color Emoji' not found, will use 'sans' instead
```

{{< bundle-figure name="configEmojiFont-2..svg" class=""  caption="plot of chunk configEmojiFont" >}}

