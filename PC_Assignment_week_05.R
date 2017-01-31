##PC1. Go back to the dataset I distributed for the week 3 problem set. 
##You've already computed the mean for this in week 2. 

WEEK2 <- read.csv("~/Desktop/COM521/COM521-Janny/week3_dataset-janny.csv")

##You should compute the 95% confidence interval for the variable x in two ways:

##(a) By hand using the normal formula for standard error

summary(week3_dataset_janny$x)
N <- as.numeric(nrow(week3_dataset_janny))
SD <- sd(week3_dataset_janny$x)
SE <- SD/sqrt(N)
M <- mean(week3_dataset_janny$x)
error <- qt(0.975,df=N-1)*SE
left <- M-error
right <- M+error
left
right

##(b) Using the appropriate built-in R function. 
 t.test(week3_dataset_janny$x)

##These number should be the same or very close. 
##After reading the OpenIntro, can you explain why they might not be exactly the same?
 ## My two results are exactly the same. 
    ## > left
     ##[1] 47.53941
     ##> right
     ##[1] 63.99641
    ## > t.test(week3_dataset_janny$x)
     ## One Sample t-test
    ##data:  week3_dataset_janny$x
     ##t = 13.448, df = 99, p-value < 2.2e-16
     ##alternative hypothesis: true mean is not equal to 0
     ##95 percent confidence interval:
           ##47.53941 63.99641
           ##sample estimates:
           ##mean of x 
           ##55.76791 
##(c) Compare the mean from your sample - and your confidence interval 
## -to the true population mean. Is the true mean inside your confidence interval?

  ##No, the true mean is not inside the range of 95% confidence interval.
 
##PC2. Let's look beyond the mean. Compare the distribution from your sample of x 
##to the true population. Draw histograms and compute other descriptive and summary statistics. 
##What do you notice? Be ready to talk for a minute or two about the differences.
 
 DFP <- read.delim("~/Desktop/COM521/COM521-Janny/com521_population.tsv")
 ##why it become a splited data frame automatically when I assign it a new name when I read the dataset?
## we always have to save the return value of the read.xxxx function.
mean(DFP$x)
mean(WEEK2$x)
hist(DFP$x)
hist(WEEK2$x)
summary(DFP$x)
t.test(DFP$x)

##population distribution is more normal,but population also has further outliners. 

##PC3. Compute the mean of y from the true population 
##and then create the mean and confidence interval from the y in your sample.
##Is it in or out? It's in. 
t.test(DFP$y)
mean(DFP$y)
mean(WEEK2$y)

##PC4. I want you to run a simple simulation that demonstrates one of 
##the most fundamental insights of statistics:
##(a) Create a vector of 10,000 randomly generated numbers 
##that are uniformly distributed between 0 and 9.

SAMPLE <- sample(0:9, 10000, replace=T)  
##I don't understand the replace=T part tho."replace=T" means replacement is allowed. 
##runif() takes samples with decimal places, while sample() function only take integal numbers. 
SAMPLE

replicate(100,{mean(sample(DFP,2))})

##(b) Take the mean of that vector. Draw a histogram.
mean(SAMPLE)
hist(SAMPLE)

##(c) Create 100 random samples of 2 items each from your randomly generated data 
##and take the mean of each sample. 

mean.of.two <- function(i) {
  sample.of.two <- sample(SAMPLE, 2)
  mean(sample.of.two)
}

##lapply always return a list. 
##sapply() will give you a vector if it can, if it cant, just give you a list.
##I dont understand why we put "i" in the function tho. 
##You just save the return into it, whatever you name it.  

sapply(rep(1,100), mean.of.two)

##Create a new vector that contains those means. 

new.vector <- sapply(rep(1,100), mean.of.two)

##Describe/display the distribution of those means.
class(new.vector)
summary(new.vector)
hist(new.vector)

##(d) Do (c) except make the items 10 items in each sample instead of 2. 
mean.of.ten <- function(i) {
  sample.of.ten <- sample(SAMPLE, 10)
  mean(sample.of.ten)
}
vector10 <- sapply(rep(1,100), mean.of.ten)
hist(vector10)

##Then do (c) again except with 100 items. Be ready to describe how the histogram changes 
##as the sample size increases. 
##(HINT: You'll make me very happy if you write a function to do this.)
mean.of.100 <- function(i) {
  sample.of.100 <- sample(SAMPLE, 100)
  mean(sample.of.100)
}
vector100 <- sapply(rep(1,100), mean.of.100)
hist(vector100)

##Central Limit Theorem (The larger N is, the range of sample mean is narrower) 

##changes:1) the range of the mean is changed.The larger the N is, the smaller the range is.
          
##varience is like noise. You need to listen to long time to get the information.  
##The variance is also getting smaller with the larger case numbers, 
##becasue the sampling distribution become to happen in smaller range.

##PC5. Do PC4 again but with random data drawn from a normal distribution 
##instead of a uniform distribution. 
NS <- rnorm(100, mean=42, sd=42)
mean.of.new <- function(i) {
  sample.of.new <- sample(NS, 10)
  mean(sample.of.new)
}

APPLE <- sapply(rep(1,100),mean.of.new)
hist(APPLE)
##How are you results different than in PC4?
          
            
      