




#1. Matrix
A = matrix( 
  c(2, 4, 3, 1, 5, 7), # the data elements 
  nrow=2,              # number of rows 
  ncol=3,              # number of columns 
  byrow = TRUE)
A[2,3] # element at row 2 and column 3
A[2,] # all elements at row 2
A[,3] # all elements at column 3
A[ ,c(1,3)]  # the 1st and 3rd columns 

#Naming rows and columns
dimnames(A) = list( 
  c("row1", "row2"),         # row names 
  c("col1", "col2", "col3")) # column names 
A["row1",]

#Transpose of a matrix
t(A)

# Deconstructing a matrix 
c(A)





#2. Lists

a= c(2, 3, 5) 
b = c("aa", "bb", "cc", "dd", "ee") 
c= c(TRUE, FALSE, TRUE, FALSE, FALSE) 
x = list(a, c, b, "My list")
x[1]       # first member of the list
x[c(1,2)]  # first and second member of the list

x[[1]][1]=6 # Modifiying the content of the first member
x[1]

# Naming Lists

y = list(mary=c(1991, 3, 5), dan=c("aa", "bb")) 
y
y['mary']
y$dan
y[['dan']][1]="new"
y$dan



#DataFrames
mtcars #built it dataframe

head(mtcars) # preview of the data, first 6 rows
nrow(mtcars) # number of rows
ncol(mtcars) #number of columns

mtcars[1]
mtcars[c("mpg", "hp")] # two columns
mtcars[c(3, 24),]  # two rows
mtcars["Camaro Z28",]  # row by its name
mtcars[[3]][mtcars$am == 0]



#Stats with R

#1.QUALITATIVE DATA

# Data used : painters built in dataframe
library(MASS)

help(painters)
head(painters)

summary(painters) #sumamry of dataframe

str(painters) # structure of dataframe





school = painters$School      # the painter schools 
school.freq = table(school)   # applying the table function to get the distribution
cbind(school.freq)    # applying the cbind function so the results can be in acolumn format

school.relfreq = (school.freq / nrow(painters))*100  # getting the relative fre qency distribution

cbind(school.relfreq)





#BARPLOT with colors
colors = c("red", "yellow", "green", "violet",  "orange", "blue", "pink", "cyan") 
barplot(school.freq, col=colors)

#pie chart
pie(school.freq)




#categorical statistics

#Finding the mean composition score of school C in the data set painters.

c_painters = painters[ school == "C" , ]  # child data set
c_painters

mean(c_painters$Composition) 

#Finding the mean composition score of all schools in the data set painters.
Mean_of_all_schools=tapply(painters$Composition, painters$School, mean)
cbind(Mean_of_all_schools)




#2. Quantitative Data

#Data used : Built in Dataframe faithful

# Getting overview of the data
help(faithful) 

head(faithful)

summary(faithful)

str(faithful)


# Finding the frequency, relative and cumulative frequency distribution of the eruption durations in faithful.
#1.Find the range
duration=faithful$eruptions
range(duration)

#2. Breaking the range into non -overlapping intervals
breaks = seq(1.5, 5.5, by=0.5)    # half-integer sequence 
breaks

#3. classify the data into the intervals
duration.cut = cut(duration, breaks, right=FALSE)
duration.cut

duration.freq=table(duration.cut)
duration.Relfreq=table(duration.cut)/nrow(faithful)
duration.cumfreq=cumsum(duration.freq)

cbind(duration.freq,duration.Relfreq,duration.cumfreq)







# histogram
colors = c("red", "yellow", "green", "violet", "orange", "blue", "pink", "cyan")


hist(duration,    # apply the hist function 
     right=FALSE,    # intervals closed on the left 
     col=colors,     # set the color palette 
     main="Old Faithful Eruptions", # the main title 
     xlab="Duration minutes")       # x-axis label)


# cumulative frequency graph
cumfreq0 = c(0, cumsum(duration.freq)) 
plot(breaks, cumfreq0,            # plot the data 
     main="Faithful Eruptions",  # main title 
     xlab="Duration minutes",        # x???axis label 
     ylab="Cumulative eruptions")   # y???axis label 
lines(breaks, cumfreq0)           # join the points


#stem leaf plot

stem(faithful$eruptions)


#scatter

duration = faithful$eruptions      # the eruption durations 
waiting = faithful$waiting         # the waiting interval 
plot(duration, waiting,            # plot the variables 
     xlab="Eruption duration",        # x???axis label 
     ylab="Time waited")              # y???axis label


