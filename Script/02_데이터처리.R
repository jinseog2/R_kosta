## 69

dim(iris)
names(iris)
str(iris)

attributes(iris)

## 70

summary(iris)

range(iris$Sepal.Length)
quantile(iris$Sepal.Length)
quantile(iris$Sepal.Length, c(0.1, 0.3, 0.65))

var(iris$Sepal.Length)
hist(iris$Sepal.Length)

## 71

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

## 72

sample <- data.frame(var1 = rep(c('Male', 'Female'), 10), var2 = rep(c('A', 'B', 'C', 'D')))
example.table <- table(sample$var1, sample$var2)
example.table

data(iris)
aggregate(iris$Sepal.Length, by = list(iris$Species), FUN = 'mean')

aggregate(iris$Sepal.Length ~ iris$Species, FUN = 'mean')
aggregate(Sepal.Length ~ Species, data = iris, FUN = 'mean')
iris$letter <- letters[1:2]
aggregate(Sepal.Length ~ Species + letter, data = iris, FUN = 'mean')
aggregate(cbind(Sepal.Length, Sepal.Width) ~ Species, data = iris, FUN = 'mean')
data(iris)
aggregate(. ~ Species, data = iris, FUN = 'mean')

## 73

table(iris$Species)
pie(table(iris$Species))
barplot(table(iris$Species))

## 75

gregexpr('[a-z]', 'string 01 A')
gregexpr('[a-z0]', 'string 01 A')
gregexpr('[[:alnum:]]', 'string 01 A')
gregexpr('.', 'string 01 A')

## 76

gregexpr('\n', 'string 01 
         A')
gregexpr('[^a-z]', 'string 01 A')

gregexpr('r|n', 'string 01 A')

gregexpr('[a-z]{2,4}', 'string 01 A')

## 77

grep('tri', c('string', 'triangle'), value = T)
grep('^tri', c('string', 'triangle'), value = T)
grep('^triangle', c('string', 'triangle', 'triangles'), value = T)
grep('^triangle$', c('string', 'triangle', 'triangles'), value = T)

grep('^pri|tri', c('triangle', 'triangles', 'price', 'priority', 'string'), value = T)
grep('^(pri|tri)', c('triangle', 'triangles', 'price', 'priority', 'string'), value = T)

gregexpr('\\?', 'what is this?')

## 78

numbers <- c('+1 456-2341', '5342673', '55578274982', '74683029873', '25', '+442 5421611')
grep('^(\\+[0-9]+\\s)?[0-9]{3}\\-?[0-9]{4}$', numbers, value = T)
grep('^(\\+[0-9]+\\s)?[0-9]{3}\\-?[0-9]{4}', numbers, value = T)

example <- 'This is a text. What is this exactly? A text. Are you sure?'
greps <- gregexpr('\\s[A-Z]{1}[^\\?\\.]*\\?', example)
regmatches(example, greps)

greps <- gregexpr('\\s[A-Z]{1}.*\\?', example)
regmatches(example, greps)

## 79

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

## 80

library(plyr)
ddply(iris, .(Species), summarize, indicator1 = quantile(Sepal.Length, 0.75), indicator2 = sum(Sepal.Width)/sum(Petal.Length))
dlply(iris, .(Species), summarize, indicator1 = quantile(Sepal.Length, 0.75), indicator2 = sum(Sepal.Width)/sum(Petal.Length))

## 81

library(reshape2)
data(iris)
melt(iris)

data('iris')
m.iris <- melt(iris)
dcast(m.iris, variable ~ Species, fun.aggregate = sum)
dcast(m.iris, variable ~ Species, fun.aggregate = function(x) sum(x + 2))

class(acast(m.iris, variable ~ Species, fun.aggregate = sum))
class(dcast(m.iris, variable ~ Species, fun.aggregate = sum))

## 82

pdf('myPlot.pdf')
x <- 1:50
plot(x, log(x))
graphics.off()

write.csv(iris, file = 'iris.txt')

save(iris, file = 'iris.RData')
