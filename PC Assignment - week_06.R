##PC1. Load the data into R. Now get to work on reshaping the dataset. 

## this isn't working - read.table("~/desktop/COM521/COM521-Janny/owan03.xls", header = TRUE)


##I think a good format would be a data frame with two columns: 
##group, time of death (i.e., lifespan).

lifespan <- c(owan03$X1,owan03$X2,owan03$X3,owan03$X4)
owan03$X1 <- 1
owan03$X2 <- 2
owan03$X3 <- 3
owan03$X4 <- 4
group <- c(owan03$X1,owan03$X2,owan03$X3,owan03$X4)
new.df <- data.frame(group,lifespan)

##Mako's way:
colnames(awan03) <- c("control", "low", "medium", "high")

library(reshape)
d <- melt(d, na.rm = TRUE)

colnames(d) <- 

##Red Dye Number 40
##S.W. Laagakos and F. Mosteller of Harvard University fed mice different doses of red dye number 40 and recorded the time of death in weeks. Results for female mice, dosage and time of death are shown in the data
##X1 = time of death for control group
##X2 = time of death for group with low dosage
##X3 = time of death for group with medium dosage
##X4 = time of death for group with high dosage
##Reference: Journal Natl. Cancer Inst., Vol. 66, p 197-212

##PC2. Create summary statistics and visualizations for each group.
summary(group)
summary(lifespan)
hist(lifespan)
mean(owan03$X1)
hist(owan03$X1)
summary(owan03$X2)
hist(owan03$X2)
summary(owan03$X3)
hist(owan03$X4)

##Write code that allows you to generate a useful way to both
##(a) get a visual sense both for the shape of the data and its relationships and 

library(ggplot2)
ggplot(new.df, aes(group, lifespan)) + geom_point(aes(color = group))

##(b) the degree to which the assumptions for t-tests and ANOVA hold. 

##What is the global mean of your dependent variable?
mean(new.df$lifespan, na.rm = TRUE)





##PC3. Do a t-test between mice with any RD40 and mice with at least a small amount. 
##Run a t-test between the group with a high dosage and control group. 
t.test(owan03$X1,owan03$X2)

##How would you go about doing it using formula notation? 
##Be ready to report, interpret, and discuss the results in substantive terms.
##PC4. Estimate an ANOVA analysis using aov() to see if there is a difference 
##between the groups. 
##Be ready to report, interpret, and discuss the results in substantive terms.

aov(lifespan ~ group, data=new.df)