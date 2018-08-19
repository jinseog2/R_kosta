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
            
## dplyr 1
  
library(dplyr)

data('iris')
iris %>%  filter(Species == "setosa")
iris %>%  filter(Sepal.Length > 7)
iris %>%  filter(Sepal.Length > 6) %>% filter(Sepal.Width > 3.5)
iris %>%  filter(Sepal.Length > 6 & Sepal.Width > 3.5)
iris %>%  filter(Sepal.Length > 6 | Sepal.Width > 3.5)

iris %>% filter(Species == "setosa" | Species == "virginica")
iris %>% filter(Species %in% c("setosa", "virginica"))
            
## dplyr 2
            
iris %>% select(Species)
iris %>% select(Sepal.Length, Petal.Length, Species)

iris %>% select(-Species)
iris %>% select(-Sepal.Length, -Sepal.Width)

iris %>% select(Sepal.Length, Species) %>% 
  filter(Species == "setosa" & Sepal.Length > 5.4)

iris %>% select(Sepal.Length, Species) %>% 
  filter(Species == "setosa" & Sepal.Length > 4) %>%
  head
            
## dplyr 3
            
# 정렬하기
iris %>% arrange(Sepal.Length)
iris %>% arrange(desc(Sepal.Length))
iris %>% arrange(Sepal.Length, Sepal.Width)

# 파생변수 추가하기
iris %>% 
  mutate(Sepal.total = Sepal.Length + Sepal.Width) %>% 
  head

iris %>% 
  mutate(Sepal.total = Sepal.Length + Sepal.Width,
         Petal.mean = (Petal.Length + Petal.Width)/2) %>% 
  head

iris %>% 
  mutate(Size = ifelse(Sepal.Length >= 6, "big", "small")) %>% 
  head

## 요약하기
            
iris %>% summarise(Sepal.Length.mean = mean(Sepal.Length))

iris %>% group_by(Species) %>% 
  summarise(Sepal.Length.mean = mean(Sepal.Length))

iris %>% group_by(Species) %>% 
  summarise(Sepal.Length.mean = mean(Sepal.Length),
            Sepal.Length.sum = sum(Sepal.Length),
            Sepal.Length.median = median(Sepal.Length),
            Sepal.Length.max = max(Sepal.Length),
            n = n())

mpg <- ggplot2::mpg
View(mpg)
mpg %>% group_by(manufacturer, drv) %>% 
  summarise(mean_cty = mean(cty)) %>%
  head
     
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
