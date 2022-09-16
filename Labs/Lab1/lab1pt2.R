install.packages("tidyverse")
library(tidyverse)
#-------------------------------------------------------
#------------------- LAB 1 - part 2 --------------------
#-------------------------------------------------------
EPI_data <- read.csv(file.choose(), header=TRUE)
#View(EPI_data)
names(EPI_data) <-as.matrix(EPI_data[1,])
EPI_data <- EPI_data[-1,]
EPI_data[] <- lapply(EPI_data, function(x) type.convert(as.character(x)))
EPI_data
View(EPI_data)

summary(EPI_data)
fivenum(EPI_data, na.rm=TRUE)
stem(EPI_data)
hist(EPI_data)

plot(ecdf(EPI_data), do.points=False, verticals=TRUE)
plot(ecdf(EPI_data$EPI),do.points=TRUE,verticals = TRUE) # points are visible on the plot
par(pty="s")
help("qqnorm") # documentation for qqnorm
help("qqplot") # documentation for qqplot
qqnorm(EPI_data$EPI)
qqline(EPI_data$EPI) # adding the line on the Q-Q plot
x <- seq(30,95,1)
x
x2 <-seq(30,95,2)
x2
x2 <-seq(30,96,2)
x2
qqplot(qt(ppoints(250),df=5),x, xlab = "Q-Q plot")
qqline(x)

#-------------------------------------------------------
# Multivariate.csv dataset
#-------------------------------------------------------
multivariate <- read.csv(file.choose(), header=TRUE)
head(multivariate)
View(multivariate)
attach(multivariate)
help(lm)
mm <-lm(Homeowners~Immigrant)
mm
summary(mm)$coef
plot(Homeowners~Immigrant)
help(abline)
abline(mm)
abline(mm,col=2,lwd=3)

newImmigrantdata <- data.frame(Immigrant = c(0, 20))
mm %>% predict(newImmigrantdata)
abline(mm)
abline(mm,col=3,lwd=3) # line color = green, line width = 3
attributes(mm)
mm$coefficients

#-------------------------------------------------------
# ggplot dataset
#-------------------------------------------------------
plot(mtcars$wt,mtcars$mpg)
library(ggplot2)
qplot(mtcars$wt, mtcars$mpg)
qplot(wt, mpg, data = mtcars)
ggplot(mtcars, aes(x=wt, y=mpg)) + geom_point()
plot(pressure$temperature, pressure$pressure, type = "l")
points(pressure$temperature, pressure$pressure)

lines(pressure$temperature, pressure$pressure/2, col="red")
points(pressure$temperature, pressure$pressure/2, col="blue")

library(ggplot2)
qplot(pressure$temperature, pressure$pressure, geom="line")
qplot(temperature, presidents, data = pressure, geom = "line")
ggplot(pressure, aes(x=temperature, y=pressure)) + geom_line() + geom_point()
ggplot(pressure, aes(x=temperature, y=pressure)) + geom_line() + geom_point()

#-------------------------------------------------------
# Creating Bar graphs
#-------------------------------------------------------
barplot(BOD$demand, names.arg = BOD$Time)
table(mtcars$cyl)
barplot(table(mtcars$cyl))
qplot(mtcars$cyl)
qplot(factor(mtcars$cyl))
qplot(factor(cyl), data = mtcars)
ggplot(mtcars, aes(x=factor(cyl))) + geom_bar()

#-------------------------------------------------------
# Creating Histograms using ggplot
#-------------------------------------------------------
hist(mtcars$mpg)
hist(mtcars$pmg, breaks = 10)
hist(mtcars$pmg, breaks = 5)
hist(mtcars$pmg, breaks = 12)
qplot(mpg, data = mtcars, binwidth = 4)
ggplot(mtcars, aes(x=mpg)) + geom_histogram(binwidth = 4)
gglot(mtcars, aes(x=mpg)) + geom_histogram(binwidth = 5)

#-------------------------------------------------------
# Creating Box-plots using ggplot
#-------------------------------------------------------
plot(ToothGrowth$supp, ToothGrowth$len)
boxplot(len ~ supp, data = ToothGrowth)
boxplot(len ~ supp + dose, data = ToothGrowth)
library(ggplot2)
qplot(ToothGrowth, aes(x=supp, y=len)) + geom_boxplot()
qplot(interaction(ToothGrowth$supp, ToothGrowth$dose), ToothGrowth$len, geom = "boxplot")
qplot(interaction(supp, dose), len, data = ToothGrowth, geom = "box")
ggplot(ToothGrowth, aes(x=interaction(supp, dose), y=len)) + geom_boxplot()
