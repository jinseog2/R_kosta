## The CPI Data

year <- rep(2008:2010, each = 4)
quarter <- rep(1:4, 3)
cpi <- c(162.2,164.6,166.5,166,166.2,167,168.6,169.5,171,172.1,173.3,174)
plot(cpi, xaxt = "n", ylab = "CPI", xlab = "")
axis(1, labels = paste(year, quarter, sep = "Q"), at = 1:12, las = 3)

## Train by Linear Regression 1

cor(year, cpi)
cor(quarter, cpi)
fit <- lm(cpi ~ year + quarter)
fit

cpi2011 <- fit$coefficients[[1]]+fit$coefficients[[2]]*2011 + fit$coefficients[[3]]*(1:4)
cpi2011

# 𝑐𝑝𝑖=−7644.487500+3.887500∗𝑦𝑒𝑎𝑟+1.166667∗𝑞𝑢𝑎𝑟𝑡𝑒𝑟

## Train by Linear Regression 2

attributes(fit)

fit$coefficients

residuals(fit)

summary(fit)

## Prediction of CPIs in 2011

data2011 <- data.frame(year = 2011, quarter = 1:4)
cpi2011 <- predict(fit, newdata = data2011)
style <- c(rep(1,12), rep(2,4))
plot(c(cpi, cpi2011), xaxt = 'n', ylab = 'CPI', xlab = '', pch = style, col = style)
axis(1, at = 1:16, las = 3, labels = c(paste(year, quarter, sep='Q'), '2011Q1', '2011Q2', '2011Q3','2011Q4'))

## Generalized Linear Model
data('bodyfat', package='TH.data')
myFormula <- DEXfat ~ age + waistcirc + hipcirc + elbowbreadth + kneebreadth
bodyfat.glm <- glm(myFormula, family = gaussian('log'), data = bodyfat)
summary(bodyfat.glm)

pred <- predict(bodyfat.glm, type = 'response')
plot(bodyfat$DEXfat, pred, xlab = 'Observed', ylab = 'Prediction')
abline(a = 0, b = 1, col = 'red', lwd = 2)


## Build Logistic Regression Model

# Examine the dataset to identify potential independent variables
str(donors)

# Explore the dependent variable
table(donors$donated)

# Build the donation model
donation_model <- glm(donated ~ bad_address + interest_religion + interest_veterans, 
                      data = donors, family = "binomial")

# Summarize the model results
summary(donation_model)

## Binary Prediction

# Estimate the donation probability
donors$donation_prob <- predict(donation_model, type = "response")

# Find the donation probability of the average prospect
mean(donors$donated)

# Predict a donation if probability of donation is greater than average (0.0504)
donors$donation_pred <- ifelse(donors$donation_prob > 0.0504, 1, 0)

# Calculate the model's accuracy
mean(donors$donated == donors$donation_pred)
