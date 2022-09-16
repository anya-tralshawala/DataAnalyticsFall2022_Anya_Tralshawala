#-------------------------------------------------------
#----------------- LAB 1 - 9/9/2022 --------------------
#-------------------------------------------------------

# R Basics with Examples.
## Data Types
# numerics,character and logical
temperature <- 84.5 # degrees in Fahrenheit 
class(temperature)
RPI <- "Rensselaer Polytechnic Institue"
class(RPI)
Rpi <- 3.14159265359
class(Rpi)
isSnowing <- FALSE
class(isSnowing)
R <- FALSE
class(R)


## Vectors 
num_vec <- c(1,3,5,99) 
class(num_vec)

cha_vec <- c("R","P","I")
class(cha_vec)
boolean_vec <- c(T,FALSE,F) # T = TRUE, you can simply use T for TURE
class(boolean_vec)

vec_mixed <- c("RPI", 1824, 3.14)
vec_mixed
class(vec_mixed) # Note: the 1824 and 3.14 are converted to characters
vec_mixed_boolean <- c(TRUE,"RPI", 1824, 3.14)
vec_mixed_boolean
class(vec_mixed_boolean)
vec_numeric_boolean <- c(TRUE,1824,3.14)
vec_numeric_boolean
class(vec_numeric_boolean)

temperature <- c(80,81.3,83,84.2,82.5)
names(temperature) <- c("Mon","Tue","Web","Thur","Fri")
temperature
# You can do the same thing by: 
Week_Days <-c("Mon","Tue","Web","Thur","Fri")
names(temperature) <- Week_Days
temperature

# Indexing Vectors - Begins with 1 not 0 ( arrays are 1 based :))
vec1 <- c('R','P','I')
vec2 <- c(1,8,2,4)
vec1[1]
vec2[2]

# Matrix 
m <- c(1:10)
m
matrix(m,nrow = 2)
matrix(1:12,byrow = FALSE,nrow = 4)
matrix(1:12,byrow = TRUE,nrow = 4)

# stock prices
goog <- c(560,564,563,562,561)
msft <- c(480,482,484,483,482)
stocks <- c(goog,msft)
stocks
print(stocks)
stock.matrix <- matrix(stocks,byrow = T,nrow = 2)
stock.matrix
days <- c("Mon","Tue","Wed","Thur","Fri")
st.names <- c("goog","msft")
colnames(stock.matrix) <- days
rownames(stock.matrix) <- st.names
print(stock.matrix)
mat <- matrix(1:25,byrow = T, nrow = 5)
mat
mat*2
mat/2
mat^2
1/mat
mat > 15 
mat[mat > 15]
mat + mat 
mat / mat 
colSums(stock.matrix)
rowSums(stock.matrix)
rowMeans(stock.matrix)
# Bind the Columns
FB <- c(223,224,225,223.5,222)
tech.stocks <- rbind(stock.matrix,FB) # Row bind
tech.stocks
avg <- rowMeans(tech.stocks)
avg
tech.stocks <- cbind(tech.stocks,avg) # Column bind
tech.stocks
mat <- matrix(1:50,byrow = T, nrow = 5)
mat
mat[1,] # first row with all the columns
mat[,1] # first column and all the rows
mat[1:3,]
mat[1:2,1:3]
mat[,9:10]
mat[2:3,5:6]
# Factor and Catergorical variables
animals <- c('dog','cat','dog','cat','cat')
id <- c(1,2,3,4,5)
temps <- c('cold','med','hot','hot','hot','cold','med')
temps
fact.temps <- factor(temps, ordered = TRUE, levels = c('cold','med','hot'))
fact.temps
summary(fact.temps)
summary(temps)

undergrads <-c('Freshman','Junior', 'Sophomore','Junior','Senior','Sophomore','Junior','Freshman','Senior','Junior')
undergrads
factor.undergrads <-factor(undergrads,ordered = TRUE,levels = c('Freshman','Sophomore','Junior','Senior'))
factor.undergrads

summary(factor.undergrads)

# Exercise
A <- c(1,2,3)
B <- c(4,5,6)
A <- rbind(A,B)
A
mat <- matrix(1:9, nrow = 3)
mat
is.matrix(mat)
mat2 <- matrix(1:25, byrow = T, nrow = 5)
mat2
mat2[2:3,2:3]
mat2[4:5,4:5]
sum(mat2)
help("runif")
u <- runif(20)
u
runif(matrix(20))
matrix(runif(20),nrow = 4)
#-------------------------------------------------------
#-------------------- LAB 1 Data -----------------------
#-------------------------------------------------------

