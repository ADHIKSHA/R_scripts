library(dplyr)
library(openintro)
#install.packages('openintro')
data(hsb2) #inbuilt datasets in openintro
?hsb2

str(hsb2)
glimpse(hsb2) # gives us a look at the data
names(hsb2) #gives names of colomns
head(hsb2,10) #gives first 10 rows
tail(hsb2) #gives last 6 rows
str(hsb2$gender)
unique(hsb2$gender)
unique(hsb2$race)
table(hsb2$gender) # gives the frequency
table(hsb2$race) # gives the frequency
str(hsb2$ses)
typeof(hsb2$ses)
str(hsb2$schtyp)
table(hsb2$schtyp)
str(hsb2$prog)
table(hsb2$prog)


#select == filter in R leads to a subset
hsb2_public = hsb2 %>% 
  filter(schtyp == "public")
str(hsb2_public)  #here hsb2_public is a subset of hsb2
head(hsb2_public)
table(hsb2_public$schtyp) 
hsb2_public$schtyp = droplevels(hsb2_public$schtyp)
table(hsb2_public$schtyp)
str(hsb2$read)
summary(hsb2$read)
mean(hsb2$read)
avg_read=mean(hsb2$read)


#ifelse(,T,F)  #first if ttrue and second if false
hsb2 = hsb2 %>%
  mutate(read_cat = (ifelse( read < avg_read,"below average" ,  "at or above")))
table(hsb2$read_cat)
data(mtcars)
data (email50)

?email50
names(email50)
head(email50)
str(email50)
table(email50$number)
email5=email50 %>%
  filter(number =="big")
table(email5$number)
email5$number = droplevels(email5$number)
table(email5$number)
email50_fortified = email50 %>%
  mutate(number_ny = ifelse( number == "none" , "no" , "yes" ) )

table(email50_fortified$number_ny)
email50 = email50 %>%
  mutate(num_char_cat = ifelse( num_char > median(num_char) , "above median" , "at or below median" ) )


email50=email50 %>%
  count(num_char_cat)
table(email50$num_char_cat)

unique(email50$num_char_cat)
