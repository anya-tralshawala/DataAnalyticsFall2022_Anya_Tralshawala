#Getting started: Rstudio - MASS library
install.packages("MASS")
library(MASS)
attach(Boston)
?Boston
head(Boston) #shows first 6 rows of the data frame
dim(Boston) #dimensions of the data frame
names(Boston) #returns column names
str(Boston) #structure of the data frame
nrow(Boston) #number of rows
ncol(Boston) #number of cols
summary(Boston) #min max 1st, 2nd, 3rd quartile ranges
summary(Boston$crim) #all stats above but for one col
detach(Boston)

#Getting started: Rstudio - ISLR library
#install.packages("ISLR")
library(ISLR)
data(Auto)
head(Auto)
names(Auto)
summary(Auto)
summary(Auto$mpg)
fivenum(Auto$mpg)
median(Auto$horsepower)
hist(Auto$mpg)
boxplot(Auto$mpg)

hist(Auto$mpg)
summary(Auto$horsepower)
summary(Auto$weight)
fivenum(Auto$weight)
boxplot(Auto$weight)
mean(Auto$weight)
median((Auto$weight))

#EPI Data
#Read a csv file
help(read.csv)
data1 <-read.csv(file.choose(), header=TRUE)
data1
head(data1)
dim(data1)
names(data1)
nrow(data1)
ncol(data1)
View(data1)
fivenum(data1$GDPCAP07)
fivenum(data1$Country)
fivenum(data1$code)
fivenum(data1$PopulationDensity)
# EDA - Exploritory Data Analysis => identify trends to pick models appropiately