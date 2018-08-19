## 11

set.seed(8953)
iris2 <- iris
iris2$Species <- NULL
(kmeans.result <- kmeans(iris2, 3))

## 12

table(iris$Species, kmeans.result$cluster)

plot(iris2[c("Sepal.Length", "Sepal.Width")], col=kmeans.result$cluster)
points(kmeans.result$centers[,c("Sepal.Length", "Sepal.Width")], col = 1:3, pch = 8, cex = 2)

## 15

library(fpc)
pamk.result <- pamk(iris2)

pamk.result$nc

table(pamk.result$pamobject$clustering, iris$Species)

## 16

layout(matrix(c(1,2), 1, 2))
plot(pamk.result$pamobject)
layout(matrix(1))

## 17

library(cluster)

pam.result <- pam(iris2, 3)
table(pam.result$clustering, iris$Species)

## 18

layout(matrix(c(1,2), 1, 2))
plot(pam.result)
layout(matrix(1))

## 21

set.seed(2835)

idx <- sample(1:dim(iris)[1], 40)
irisSample <- iris[idx,]

irisSample$Species <- NULL

hc <- hclust(dist(irisSample), method = 'ave')

hc

## 22

plot(hc, hang = -1, labels = iris$Species[idx])

rect.hclust(hc, k = 3)

groups <- cutree(hc, k =3)
