#Loading required packages
#install.packages('tidyverse')
library(tidyverse)
#install.packages('ggplot2')
library(ggplot2)
#install.packages('caret')
library(caret)
#install.packages('caretEnsemble')
library(caretEnsemble)
#install.packages('psych')
library(psych)
#install.packages('Amelia')
library(Amelia)
#install.packages('mice')
library(mice)
#install.packages('GGally')
library(GGally)
#install.packages('rpart')
library(rpart)
#install.packages('randomForest')
library(randomForest)

df <- read.csv("winequality-red.csv", sep=";", header=TRUE)

head(df, n=2)
df_scaled <- scale(df[-1])

head(df_scaled, n=2)
wssplot <- function(data, nc=15, seed=1234){
  wss <- (nrow(data)-1)*sum(apply(data,2,var))
  for (i in 2:nc){
    set.seed(seed)
    wss[i] <- sum(kmeans(data, centers=i)$withinss)}
  plot(1:nc, wss, type="b", xlab="Number of Clusters",
       ylab="Within groups sum of squares")}

wssplot(df_scaled)
library("NbClust")
set.seed(1234)
nc <- NbClust(df_scaled, min.nc=2, max.nc=15, method="kmeans")
barplot(table(nc$Best.n[1,]),
        xlab="Numer of Clusters", ylab="Number of Criteria",
        main="Number of Clusters Chosen by 26 Criteria")
set.seed(1234)
fit.km <- kmeans(df, 2, nstart=25)
fit.km$size
fit.km$centers
aggregate(df[-1], by=list(cluster=fit.km$cluster),mean)


#heirarchial clustering

#iris <- read.csv("iris.csv")

clusters <- hclust(dist(iris[, 3:4]))
plot(clusters)
clusterCut <- cutree(clusters, 3)
table(clusterCut, iris$Species)
clusters <- hclust(dist(iris[, 3:4]), method = 'average')
plot(clusters)
clusterCut <- cutree(clusters, 3)

table(clusterCut, iris$Species)
ggplot(iris, aes(Petal.Length, Petal.Width, color = iris$Species)) + 
  geom_point(alpha = 0.4, size = 3.5) + geom_point(col = clusterCut) + 
  scale_color_manual(values = c('black', 'red', 'green'))



#COBWEB

#install.packages("remotes")
#remotes::install_github("Beirnaert/ggROCcobweb")
library(ggROCcobweb)
#library(Beirnaert/ggROCcobweb)

library(ggplot2)
n_comparison = 3
AUC.df = data.frame(type = c(rep("ROC",6),rep("Random",6)),  
                    AUCs = c(0.34, 1.00, 0.56, 0.40, 0.37, 0.45, rep(1/n_comparison, 6)))
ggplot(AUC.df, aes(AUCs = AUCs,  colour = type)) +
  geom_cobweb() + 
  theme_cobweb() +
  ggtitle("Test plot") +
  coord_equal()
