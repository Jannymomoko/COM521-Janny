##PC0. Load up your dataset as you did in Week 3 PC2.
DF <- read.csv("~/Desktop/COM521/uwcom521-assignments/week_03/week3_dataset-janny.csv")


##PC1. If you recall from Week PC6, x and y seemed like they linearly related. 
##We now have the tools and terminology to describe this relationship and to estimate just 
##how related they are. 
##Run a t.test between x and y in the dataset and be ready to interpret the results for the class.

t.test(DF$x,DF$y)

##PC2. Estimate how correlated x and y are with each other.
cor(DF$x,DF$y)
cor(DF$x,DF$y, method = "spearman")

##PC3. Recode your data in the way that I laid out in Week 3 PC7.
DF$i <- as.logical(DF$i)
DF$j <- as.logical(DF$j)
DF$k.factor <- factor(DF$k,
                      levels=c(0,1,2,3),
                      labels=c("none", "some", "lots", "all"))


##PC4. Generate a set of three linear models and be ready to intrepret the coefficients, 
##standard errors, t-statistics, p-values, and {\displaystyle \mathrm {R} ^{2}} {\displaystyle \mathrm {R} ^{2}} for each:
##(a) 
cor(DF$x,DF$y)

plot(lm(y~x, data=DF))

##(b) 
summary(lm(y~x + i + j, data= DF))

##(c) 
summary(lm(y~x + i + j + k, data= DF))

M <- lm(y~x + i + j + k, data= DF)

##PC5. Generate a set of residual plots for the final model (c) 
##and be ready to interpret your model in terms of each of these:
qqnorm(residuals(M))
d.graph <- data.frame(x=DF$x, residuals=residuals(M))
library(ggplot2)
ggplot(data=d.graph) + aes(x=DF$x, y=residuals) +geom_point()

##(a) A histogram of the residuals.
hist(residuals(M))

##(b) Plot the residuals by your values of x, i, j, and k (four different plots).
ggplot(data=d.graph) + aes(x=DF$x, y=residuals) +geom_point()
ggplot(data=d.graph) + aes(x=DF$i, y=residuals) +geom_point()
ggplot(data=d.graph) + aes(x=DF$j, y=residuals) +geom_point()
ggplot(data=d.graph) + aes(x=DF$k, y=residuals) +geom_point()

##(c) A QQ plot to evaluate the normality of residuals assumption.
qqnorm(residuals(M))

##PC6. Generate a nice looking publication-ready table with a series of fitted models 
##and put them in a Word document.
install.packages("stargazer")
M1 <- lm(x~y + i + j, data= DF)
M2 <- lm(x~y, data=DF)
stargazer(M2,M1,M, type="html")

##Now, lets go back to the Michelle Obama dataset we used last week the week 7 problem set's programming challenges.

##PC7. Load up the dataset once again and fit the following linear models and be ready to interpret them similar to the way you did above in PC4:
##(a) 
Halloween <- read_dta("~/Desktop/COM521/COM521-Janny/data/Halloween Dataverse Files/Halloween2012-2014-2015_PLOS.dta")
model.a <- lm(obama~fruit, data=Halloween)

##(b) Add a control for age and a categorical version of a control for year to the model in (a).
madel.b <- lm(obama~fruit + age + year, data=Halloween)

##PC8. Take a look at the residuals for your model in (a) 
residuals(model.a)
##and try to interpret these as you would in PC4 above. What do you notice?
##residuals all have the same value.
##PC9. Run the simple model in (a) three times on three subsets of the dataset: 
##just 2012, 2014, and 2015. 

subset_12 <- Halloween[ which(Halloween$year=="2012") , ]
lm(obama~fruit, data=subset_12)
subset_14 <- Halloween[ which(Halloween$year=="2014") , ]
lm(obama~fruit, data=subset_14)
subset_15 <- Halloween[ which(Halloween$year=="2015") , ]
lm(obama~fruit, data=subset_15)
##Be ready to talk through the results.