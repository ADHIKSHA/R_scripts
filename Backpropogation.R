library("e1071")
library(tidyverse)    # data manipulation and visualization
library(kernlab)      # SVM methodology
library(e1071)        # SVM methodology
library(ISLR)         # contains example data set "Khan"
library(RColorBrewer) # customized coloring of plots
head(iris,5)
attach(iris)
x <- subset(iris, select=-Species)
y <- Species
svm_model <- svm(Species ~ ., data=iris)



summary(svm_model)

svm_model1 <- svm(x,y)

summary(svm_model1)

pred <- predict(svm_model1,x)


plot(svm_model, iris, Petal.Width ~ Petal.Length,
     slice = list(Sepal.Width = 3, Sepal.Length = 4))


system.time(pred <- predict(svm_model1,x))


table(pred,y)

svm_tune <- tune(svm, train.x=x, train.y=y, 
                 kernel="radial", ranges=list(cost=10^(-1:2), gamma=c(.5,1,2)))

print(svm_tune)
svm_model_after_tune <- svm(Species ~ ., data=iris, kernel="radial", cost=1, gamma=0.5)



plot(svm_model_after_tune, iris, Petal.Width ~ Petal.Length,
     slice = list(Sepal.Width = 3, Sepal.Length = 4))

summary(svm_model_after_tune)
pred <- predict(svm_model_after_tune,x)
plot(pred)
system.time(predict(svm_model_after_tune,x))

table(pred,y)
