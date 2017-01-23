##PC2. Load both datasets into R as separate data frames. 

getwd()
setwd("/Users/fanyijingwang")
list.files("/Users/fanyijingwang/Desktop/COM521/COM521-Janny")
read.csv("/Users/fanyijingwang/Desktop/COM521/COM521-Janny/COS-Statistics-Mobile_Sessions.csv")
read.csv("/Users/fanyijingwang/Desktop/COM521/COM521-Janny/COS-Statistics-Top5000-Pages.csv)

##Explore the data to get a sense of the structure of the data.
##What are the columns, rows, missing data, etc? 

TP <- COS_Statistics_Top5000_Pages
nrow(TP)
ncol(TP)

CSM <- COS_Statistics_Mobile_Sessions
nrow(CSM)
ncol(CSM)

table(is.na(TP))
table(is.na(CSM))

##Write code to take (and then check/look at) several random subsamples of the data.

mysample <- TP[sample(1:nrow(TP), 50, replace=FALSE),]
mysample_01 <- CSM[sample(1:nrow(CSM), 50, replace=FALSE),]


##PC3. Using the top 5000 dataset, create a new data frame 
##where one column is each month (as described in the data) 
##and a second column is the total number of views made to all pages
##in the dataset over that month.

Month_df <- c(TP$Month)
View_df <- c(TP$Pageviews)
Page_df <- c(TP$Page)

NDF <- data.frame(Page_df, Month_df, View_df)

##PC4. Using the mobile dataset, create a new data frame 
##where one column is each month described in the data 
##and the second is a measure (estimate?) of the total number of views 
##made by mobiles (all platforms) over each month. 
##This will will involve at least two steps since total views are included. 
##You'll need to first use the data there to create a measure of the total views per platform.

tatol.views <- c(CSM$Sessions * CSM$PagesPerSession)
OS <- c(CSM$Operating_System)
Month.data.frame <- c(CSM$Month)

CSM_data.frame <- data.frame(OS, tatol.views, Month.data.frame)

##PC5. Merge your two datasets together into a new dataset with columns for each month, total views (across the top 5000 pages) and total mobile views. Are there are missing data? Can you tell why?
##PC6. Create a new column in your merged dataset that describes your best estimate of the proportion (or percentage, if you really must!) of views that comes from mobile. Be able to talk about the assumptions you've made here. Make sure that date, in this final column, is a date or datetime object in R.
##PC6. Graph this over time and be ready to describe: (a) your best estimate of the proportion of views from mobiles to the Seattle City website over time and (b) an indication of whether it's going up or down.