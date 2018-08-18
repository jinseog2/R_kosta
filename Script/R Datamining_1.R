## 함수

var1 <- sum(c(4, 3, 2))
var1

var2 <- cat(9)
var2

test.function <- function(a, b, c){
  result <- (a * b) + c
  return(result)
}
test.function(2, 3, 1)

## 변수

var1 <- 10
var1
class(var1)

var1 <- 'a string'
var1
class(var1)

## Vectors

aaa <- numeric(length = 5)
aaa[1] <- 6
aaa[2] <- 2
class(aaa)
aaa[3] <- 'a string'
class(aaa)
aaa[1] - aaa[2]

## Lists

aaa <- list()
aaa[1] <- 4
aaa[2] <- 5
aaa[3] <- 'a string'
aaa
aaa[[2]] - aaa[[1]]

## Matrix and array

numeric.vector <- 1:20
attr(numeric.vector, 'dim') <- c(10, 2)
class(numeric.vector)

numeric.vector <- 1:20
numeric.vector <- matrix(numeric.vector, 10, 2)
class(numeric.vector)

## Data frmes

numeric.vector <- 1:5
character.vector <- letters[1:5]
class(numeric.vector)
class(character.vector)
df <- data.frame(numeric.vector, character.vector)
class(df)

## Factors

animals <- c('dog', 'cat', 'dog', 'horse')
class(animals)
animals

animals <- as.factor(animals)
animals
cat(animals)

as.character(animals)
as.numeric(animals)

factor(animals, levels = c("horse", "dog", "cat"))

factor(animals, levels = c("horse", "dog", "cat"), ordered = T)

## names

Poker_vector <- c(40, 150, -30, 20, -240)
names(Poker_vector)

names(Poker_vector) <- c(‘Monday’, ‘Tuesday’, ‘Wednesday’,’Thursday’, ‘Friday’)
names(Poker_vector)

## +, -

VecA <- c(1, 2, 3)
VecB <- c(4, 5, 6)

Total_vec <- VecA + VecB
Total_vec

Diff_vec <- VecA – VecB
Diff_vec

## *, /, %/%, %%

VecA <- c(1, 2, 3)
VecB <- c(4, 5, 6)

Mul_vec <- VecB * VecA
Mul_vec

Div_vec <- VecB / VecA
Div_vec

Qu_vec <- VecB %/% VecA
Qu_vec

Re_vec <- VecB %% VecA
Re_vec

## sum, mean

Poker_vector <- c(40, 150, -30, 20, -240)

TotalPoker <- sum(Poker_vector)
TotalPoker

MeanPoker <- mean(Poker_vector)
MeanPoker

## *, / 

x <- matrix(c(1:9), ncol = 3)
x

x * 2
x / 2

## +, - 

y <- matrix(c(9:1), nrow = 3)
x + y
x - y

## %*%

x %*% y
x[1,1] * y[1,1] + x[1,2] * y[2,1] + x[1,3] * y[3,1]
1 * 9 + 4 * 8 + 7 * 7

## ncol( ), nrow( )

x <- matrix(c(1:9), ncol=3)
x
t(x)

ncol(x)
nrow(x)

## Vector selection

LETTERS[c(1, 5, 6)]
LETTERS[-c(1, 5, 6)]
rev(LETTERS)

aaa <- 1:10
names(aaa) <- letters[1:5]
names(aaa)
aaa[c('a', 'c', 'e')]

aaa <- 1:5
aaa[c(T, F, F, T, T)]

aaa[c(T, F)]
aaa[c(F, T)]

aaa <- LETTERS
aaa[50]

aaa <- 1:10
names(aaa) <- LETTERS[1:10]
aaa['Z']

## Array selection

aaa <- matrix(1:16, 4, 4)
aaa
aaa[c(1,3), c(2,4)]
aaa[5]

dimnames(aaa) <- LETTERS[1:4]
dimnames(aaa)[[1]] <- LETTERS[1:4]
aaa

