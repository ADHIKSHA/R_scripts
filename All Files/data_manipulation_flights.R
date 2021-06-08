library(dplyr)
library(ggplot2)
library(hflights)
data(hflights)
hflights=tbl_df(hflights)
str(hflights)
dim(hflights)
glimpse(hflights)
#?hflights
str(hflights$UniqueCarrier)
unique(hflights$UniqueCarrier)
country=c("A"="America","I"="India","J"="Japan","F"="France","R"="Russia")
countrycode=c("A","I","J","F","R")
country[countrycode]
country["A"]
carrierName=c("AA"="American", "AS"="Alaska", "B6"="Jet Blue", "CO"="Continental", "DL"="Delta", "OO"="Sky West", "UA"="United", "US"="US_Airways", "WN"="South West", "EV"="Atlantic_South East", "F9"="Frontier", "FL"="AirTran", "MQ"="American_Eagle", "XE"="Express Jet", "YV"="Mesa")


carrierName[hflights$UniqueCarrier]