#EPI_data <- read.csv(”<path>/2010EPI_data.csv")
#or
#EPI_data <- read.xlsx(”<path>/2010EPI_data.xlsx")
EPI_data <- read.csv(file.choose(), header=TRUE)
View(EPI_data)
#
attach(EPI_data) 	# sets the ‘default’ object
fix(EPI_data) 	# launches a simple data editor
EPI 			# prints out values EPI_data$EPI
tf <- is.na(EPI) # records True values if the value is NA
E <- EPI[!tf] # filters out NA values, new array

#other data
# GRUMP_data <- read.csv(”<path>/GPW3_GRUMP_SummaryInformation_2010.csv")
GRUMP_data <- read.csv(file.choose(), header=TRUE)
View(GRUMP_data)

#-------------------------------------------------------
# EPI Exercise 1
#-------------------------------------------------------
names(EPI_data) <-as.matrix(EPI_data[1,])
EPI_data <- EPI_data[-1,]
EPI_data[] <- lapply(EPI_data, function(x) type.convert(as.character(x)))
EPI_data
View(EPI_data)

summary(EPI_data)
fivenum(EPI_data, na.rm=TRUE)
stem(EPI_data)
hist(EPI_data)
hist(EPI_data, seq(30.,95.,1.0), prob = TRUE)
lines(density(EPI_data,na.rm=TRUE,bw=1.))
rug(EPI_data)

plot(ecdf(EPI_data), do.points=FALSE, verticals=TRUE)
par(pty="s") 
qqplot(qt(ppoints(250), df = 5), x, xlab = "Q-Q plot for t dsn")
qqline(x)

summary(EPI_data$DALY)
fivenum(EPI_data$DALY, na.rm=TRUE)
stem(EPI_data$DALY)
plot(ecdf(EPI_data$DALY), do.points=FALSE, verticals=TRUE)

summary(EPI_data$WATER_H)
fivenum(EPI_data$WATER_H, na.rm=TRUE)
stem(EPI_data$WATER_H)
plot(ecdf(EPI_data$WATER_H), do.points=FALSE, verticals=TRUE)

boxplot(EPI_data,DALY) 

#-------------------------------------------------------
# EPI Exercise 2
#-------------------------------------------------------
EPILand<-EPI_data[!EPILand]
ELand <-EPILand[!is.na(EPILand)]
hist(ELand)
hist(ELand, seq(30., 95., 1.0), prob=TRUE)

#-------------------------------------------------------
# GPW3_GRUMP Exercise 1
#-------------------------------------------------------

summary(EPI_data)
fivenum(EPI_data, na.rm=TRUE)
stem(EPI_data)
hist(EPI_data)
hist(EPI_data, seq(30.,95.,1.0), prob = TRUE)
lines(density(EPI_data,na.rm=TRUE,bw=1.))
rug(EPI_data)

plot(ecdf(EPI_data), do.points=FALSE, verticals=TRUE)
par(pty="s") 
qqplot(qt(ppoints(250), df = 5), x, xlab = "Q-Q plot for t dsn")
qqline(x)

summary(EPI_data$x.15)
fivenum(EPI_data$x.15, na.rm=TRUE)
stem(EPI_data$x.15)
plot(ecdf(EPI_data$X.15), do.points=FALSE, verticals=TRUE)

summary(EPI_data$X.17)
fivenum(EPI_data$X.17, na.rm=TRUE)
stem(EPI_data$X.17)
plot(ecdf(EPI_data$X.17), do.points=FALSE, verticals=TRUE)

boxplot(EPI_data,DALY) 

#-------------------------------------------------------
# GPW3_GRUMP Exercise 2
#-------------------------------------------------------
EPILand<-EPI_data[!EPILand]
ELand <-EPILand[!is.na(EPILand)]
hist(ELand)
hist(ELand, seq(30., 95., 1.0), prob=TRUE)

#-------------------------------------------------------
#------------------- LAB 1 - part 2 --------------------
#-------------------------------------------------------
plot(ecdf(EPI_data), do.points=False, verticals=TRUE)

