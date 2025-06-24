paint <- read.csv(file.choose(), header=T)
names(paint)

plot(paint) ## see what's going on with all x/y options

## see what we can do with red on red. Looks like this will correlate well
plot(paint$RA, paint$R1)

cor(paint$RA, paint$R1)

attach(paint) ## make it easier to work with here
