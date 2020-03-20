#
# Makefile for data
#

all: data
BASEGH:=https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series
.PHONY: clean all

%.csv %.R %.md:
	curl -L "$(BASEGH)/$@" -o "$@"

%.gz:
	curl -L "$(BASEGH)/$(patsubst %.gz,%,$(@))" | gzip -c > $@

	
clean:
	-rm *.gz

data: time_series_19-covid-Confirmed.csv.gz time_series_19-covid-Deaths.csv.gz time_series_19-covid-Recovered.csv.gz

# vim:ft=make
#
