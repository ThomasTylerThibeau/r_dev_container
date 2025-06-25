library(MASS)
## first part, use the RGB file
rgb = read.csv(file.choose(), header=T)

columns = names(rgb)
columns
## [1] "ColorID"   "ColorName" "RA"        "GA"        "BA"        "R1"        "G1"        "B1"
## [9] "R2"        "G2"        "B2"

## so the regression line is there on one of them, but it looks WAY off, and
## thus it's out of frame for most of the plots

## lm for the linear regression
rr1 <- lm(rgb$RA~rgb$R1, data = rgb)
summary(rr1)
## see what it looks like
plot(rgb$RA,rgb$R1)
abline(rr1, col = "red")

## lm for the linear regression
rr2 <- lm(rgb$RA~rgb$R2, data = rgb)
summary(rr2)
## see what it looks like
plot(rgb$RA,rgb$R2)
abline(rr2, col = "red")

## lm for the linear regression
r1r2 <- lm(rgb$R1~rgb$R2, data = rgb)
summary(r1r2)
## see what it looks like
plot(rgb$R1,rgb$R2)
abline(r1r2, col = "red")


## lm for the linear regression
gg1 <- lm(rgb$GA~rgb$G1, data = rgb)
summary(gg1)
## see what it looks like
plot(rgb$GA,rgb$G1)
abline(gg1, col = "green")

## lm for the linear regression
gg2 <- lm(rgb$GA~rgb$G2, data = rgb)
summary(gg2)
## see what it looks like
plot(rgb$RA,rgb$R1)
abline(rr1, col = "green")

## lm for the linear regression
g1g2 <- lm(rgb$G1~rgb$G2, data = rgb)
summary(g1g2)
## see what it looks like
plot(rgb$G1,rgb$G2)
abline(g1g2, col = "green")


## lm for the linear regression
bb1 <- lm(rgb$BA~rgb$B1, data = rgb)
summary(bb1)
## see what it looks like
plot(rgb$BA,rgb$B1)
abline(bb1, col = "blue")

## lm for the linear regression
bb2 <- lm(rgb$BA~rgb$B2, data = rgb)
summary(bb2)
## see what it looks like
plot(rgb$BA,rgb$B2)
abline(bb2, col = "blue")

## lm for the linear regression
b1b2 <- lm(rgb$B1~rgb$B2, data = rgb)
summary(b1b2)
## see what it looks like
plot(rgb$B1,rgb$B2)
abline(b1b2, col = "blue")

## polynomial regressions
## model <- lm(y ~ poly(x, degree), data)
polyRR1 <- lm(R1 ~ poly(RA, 2), data = rgb)

## plot the points
plot(rgb$RA, rgb$R1, main = "RA ~ R1", xlab = "RA", ylab = "R1", pch = 19)

# Create a sequence of values for R1 to predict RA
x_seq <- seq(min(rgb$RA), max(rgb$RA), length.out = 100)

# Predict RA values using the polynomial regression model
predicted_y <- predict(polyRR1, newdata = data.frame(RA = x_seq))

# Add the polynomial fit to the plot
lines(x_seq, predicted_y, col = "red", lwd = 2)

## set the colors and make a vector to iterate over those vectors
reds = c('RA', 'R1', 'R2')
grns = c('GA', 'G1', 'G2')
blus = c('BA', 'B1', 'B2')
clrs = c(reds, grns, blus)

## loop over the vectors in the clrs matrix thingy
for(color in clrs)
{
  ## set up the pairs of colors
  one = c(color[1], color[2])
  two = c(color[1], color[3])
  thr = c(color[2], color[3])




}



## logistic regressions (this doesn't look logrithmic but we'll try it out)
## model <- lm(dependent_variable ~ poly(independent_variable, degree), data = your_data)



## all of these require other libraries and it feels like more work than this is worth
## ridge regression
#library(glmnet)
#model <- glmnet(as.matrix(your_data[, -1]), your_data$dependent_variable, alpha = 0)
## lasso regression
#model <- glmnet(as.matrix(your_data[, -1]), your_data$dependent_variable, alpha = 1)
## elastic net
#model <- glmnet(as.matrix(your_data[, -1]), your_data$dependent_variable, alpha = 0.5)
## generalized additive models (GAM)
#library(mgcv)
#model <- gam(dependent_variable ~ s(independent_variable), data = your_data)
## survival regression
#library(mgcv)
#model <- gam(dependent_variable ~ s(independent_variable), data = your_data)
## quantile regression
#library(quantreg)
#model <- rq(dependent_variable ~ independent_variable, data = your_data)
