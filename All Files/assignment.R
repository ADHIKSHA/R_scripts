aa=c(13, 15, 16, 16, 19, 20, 20, 21, 22, 22, 25, 25, 25, 25, 30, 33,33, 35, 35, 35, 35, 36, 40, 45, 46, 52, 70)
dataset=data.frame(aa)
set=data(aa)
library(ggplot2)
library(dplyr)
mean(aa)
median(aa)

getmode <- function(aa) {
  uniqv <- unique(aa)
  uniqv[which.max(tabulate(match(aa, uniqv)))]
}
result <- getmode(aa)

which(table(aa)==max(table(aa)))

dat

modez=max(table(aa))
mode = dat %>%
  filter(Freq=modez)
minimum=min(aa)
maximum=max(aa)
dat=data.frame(table(aa),)
summary=c(minimum,first_quantile,mean,second_quantile,maximum)
summary(aa)
boxplot(aa)
y=c()
for (i in range(1:length(aa))) {
  append(y,i)
  i
}

ggplot(dat,aes(x=Freq,y=aa))+geom_point()