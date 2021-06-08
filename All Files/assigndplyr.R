#install.packages("dplyr")
library(dplyr)
glimpse(mtcars)
?mtcars
unique(mtcars$cyl)
mtcars_6= mtcars %>%
  filter(cyl == 6)
library(dplyr)
library(openintro)
#install.packages('openintro')
data(hsb2) #inbuilt datasets in openintro
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

#output

> library(openintro)
Please visit openintro.org for free statistics materials

Attaching package: ‘openintro’

The following objects are masked from ‘package:datasets’:
  
  cars, trees

> data(hsb2) #inbuilt datasets in openintro
> str(hsb2)
'data.frame':	200 obs. of  11 variables:
  $ id     : int  70 121 86 141 172 113 50 11 84 48 ...
$ gender : chr  "male" "female" "male" "male" ...
$ race   : chr  "white" "white" "white" "white" ...
$ ses    : Factor w/ 3 levels "low","middle",..: 1 2 3 3 2 2 2 2 2 2 ...
$ schtyp : Factor w/ 2 levels "public","private": 1 1 1 1 1 1 1 1 1 1 ...
$ prog   : Factor w/ 3 levels "general","academic",..: 1 3 1 3 2 2 1 2 1 2 ...
$ read   : int  57 68 44 63 47 44 50 34 63 57 ...
$ write  : int  52 59 33 44 52 52 59 46 57 55 ...
$ math   : int  41 53 54 47 57 51 42 45 54 52 ...
$ science: int  47 63 58 53 53 63 53 39 58 50 ...
$ socst  : int  57 61 31 56 61 61 61 36 51 51 ...
> names(hsb2) #gives names of colomns
[1] "id"      "gender"  "race"    "ses"     "schtyp"  "prog"    "read"    "write"   "math"   
[10] "science" "socst"  
> head(hsb2,10) #gives first 10 rows
id gender             race    ses schtyp       prog read write math science socst
1   70   male            white    low public    general   57    52   41      47    57
2  121 female            white middle public vocational   68    59   53      63    61
3   86   male            white   high public    general   44    33   54      58    31
4  141   male            white   high public vocational   63    44   47      53    56
5  172   male            white middle public   academic   47    52   57      53    61
6  113   male            white middle public   academic   44    52   51      63    61
7   50   male african american middle public    general   50    59   42      53    61
8   11   male         hispanic middle public   academic   34    46   45      39    36
9   84   male            white middle public    general   63    57   54      58    51
10  48   male african american middle public   academic   57    55   52      50    51
> tail(hsb2) #gives last 6 rows
id gender  race    ses  schtyp       prog read write math science socst
195 179 female white middle private   academic   47    65   60      50    56
196  31 female asian middle private    general   55    59   52      42    56
197 145 female white middle  public vocational   42    46   38      36    46
198 187 female white middle private    general   57    41   57      55    52
199 118 female white middle  public    general   55    62   58      58    61
200 137 female white   high  public   academic   63    65   65      53    61
> str(hsb2$gender)
chr [1:200] "male" "female" "male" "male" "male" "male" "male" "male" "male" "male" "male" ...
> unique(hsb2$gender)
[1] "male"   "female"
> unique(hsb2$race)
[1] "white"            "african american" "hispanic"         "asian"           
> table(hsb2$gender) # gives the frequency

female   male 
109     91 
> table(hsb2$race) # gives the frequency

african american            asian         hispanic            white 
20               11               24              145 
> str(hsb2$ses)
Factor w/ 3 levels "low","middle",..: 1 2 3 3 2 2 2 2 2 2 ...
> typeof(hsb2$ses)
[1] "integer"
> str(hsb2$schtyp)
Factor w/ 2 levels "public","private": 1 1 1 1 1 1 1 1 1 1 ...
> str(hsb2$prog)
Factor w/ 3 levels "general","academic",..: 1 3 1 3 2 2 1 2 1 2 ...
> table(hsb2$prog)

general   academic vocational 
##45        105         50 