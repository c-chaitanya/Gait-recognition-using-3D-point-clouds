B <- c(70,82)
barplot(B, main="2.5D GAIT RECOGNITION", xlab="Classifiers", ylab="Recognition Rates",
names.arg=c("Random forest","SVM"), border="red", density=c(90, 90),col=rainbow(3),width=0.1,
ylim=c(0,100))
