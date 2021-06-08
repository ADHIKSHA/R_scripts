#install.packages("dplyr")
#install.packages("ggplot2")
library(dplyr)
glimpse(mtcars)
?mtcars
names((mtcars))
?mtcars
unique(mtcars$cyl)
mtcars_6= mtcars %>%
  filter(cyl == 6)
