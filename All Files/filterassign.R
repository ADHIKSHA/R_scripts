

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
