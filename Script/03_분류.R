## iris Data

data(iris)
data(iris, package = 'datasets')

library(help = 'datasets')
ls('package:datasets')

str(iris)

set.seed(1234)
ind <- sample(2, nrow(iris), replace = TRUE, prob = c(0.7, 0.3))
train.data <- iris[ind ==1,]
test.data <- iris[ind == 2,]

## Build a ctree

library(party)

myFormula <- Species ~ Sepal.Length + Sepal.Width + Petal.Length + Petal.Width
iris_ctree <- ctree(myFormula, data = train.data)

table(predict(iris_ctree), train.data$Species)

## Result and Predict ctree

print(iris_ctree)

plot(iris_ctree)
plot(iris_ctree, type = 'simple')

testPred <- predict(iris_ctree, newdata = test.data)
table(testPred, test.data$Species)

## The bodyfat Dataset

data('bodyfat', package = 'TH.data')
dim(bodyfat)
head(bodyfat, 5)

## Train a Decision Tree with rpart

set.seed(1234)
ind <- sample(2, nrow(bodyfat), replace=T, prob = c(0.7, 0.3))
bodyfat.train <- bodyfat[ind == 1,]
bodyfat.test <- bodyfat[ind == 2,]

library(rpart)
myFormula <- DEXfat ~ age + waistcirc + hipcirc + elbowbreadth + kneebreadth
bodyfat_rpart <- rpart(myFormula, data = bodyfat.train, control = rpart.control(minsplit = 10))

## Result rpart & Pruning

print(bodyfat_rpart)

plot(bodyfat_rpart)
text(bodyfat_rpart, use.n = T)

opt <- which.min(bodyfat_rpart$cptable[, 'xerror'])
cp <- bodyfat_rpart$cptable[opt, 'CP']

bodyfat_prune <- prune(bodyfat_rpart, cp = cp)

plot(bodyfat_prune)
text(bodyfat_prune, use.n = T)

## Model Evaluation

DEXfat_pred <- predict(bodyfat_prune, newdata = bodyfat.test)
xlim <- range(bodyfat$DEXfat)
plot(DEXfat_pred ~ DEXfat, data = bodyfat.test, xlab = 'Observed', ylab = 'prediction', ylim = xlim, xlim = xlim)
abline(a = 0, b = 1)

## Train a Random Forest
ind <- sample(2, nrow(iris), replace = TRUE, prob = c(0.7, 0.3))
train.data <- iris[ind == 1, ]
test.data <- iris[ind == 2, ]

library(randomForest)
rf <- randomForest(Species ~ ., data = train.data, ntree = 100, proximity = T)

table(train.data$Species, predict(rf))

## Result of Random Forest

print(rf)

# Error Rate
plot(rf, matin = '')

# Variable Importance
importance(rf)

varImpPlot(rf)

## Predictions of Random Forest

irisPred <- predict(rf, newdata = test.data)
table(irisPred, test.data$Species)

## Train by neuralnet

data(infert, package = 'datasets')

ind <- sample(2, nrow(infert), replace = T, prob = c(0.7, 0.3))
train.infert <- infert[ind == 1,]
test.infert <- infert[ind == 2,]

library(neuralnet)

net.infert <- neuralnet(case~parity+induced+spontaneous, train.infert, hidden = 2, err.fct="ce", linear.output=FALSE, likelihood=TRUE)

print(net.infert)

plot(net.infert)

## Train by nnet 1

library(nnet)

infert.nn <- nnet(case ~ parity+induced+spontaneous, data=train.infert, size = 2)

inf.train.result <- predict(infert.nn, train.infert)
inf.train.result <- ifelse(inf.train.result > 0.5, 1, 0)

table(train.infert$case, inf.train.result)

inf.test.result <- predict(infert.nn, test.infert)
inf.test.result <- ifelse(inf.test.result > 0.5, 1, 0)

table(test.infert$case, inf.test.result)

## Train by nnet 2

iris.targets <- class.ind(iris$Species)
iris.new <- cbind(iris[,1:4], iris.targets)

ind <- sample(2, nrow(iris.new), replace = T, prob = c(0.7, 0.3))
train.iris <- iris.new[ind == 1,]
test.iris <- iris.new[ind == 2,]

library(nnet)

iris.nn <- nnet(train.iris[,1:4], train.iris[5:7], size = 2, rang = 0.1, decay = 5e-4, maxit = 200)

test.cl <- function(true, pred) {
  true <- max.col(true)
  cres <- max.col(pred)
  table(true, cres)
}

test.cl(train.iris[,5:7], predict(iris.nn, train.iris[,1:4]))

test.cl(test.iris[,5:7], predict(iris.nn, test.iris[,1:4]))

## Train by nnet 3

train.iris2 <- iris[ind == 1,]
test.iris2 <- iris[ind == 2,]

iris.nn2 <- nnet(Species ~ ., data = train.iris2, size = 2, rang = 0.1, decay = 5e-4, maxit = 200)

table(train.iris2$Species, predict(iris.nn2, train.iris2, type = "class"))
table(test.iris2$Species, predict(iris.nn2, test.iris2, type = "class"))

## Train by SVM 1
library(e1071)

ind <- sample(2, nrow(iris), replace = T, prob = c(0.7, 0.3))
train.iris <- iris[ind == 1,]
test.iris <- iris[ind == 2,]

model <- svm(Species ~ ., data = train.iris)

print(model)

summary(model)

## Train by SVM 2

plot(cmdscale(dist(train.iris[,-5])),
     col = as.integer(train.iris[,5]),
     pch = c("o","+")[1:150 %in% model$index + 1])

pred <- predict(model, train.iris[,1:4])
table(pred, train.iris[,5])

pred2 <- predict(model, test.iris[,1:4])
table(pred2, test.iris[,5])
