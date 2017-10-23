'''
To utilize spam dataset from kernlab library
'''

library(kernlab)
#install.packages('kernlab')
data(spam)

set.seed(3435)
trainIndicator= rbinom(4601, size=1, prob=0.5)
table(trainIndicator)

train_spam = spam[trainIndicator == 1,]
test_spam = spam[trainIndicator == 0, ]

####  EDA ####  
head(train_spam) #we have frequency counts in the emails
table(train_spam$type)
plot(train_spam$capitalAve ~ train_spam$type)

#to account for the outliers 
plot(log(train_spam$capitalAve +1) ~ train_spam$type)

#relationship between variables 
plot(log10(train_spam[, 1:4] +1))

#clustering w/ hierarchical cluster analysis
hclust = hclust(dist(t(train_spam[, 1:57])))
plot(hclust)

#redoing clustering after accounting for skewness
hclust_update = hclust(dist(t(log10(train_spam[, 1:55] +1))))
plot(hclust_update)

### Staticstical prediction / modeling
train_spam$numType = as.numeric(train_spam$type) -1
costFunction = function(x,y) sum(x != (y>0.5))
cvError = rep(NA, 55)
library(boot)
for (i in 1:55){
    lmFormula = reformulate(names(train_spam)[i], response="numType")
    glmFit = glm(lmFormula, family = "binomial",data=train_spam)
    cvError[i]= cv.glm(train_spam, glmFit, costFunction, 2)$delta[2]
}

#Determining which predictor has minimum cross-validated error?
names(train_spam)[which.min(cvError)]   #[1] "charDollar"


### Get a measure of uncertainty
#Use the best model from the group
predictionModel = glm(numType ~charDollar, family="binomial", data=train_spam)

# Get predictions on test set (get probabilites)
predictionTest = predict(predictionModel, test_spam)
predictedSpam = rep("nonspam", dim(test_spam)[1])

# Classify as "spam" for those with prob > 0.6
predictedSpam[predictionModel$fitted > 0.5] = "spam"

# Classification table
table(predictedSpam, test_spam$type)

#Error rate (~22%) 
(61 + 458) / (1346 + 458 + 61 + 449)
