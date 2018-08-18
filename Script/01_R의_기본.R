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
