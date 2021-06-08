library(onenin)
library(ggplot2)
#aes stands for aesthetics. There are diff paramters like:-
# col/color -- color of the dots
#size -- size of the dots
#shape -- shape of the dots
#fill -- fill colid color
#alpha -- transparency
# linetype -- line dash pattern


#bivariant scatter plot has 2 axis and 2 variables to be plotted.

ggplot(hsb2, aes(x = science , y =  math) ) + geom_point()

ggplot(hsb2, aes(x = science , y =  math , col = prog) ) + geom_point()

data(mtcars)
?mtcars

data(email50)

#multivariate graph
ggplot(email50, aes(x = num_char , y = exclaim_mess , col= factor(spam) )) + geom_point()

table(email50$spam)



ggplot(mtcars, aes(x = cyl , y = mpg )) + geom_point()


str(mtcars$disp)
unique(mtcars$disp)


ggplot(mtcars, aes(x = wt , y = mpg , fill= factor(cyl) ,col=cyl)) + geom_point()


ggplot(mtcars, aes(x = wt , y = mpg )) + geom_point(shape=1,size=4) 


ggplot(mtcars, aes(x = wt , y = mpg ,col=cyl)) + geom_point(shape=2,size=4,alpha=0.5) 

my_color="#4ABEFF"

#geo_point will overwrite the ggplot aesthetics

ggplot(mtcars, aes(x = wt , y = mpg ,col=cyl)) + geom_point(col=my_color) 

ggplot(mtcars, aes(x = wt , y = mpg ,col=my_color)) + geom_point(col=mtcars$cyl) 

ggplot(mtcars, aes(x = wt , y = mpg , fill=cyl )) + geom_point(shape=24,col='yellow') 

ggplot(mtcars, aes(x = wt , y = mpg , fill=cyl ,col='red', label=rownames(mtcars))) + geom_text() 


ggplot(mtcars, aes(x = mpg , y = qsec ,col=factor(cyl))) + geom_point(shape=factor(mtcars$am) , size=mtcars$hp/mtcars$wt)

table(mtcars$am)
str(mtcars$am)


ggplot(mtcars, aes(x = mpg , y = qsec ,col=factor(cyl),shape=factor(am) , size=hp/wt)) + geom_point()

#this is univariant graph

ggplot(mtcars, aes(x = factor(am),fill=factor(cyl))) + geom_bar()

ggplot(mtcars, aes(x = factor(cyl),fill=factor(am))) + geom_bar(pos="fill")

ggplot(mtcars, aes(x = factor(cyl),fill=factor(am))) + geom_bar(pos="dodge")

ggplot(mtcars,aes(x=mpg,y=0))+ geom_jitter()+ scale_y_continuous(limits=c(-2,2))



ggplot(mtcars,aes(mpg)) +geom_histogram(binwidth = 1)
ggplot(mtcars,aes(mpg,fill=factor(am))) +geom_histogram(binwidth = 1)

ggplot(mtcars,aes(mpg,fill=factor(am))) +geom_histogram(binwidth = 1,position = "dodge")

#binwidh is the width of th histogram
#position arrangez the pos of the fill variable
#histogram is continuous
