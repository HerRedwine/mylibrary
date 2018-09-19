politeness=read.csv("http://www.bodowinter.com/tutorial/politeness_data.csv")
write.table (x = politeness, file ="F:/en.csv", sep =",", row.names =TRUE, col.names =T, quote =TRUE)
#================view the data set======================
#show the head of politeness
head(politeness)
tail(politeness)
# other commands you may use
summary(politeness)
str(politeness)
colnames(politeness)

#================check for missing values======================
which(!complete.cases(politeness))

#======look at the relationship between politeness and pitch by means of a boxplot==========
boxplot(frequency ~ attitude*gender,col=c("white","lightgray"),politeness)

#================A random intercept model======================

library(Matrix)

library(lme4)

lmer(frequency ~ attitude, data=politeness)

politeness.model = lmer(frequency ~ attitude +
                          
                          gender + (1|subject) +
                          
                          (1|scenario), data=politeness)

summary(politeness.model)

#Statistical significance test

politeness.null = lmer(frequency ~ gender +
                         
                         (1|subject) + (1|scenario), data=politeness,
                       
                       REML=FALSE)

politeness.model = lmer(frequency ~ attitude +
                          
                          gender + (1|subject) + (1|scenario),
                        
                        data=politeness, REML=FALSE)

anova(politeness.null,politeness.model)

#look at the coefficients of the model by subject and by item
coef(politeness.model)

#================A random slope model======================

politeness.model = lmer(frequency ~ attitude +
                          
                          gender + (1+attitude|subject) +
                          
                          (1+attitude|scenario),
                        
                        data=politeness,
                        
                        REML=FALSE)

coef(politeness.model)

#Statistical significance test (try to obtain a p-value)

#construct the null model

politeness.null = lmer(frequency ~ gender +
                         
                         (1+attitude|subject) + (1+attitude|scenario),
                       
                       data=politeness, REML=FALSE)

#do the likelihood ratio test

anova(politeness.null,politeness.model)
