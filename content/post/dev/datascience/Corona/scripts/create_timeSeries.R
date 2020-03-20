devtools::load_all()
library(dplyr)
library(tidyr)

confirmed <- read.csv("data-raw/time_series_19-covid-Confirmed.csv.gz", check.names=F)
deaths <- read.csv("data-raw/time_series_19-covid-Deaths.csv.gz", check.names=F)
recovered <- read.csv("data-raw/time_series_19-covid-Recovered.csv.gz", check.names=F)

longform <- function(x, name=deparse(substitute(x)) )
  pivot_longer(x, matches("^\\d"), names_to="date", values_to=name) %>%
    mutate(date = as.Date(date, format="%m/%d/%y"))

dr <- longform(recovered)
dd <- longform(deaths)
dc <- longform(confirmed)

bigtable <- dc %>% left_join(dr) %>% left_join(dd)

bigtable <- bigtable %>% rename(Country=`Country/Region`, Province=`Province/State`)


#save results ------------------------------------------------------------
args <- commandArgs(trailingOnly = TRUE)
saveRDS(bigtable, file=args[[1]])
