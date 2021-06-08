library(dplyr)
library(ggplot2)
library(readr)
creditcard <- read_csv("creditcard.csv")
#View(creditcard)
library(caTools)
#install.packages('caTools')
set.seed(123)
split=sample.split(creditcard$Class, SplitRatio = 0.8)
training_set=subset(creditcard,split==TRUE)
test_set=subset(creditcard,split==FALSE)
regressor = lm(formula(Time ~ Class),
               data = training_set)

#ggplot(creditcard,aes(x=Class,y=Time))+geom_point()
#ggplot(creditcard,aes(x=Time,y=count(Class)))+geom_bar()
set = creditcard %>%
  filter(Class==1)

summary(set$Time)

getmode <- function(set) {
  uniqv <- unique(set$Time)
  uniqv[which.max(tabulate(match(set$Time, uniqv)))]
}
result <- getmode(set)


#ggplot(set,aes(x=Time,y=0))+ geom_jitter()+ scale_y_continuous(limits=c(-2,2))


#ggplot(creditcard, aes(x = Time,y=0,col=Class)) + geom_jitter()+scale_y_continuous(limits=c(-2,2))

table(creditcard$Class)
regressor = lm(formula(V1 ~ Class),
               data = training_set)


#ggplot(creditcard, aes(x = V2,y=0,col=factor(Class))) + geom_jitter()+scale_y_continuous(limits=c(-2,2))

#ggplot(set, aes(x = V5,y=0,col=Class)) + geom_jitter()+scale_y_continuous(limits=c(-2,2))


regressor = lm(formula(Class ~ V5),
               data = training_set)

summary(set$V5)

getmode <- function(set) {
  uniqv <- unique(set$V5)
  uniqv[which.max(tabulate(match(set$V5, uniqv)))]
}
result <- getmode(set)
a=max(table(set$V5))
#maximum frauds when V5 in range -22.1055 to 11.0951
#maximum happened at -4.8011
#the maximum frequency of the fraud in V5 lies between -5 to 5

# Create the relationship model.
model <- lm(Class~Time+V3+V7+V10+V12+V14+V16+V17, data = training_set)
data_regressor=data.frame(summary(model))
#V1,V2,V3,V4,V5,V6,V7,V8,V9,V10,V11,V12,V14,V16,V17,V18,V19,V20,V21 are all responsible for the fraud 
#V13,V15,V22 and V23 dont really have much of a dependence

layout(matrix(c(1,2,3,4),2,2)) # optional 4 graphs/page
#plot(model)
#plot(regressor)

results_predict<-predict.lm(model,newdata= test_set,interval="prediction")
#plot(results_predict)
data_predict=data.frame(results_predict,test_set)
head(data_predict)
count_preds = data_predict %>%
  filter(lwr>0.5 & upr<=1.0)

featurePlot(x=trainingset,y=creditcard$Class, plot="pairs")


wrong_predict = count_preds %>%
  filter(Class==0)
count_wrong_pred = count(wrong_predict)

right_predict = count_preds %>%
  filter(Class==1)
count_right_pred = count(right_predict)
accuracy = count_right_pred - count_wrong_pred
total_rights = test_set %>%
  filter(Class==1)
count_total_rights=count(total_rights)

accuracy_rate= accuracy/count_total_rights



model2 <- lm(Class~Amount, data = training_set)
#data_regressor2=data.frame(summary(model2))

results_predict2<-predict.lm(model2,newdata= test_set,interval="prediction")
#plot(results_predict)
data_predict2=data.frame(results_predict2,test_set)
head(data_predict2)
count_preds2 = data_predict2 %>%
  filter(lwr>0.5 & upr<=1.0)

wrong_predict2 = count_preds2 %>%
  filter(Class==0)
count_wrong_pred2 = count(wrong_predict2)

right_predict2 = count_preds2 %>%
  filter(Class==1)
count_right_pred2 = count(right_predict2)
accuracy2 = count_right_pred2 - count_wrong_pred2
total_rights2 = test_set %>%
  filter(Class==1)
count_total_rights2=count(total_rights2)

accuracy_rate2= accuracy2/count_total_rights2
#cor(creditcard)
