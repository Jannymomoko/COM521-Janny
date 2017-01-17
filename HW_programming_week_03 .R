##PC3. Load the CSV file into R. Also make sure that you loaded the week 2 dataset file.
read.csv("~/Desktop/COM521/uwcom521-assignments/week_03/week3_dataset-janny.csv")
load("~/Desktop/COM521/uwcom521-assignments/week_02/week2_dataset-janny.RData")

##PC4. Get to know your data! Do whatever is necessary to summarize the new dataset. Now many columns and rows are there? 
##What are the appropriate summary statistics to report for each variable? 
##What are the ranges, minimums, maximums, means, medians, standard deviations of the variables of variables? 
##Draw histograms for all of the variables to get a sense of what it looks like. Save code to do all of these things.

ncol(week3_dataset_janny) #[1] 5
nrow(week3_dataset_janny) #[1] 100
summary(week3_dataset_janny)
##x                j              i              k              y         
##Min.   :-44.38   Min.   :0.00   Min.   :0.00   Min.   :0.00   Min.   :-307.1  
##1st Qu.: 26.31   1st Qu.:0.00   1st Qu.:0.00   1st Qu.:1.00   1st Qu.: 153.8  
##Median : 57.16   Median :0.00   Median :0.00   Median :1.00   Median : 282.0  
##Mean   : 55.77   Mean   :0.43   Mean   :0.37   Mean   :1.43   Mean   : 289.6  
##3rd Qu.: 81.30   3rd Qu.:1.00   3rd Qu.:1.00   3rd Qu.:2.00   3rd Qu.: 392.4  
##Max.   :154.64   Max.   :1.00   Max.   :1.00   Max.   :3.00   Max.   : 758.2  

xanax <- week3_dataset_janny$x
sd(xanax)
hist(xanax)
janny <- week3_dataset_janny$j
sd(janny)
hist(janny)
icecream<- week3_dataset_janny$i
sd(icecream)
hist(icecream)
kale <- week3_dataset_janny$k
sd(kale)
hist(kale)
yyyy <- week3_dataset_janny$y
sd(yyyy)
hist(yyyy)

##PC5. Compare the week2.dataset vector with the first column (x) of the data frame. 
##I mentioned in the video lecture that they are similar? Do you agree? How similar?
##Write R code to demonstrate or support this answer convincingly.

week3_dataset_janny[, "x"]
data.frame(week2.dataset,row.names = NULL, check.rows = FALSE, check.names = TRUE,fix.empty.names = TRUE, stringsAsFactors = default.stringsAsFactors())
data.frame(week3_dataset_janny[, "x"],row.names = NULL, check.rows = FALSE, check.names = TRUE,fix.empty.names = TRUE, stringsAsFactors = default.stringsAsFactors())
mean(week3_dataset_janny$x)
mean(week2.dataset)
# mean(week3_dataset_janny$x) == mean(week2.dataset)

##PC6. Visualize the data using ggplot2 and the geom_point() function. Graphing the x on the x-axis and y on the y-axis seem pretty reasonable! 
p <- ggplot(data=week3_dataset_janny, aes(x = xanax,yyyy))
p + geom_point()
p+geom_point(aes(color = janny))

##Graph i, j, and k on other dimensions (e.g., color, shape, and size seems reasonable). 

ggplot(week3_dataset_janny, aes(kale, yyyy, size=kale, color=janny)) + geom_point()

##Did you run into any trouble? How would you work around this?


##PC7. A very common step when you import and prepare for data analysis is going to be cleaning and coding data. Some of that is needed here. 
##As is very common, i, j are really dichotomous "true/false" variables but they are coded as 0 and 1 in this dataset. 
##Recode these columns as logical. The variable k is really a categorical variable. Recode this as a factor and change the numbers into textual "meaning" to make it easier. 
##Here's the relevant piece of the codebook (i.e., mapping): 0=none, 1=some, 2=lots, 3=all. 
##The goals is to end up with a factor where those text strings are the levels of the factor. 
##I haven't shown you how to do exactly this but you can solve this with things I have shown you. Or you can try to find a recipe online.

week3_dataset_janny$j <- ifelse(week3_dataset_janny$j =1,
                                         c("TRUE"), c("FALSE"))


week3_dataset_janny$ <- cut(week3_dataset_janny$k,
                                   breaks=c(0,1,2,3),
                                   labels=c("none","some","lots","all"))

                              

##PC8. Take column i and set it equal to NA when if it is FALSE (i.e., 0). 
##Then set all the values that are NA back to 1. Sorry for the busy work! ;)

week3_dataset_janny[week3_dataset_janny$i == 0,]
week3_dataset_janny[week3_dataset_janny$i == 0,"i"] <- NA


week3_dataset_janny[, "i"][is.na("i")] <- "1" 


##PC9. Now that you have recoded your data in PC7, generate new summaries for those three variables. Also, go back and regenerate the visualizations. How have these changed? How are these different from the summary detail you presented above?