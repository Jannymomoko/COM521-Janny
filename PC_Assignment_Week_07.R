##PC1. (a) Reproduce both Table 1 and Table 2 (just US users) 
##using the dataset (as closely as possible).
LA <- lilypad_anonymized
Table_1 <- table( LA$gender,LA$order_type)
colnames(Table_1) <- c ("Arduino","Both","LiliPad")
row.names(Table_1) <- c("Female", "Male","Unknown")
print(Table_1)


cut(LA$country, 82)
LA$temp.country <- cut(LA$country, 82)
head(LA)
table(LA$temp.country,LA$order_type,LA$gender)
Table_2 <- rbind(c(810,61,279),c(6724,178,382),c(890,17,52))

##(b) Run a {\displaystyle \chi ^{2}} {\displaystyle \chi ^{2}}-test on both tables. 
##Compare to the paper (for Table 1, there doesn't seem to be a chi ^{2}} test for Table 2). Did you reproduce it?

chisq.test(Table_1)
chisq.test(Table_2)

##(c) Install the package "gmodels" and try to display the table using the function CrossTable(). 
##This will give you output very similar to SPSS.

install.packages(c("gmodels"))
CrossTable(Table_1)
CrossTable(Table_2)


##(d) It's important to be able to import tables directly into your word processor 
##without cutting and pasting individual cells. 
##Can you export the output of your table? 
##There are a bunch of functions you can use to do this. 
##I used the "xtable" package but I think that write.table() 
##and Excel would do the job just as well.

install.packages(c("xtable"))
write.table(Table_1)
write.table(Table_2)


##PC2. At the Community Data Science Workshops we had two parallel 
##afternoon sessions on Day 1. 
##In my session, there were 42 participants. 
##In Tommy Guy's session, there were only 19. 
##The next week (Day 2), we asked folks to raise their hands 
##if they had been in Tommy's session (14 did ) and 
##how many had been in mine (31 did). 
##There was clearly attrition in both groups! 
##Was there more attrition in one group than another? 

CDSW <- rbind(c(42,19),c(31,14))
colnames(CDSW) <- c("mako","tommy")
rownames(CDSW) <- c("Day1","Day2")
write.table(CDSW)
CrossTable(CDSW)
chisq.test(CDSW)
prop.test(CDSW)

##Try answering this both with a test of proportions (prop.test()) 
##and with a chi ^{2}} chi ^{2}}. 
##Compare your answers. Is there convincing evidence that 
##there is a dependence between instructor and attrition?

##No, there is no dependence between instructor and attrition.
                                                                                                         
##PC3. Download this dataset that was just published on 
##"The Effect of Images of Michelle Obama???s Face on Trick-or-Treaters??? 
##Dietary Choices: A Randomized Control Trial." 
##The paper doesn't seem to have even been published yet 
##so I think the abstract is all we have. 
##We'll come back to it again next week.
##(a) Download and import the data into R. I needed to install the "readstata13" package to do so.

install.packages("readstata13")
Halloween <- read_dta("~/Desktop/COM521/COM521-Janny/Halloween Dataverse Files/Halloween2012-2014-2015_PLOS.dta")

##(b) Take a look at the codebook if necessary. 
##Recode the data on being presented with Michelle Obama's face  
##and the data on whether or not kids picked up fruit. 
##we'll leave it at that for now.
Halloween$Michelle <- cut(Halloween$obama, 2)
pick.up.friuts <- table(Halloween$Michelle, Halloween$fruit)

##(c) Do a simple test on whether or not the two groups are dependent. 
##Be ready to report those tests. 
chisq.test(pick.up.friuts)

##The results in the paper will use linear regression. 
##Do you have a sense, from your reading, 
##why your results using the coding material we've learned might be different?