abline(lm(waiting ~ duration))



#3.Numerical Mesures

#Mean
mean(duration)

# Median

median(duration)

#Quartile
quantile(duration)

#Percintile
quantile(duration, c(0.38,0.67))

#range

range=max(duration)-min(duration)

range

#Interquartile Range

IQR(duration)


#boxplot

duration = faithful$eruptions       # the eruption durations 
boxplot(duration, horizontal=TRUE)  # horizontal box plot


#variance
var(duration)

#standard deviation
sd(duration)

#covariance

waiting = faithful$waiting # the waiting period 
cov(duration, waiting)

#correlation coefficient
duration = faithful$eruptions   # eruption durations 
waiting = faithful$waiting      # the waiting period 
cor(duration, waiting)          # apply the cor functio


#central moment

library(e1071)                  # load e1071 
duration = faithful$eruptions   # eruption durations 
moment(duration, order=3, center=TRUE) 


# skewness

duration = faithful$eruptions     # eruption durations 
skewness(duration)                # apply the skewness function 


# Kurtosis
kurtosis(duration)                # apply the kurtosis function
hist(duration)



#4. Probability Distributions
#===================================================================================================

#4.1 Binomial Distribuition

#example: Probaility of getting 4 questionbs correct on a 12 multiplte choice quiz. Only one answer can be correct out of 5 other choices
dbinom(4, size=12, prob=0.2)  #exactly 4 questions,  probility of getting one correct =1/5=0.2
pbinom(4, size=12, prob=0.2)  # 4 or less questions by random



#4.2 Poisson Distribution
# example : If there are twelve cars crossing a bridge per minute on average, the probability of having seventeen or more cars crossing the bridge in a particular minute is:
ppois(16, lambda=12)




#4.3 Contionuous uniform  Distribution
#example : Selecting ten random numbers between one and three
cbind(runif(10, min=1, max=3) )





#Exponential Distribution
#example :Suppose the mean checkout time of a supermarket cashier is three minutes. Find the probability of a customer checkout being completed by the cashier in less than two minutes.

pexp(2, rate=1/3) 






# normal distribution

# example : Assume that the test scores of a college entrance exam fits a normal distribution. Furthermore, the mean test score is 72, and the standard deviation is 15.2. What is the percentage of students scoring 84 or more in the exam?

pnorm(84, mean=72, sd=15.2, lower.tail=FALSE) 




#5. simple linear regression
#=================================================

# Values of height
x= c(151, 174, 138, 186, 128, 136, 179, 163, 152, 131)

# Values of weight.
y=c(63, 81, 56, 91, 47, 57, 76, 72, 62, 48)


rel=lm(y~x)
summary(rel)


# Find weight of a person with height 170.
a = data.frame(x=170)
result = predict(rel,a)
print(result)

# Give the chart file a name.
#png(file = "linearregression.png")

# Plot the chart.
plot(y,x,col = "blue",main = "Height & Weight Regression",
     abline(lm(x~y)),cex = 1.3,pch = 16,xlab = "Weight in Kg",ylab = "Height in cm")

# Save the file.
#dev.off()




#.6 Multiple linear regression
#===================================================================================

input <- mtcars[,c("mpg","disp","hp","wt")]
input
# Create the relationship model.
model <- lm(mpg~disp+hp+wt, data = input)

a <- coef(model)[1]
Xdisp <- coef(model)[2]
Xhp <- coef(model)[3]
Xwt <- coef(model)[4]

print(Xdisp)
print(Xhp)
print(Xwt)
print(a)


# Sample 
Y = 37.15+(-0.000937)*221+(-0.0311)*102+(-3.8008)*2.91

Y



#.7 Logistics regression
#===================================================================================
input <- mtcars[,c("am","cyl","hp","wt")]
input

am.data = glm(formula = am ~ cyl + hp + wt, data = input, family = binomial)

print(summary(am.data))



#8. Decision Tree
#===================================================================================
#install.packages("party") # Package used to create Decision Trees

# Load the party package. It will automatically load other dependent packages.
#library(party)

# Print some records from data set readingSkills.
print(head(readingSkills))


input.dat <- readingSkills[c(1:105),]
input.dat
# Create the tree.
output.tree <- ctree(
  nativeSpeaker ~ age + shoeSize + score, 
  data = input.dat)
output.tree
plot(output.tree)




