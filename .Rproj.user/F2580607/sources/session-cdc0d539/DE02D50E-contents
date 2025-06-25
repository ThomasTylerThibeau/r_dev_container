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
bb2 <- lm(rgb$BA~rgb$B1, data = rgb)
summary(bb23)
## see what it looks like
plot(rgb$RA,rgb$R1)
abline(rr1, col = "red")

## lm for the linear regression
rr1 <- lm(rgb$RA~rgb$R1, data = rgb)
summary(rr1)
## see what it looks like
plot(rgb$RA,rgb$R1)
abline(rr1, col = "red")
