library(MASS)
## first part, use the RGB file
rgb = read.csv(file.choose(), header=T)

columns = names(rgb)
columns
## [1] "ColorID"   "ColorName" "RA"        "GA"        "BA"        "R1"        "G1"        "B1"
## [9] "R2"        "G2"        "B2"

## lm for the linear regression
rr1 <- lm(rgb$RA~rgb$R1, data = rgb)
summary(rr1)
## see what it looks like
plot(rgb$RA,rgb$R1)
abline(rr1, col = "red")
