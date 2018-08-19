## View

dim(iris)
names(iris)
str(iris)

attributes(iris)

## Explore

summary(iris)

range(iris$Sepal.Length)
quantile(iris$Sepal.Length)
quantile(iris$Sepal.Length, c(0.1, 0.3, 0.65))

var(iris$Sepal.Length)
hist(iris$Sepal.Length)

## sorting

vec1 <- c(3, 2, 5, 1, 4)
sort(vec1)
sort(c(T, T, F, F))
sort(c('play', 'plan', 'plot', 'proof'))

vec1 <- c(3, 2, 5, 1, 4)
order(vec1)

vec1[order(vec1)]
vec1 <- c(3, 2, 5, 1, 4)
vec2 <- c(2, 2, 3, 3, 1)
order(vec2, vec1, decreasing = c(T, F))
order(vec2, vec1, decreasing = c(F, T))

data('iris')
names(iris)
iris.ordered <- iris[order(iris$Sepal.Length, iris$Sepal.Width), ]

## apply function

sample.list <- list(a = runif(100, 0, 1), b = runif(500, 0, 100), c = runif(35, 0, 200))
sapply(sample.list, quantile, probs = 0.75)
sapply(sample.list, function(x) round(sum(x + 2)))
sapply(sample.list, function(x) quantile(x, probs = 0.75))
vapply(sample.list, quantile, probs = 0.75, c('Mean' = 0))
lapply(sample.list, quantile, probs = 0.75)

x <- as.numeric(c(1:2000000))
ptm <- proc.time()
for (i in x) x[i] <- x[i] * x[i]
proc.time() - ptm
       
ptm <- proc.time()
x <- sapply(x, function(x) x * x)
proc.time() - ptm
            
## rbind

rbind(c(1, 2, 3), c(4, 5, 6))
rbind(c(1, 2, 3), c(4, 5))    # 오류
rbind(c(1, 2, 3), c(4, 5, ))  # 오류
rbind(c(1, 2, 3), c(4, 5, NA))

x <- data.frame(id = c(1, 2), name = c('a', 'b'))
x
y <- rbind(x, c(3, 'c'))  ## 오류 요인 수준 다름
y <- rbind(x, c(3, 'b'))
y

x <- data.frame(id = c(1, 2), name = c('a', 'b'), stringsAsFactors = F)
y <- rbind(x, c(3, 'c'))
y

## cbind
            
cbind(c(1,2,3), c(4,5,6))

x <- data.frame(id = c(1, 2), name = c('a', 'b'), stringsAsFactors = F)
y <- cbind(x, greek = c('alpha', 'beta'))
y
summary(y)
y <- cbind(x, greek = c('alpha', 'beta'), stringsAsFactors=F)
y
summary(y)

y$korean <- c('ㄱ', 'ㄴ')
y
summary(y)
            
## merge
            
x <- data.frame(names=c('a','b','c'), math=c(40,50,70))
y <- data.frame(names=c('a','b','c'), english=c(60,40,80))
merge(x, y)
cbind(x, y)

y <- data.frame(names=c('a','b','c', 'd'), english=c(60,40,80,90))
merge(x, y)
merge(x, y, all=T)
            
## split, subset
            
idx <- sample(2, nrow(iris), replace = T, prob = c(0.3, 0.7))
idx
split(iris[idx==1,], iris[idx==1,]$Species)

subset(iris, Species == 'setosa')
subset(iris, Species == 'setosa' & Sepal.Length > 5.1)
subset(iris, select = c(Sepal.Length, Species), Species == 'setosa' & Sepal.Length > 5.1)
subset(iris, select = -c(Sepal.Length, Species), Species == 'setosa' & Sepal.Length > 5.1)
         
## which
            
iris$Sepal.Length > 6.0
which(iris$Sepal.Length > 6.0)
iris[which(iris$Sepal.Length > 6.0),]

which.min(iris$Sepal.Length)
iris[which.min(iris$Sepal.Length),]

which.max(iris$Sepal.Length)
iris[which.max(iris$Sepal.Length),]            
            
## plyr

library(plyr)
ddply(iris, .(Species), summarize, indicator1 = quantile(Sepal.Length, 0.75), indicator2 = sum(Sepal.Width)/sum(Petal.Length))
dlply(iris, .(Species), summarize, indicator1 = quantile(Sepal.Length, 0.75), indicator2 = sum(Sepal.Width)/sum(Petal.Length))

## reshape2

library(reshape2)
data(iris)
melt(iris)

data('iris')
m.iris <- melt(iris)
dcast(m.iris, variable ~ Species, fun.aggregate = sum)
dcast(m.iris, variable ~ Species, fun.aggregate = function(x) sum(x + 2))

class(acast(m.iris, variable ~ Species, fun.aggregate = sum))
class(dcast(m.iris, variable ~ Species, fun.aggregate = sum))
      
## aggregate
      
aggregate(Sepal.Width ~ Species, iris, mean)
testDF <- data.frame(v1 = c(1,3,5,7,8,3,5,NA,4,5,7,9),
                     v2 = c(11,33,55,77,88,33,55,NA,44,55,77,99) )
by1 <- c("red", "blue", 1, 2, NA, "big", 1, 2, "red", 1, NA, 12)
by2 <- c("wet", "dry", 99, 95, NA, "damp", 95, 99, "red", 99, NA, NA)
aggregate(x = testDF, by = list(by1, by2), FUN = "mean")      
      
## table
      
table(by1, by2)
iris.Species.sample <- sample(iris$Species)
table(iris$Species, iris.Species.sample)
      
## summary chart
      
table(iris$Species)
pie(table(iris$Species))
      
barplot(table(iris$Species))      

## save to files

pdf('myPlot.pdf')
x <- 1:50
plot(x, log(x))
graphics.off()

write.csv(iris, file = 'iris.txt')

save(iris, file = 'iris.RData')