dimnames(aaa)[[2]] <- letters[1:4]
aaa
row.names(aaa) <- LETTERS[1:4]
colnames(aaa) <- letters[1:4]

aaa[c('A', 'C'), c('a', 'd')]
aaa[1:2,]

## List selection

list.ex <- list(a = c(1, 2, 3), b = c('a', 'b', 'c'), c = list(var1 = 'a', var2 = 'b'))
class(list.ex[2])
class(list.ex[[2]])
list.ex[['b']]
list.ex[[1:3]]
list.ex$a

## Data frame selection

test.data.frame <- data.frame(Var1 = 1:10, Var2 = LETTERS[1:10])
test.data.frame$Var1
test.data.frame[['Var1']]
test.data.frame[[1]]

test.data.frame[5, 1]
test.data.frame[5, 'Var1']
test.data.frame[5, c(T, F)]

subset(test.data.frame, Var1 >= 8)

test.data.frame <- data.frame(Var1 = 1:10, Var2 = LETTERS[1:10], Var3 = LETTERS[11:20])
subset(test.data.frame, Var1 >= 8, select = c(Var1, Var3))

subset(test.data.frame, Var1 >= 8, select = -Var2)

idx <- which(test.data.frame$Var1 >= 8)
test.data.frame[idx, ]

## if else, while

a <- 5
if (a > 0) {print ('a is greater than 0')} else
{print ('a is smaller than 0')}

a <- 10
if (a < 0) {
  print ('a is smaller than 0')} else if (a >= 0 & a <= 5)
  {print ('a is between 0 and 5')} else
  {print ('a is greater than 10')}

if (a < 0) {print ('a')}
else {print ('b')}

if (a < 0) {print ('a')
  } else {print ('b')}

a <- 1
while (a < 4) {
  print (paste ('This is iteration', a))
  a <- a + 1
}

## for, switch

vector <- c('aaa', 'bbb', 'ccc')
for (i in vector) {
  print(i)
}

num <- c(1:3)
for (i in num) {
  print (i + 1)
}

inp <- 'b'  
switch(inp, 
       a = print ('inp is a'), 
       b = print ('inp is b'),
       c = print ('inp is c'))

inp <- 'd'
switch(inp, 
       a = print ('inp is a'), 
       b = print ('inp is b'),
       c = print ('inp is c'),
       print ('inp is not a, b, c'))

inp <- 1
switch(inp,
       1 = print (inp + 1))

inp <- 1
switch(inp,
       '1' = print (inp + 1),
       print ('none'))

inp <- 2
switch(inp, 'inp+1', 'inp+2', 'inp+3', 'inp+4')

## Reading csv

path <- 'https://archive.ics.uci.edu/ml/machine-learning-databases/iris/iris.data'
data <- read.table(path, sep=',')
class(data)

data <- readLines(path)
class(data)
length(data)

data <- readChar(path, nchars = 1e5)
class(data)
length(data)

## Reading JSON, XML

library(RJSONIO)
url <- 'http://api.worldbank.org/v2/datacatalog?format=json'
json <- fromJSON(url)

library(rjson)
url <- 'http://api.worldbank.org/v2/datacatalog?format=json'
raw.json <- readChar(url, nchars = 1e6)
json <- fromJSON(raw.json)

library(XML)
url <- 'http://api.worldbank.org/v2/datacatalog?format=xml'
xml.obj <- xmlTreeParse(url)
class(xml.obj)

## Reading Excel

#install.packages('openxlsx')
library(openxlsx)

## 엑셀 파일 입력
xlsxFile <- "https://github.com/awalker89/openxlsx/raw/master/inst/readTest.xlsx"
xlsx.data <- read.xlsx(xlsxFile)
View(xlsx.data)

## 엑셀 파일 출력
## 오류 : write.xlsx(data.csv, file='iris.R.xlsx')
## Rtools 필요

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

