setwd("C:/Users/Ayush/Desktop/csv")
set.seed(123)
##############assigning points######################
x = read.csv("result.csv", row.names = NULL, header= FALSE)
options(scipen=3)
pairs(x, main="Point Cloud Pair Plot")
