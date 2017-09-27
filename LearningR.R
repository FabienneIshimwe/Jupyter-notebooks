

#1. Matrix
#===================================================================================================
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
#===================================================================================================

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
y['mary']
y$dan
y[['dan']][1]="new"
y$dan



#3. DataFrames
#===================================================================================================

mtcars #built it dataframe

head(mtcars) # preview of the data, first 6 rows
nrow(mtcars) # number of rows
ncol(mtcars) #number of columns

mtcars[1]
mtcars[c("mpg", "hp")] # two columns
mtcars[c(3, 24),]  # two rows
mtcars["Camaro Z28",]  # row by its name
mtcars[[3]][mtcars$am == 0]



#STATS WITH  R
#===================================================================================================
#===================================================================================================


#1.QUALITATIVE DATA
#===================================================================================================


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
#===================================================================================================

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
#===================================================================================================

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




