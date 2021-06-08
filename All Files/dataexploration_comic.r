install.packages('readr')
#dplyr for data manipulation
#readr for data reading
#ggplot for data visualization
library(readr)
library(dplyr)
library(ggplot2)
options(scipen=999,digits = 3) #restricting the output
comics_org=read.csv('C:/Users/Adhiksha/Downloads/comics.csv')
comics=comics_org
str(comics)
head(comics)


names(comics)
glimpse(comics)
str(comics$align)
unique(comics$align)
#NA is not considered in making factors
summary(comics$align)
table(comics$align)
unique(comics$id)
table(comics$id)
table(comics$id,comics$align) #gives us a table having the two prameters.
ggplot(comics,aes( x = factor(id),fill= align)) + geom_bar()
table(comics$align,comics$gender) #contingency table
str(comics$gender)
unique(comics$gender)
table(comics$gender)
comics = comics %>%
  filter(comics$align != "Reformed Criminals")
comics$align=droplevels(comics$align)
table(comics$align)
ggplot(comics,aes(x=factor(align),fill=gender))+geom_bar(pos="dodge")
ggplot(comics,aes(x=factor(align),fill=gender))+geom_bar(pos="dodge")+theme(axis.text.x=element_text(angle=70))

prop.table(table(comics$id,comics$align))

sum(prop.table(table(comics$id,comics$align)))

prop.table(table(comics$id,comics$align),1)

ggplot(comics,aes(x=factor(align),fill=id))+geom_bar(pos="fill") +
  ylab("proportion")

ggplot(comics,aes(x=factor(id),fill=align))+geom_bar(pos="fill") +
  ylab("proportion")

ggplot(comics,aes(x=factor(id))) +geom_bar()+facet_wrap(~align)


