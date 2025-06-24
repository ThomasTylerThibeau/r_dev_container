library(MASS)
## idk if I need the library line in here. I wish I had time to play around...

paint <- read.csv(file.choose(), header=T)
names(paint)

plot(paint) ## see what's going on with all x/y options

## why, because AI said so and I have like 45 minutes to do this
if (!exists("paint") || !is.data.frame(paint)) {
  stop("The 'data' object does not exist or is not a data frame.")
}


columns <- colnames(paint)

## iterate over the columns
for (col in columns)
{
  if (is.numeric(paint[[col]]))
  {  # Check if the column is numeric
    for (col2 in columns)
      {
      if (is.numeric(paint[[col2]]) && col != col2)
        {  # Check if the second column is numeric and not the same as the first
        correlation_value <- cor(paint[[col]], paint[[col2]], use = "complete.obs")  # Calculate correlation
        print(paste("Correlation between", col, "and", col2, "is", correlation_value))
      }
    }
  }
}





#####################################################################
led <- read.csv(file.choose(), header=T)

plot(led$R, led$R.LED.on.)
plot(led$B, led$B.LED.on.)
plot(led$G, led$G.LED.on.)

plot(led$R, led$R.Red.)
plot(led$B, led$B.Blue.)
plot(led$G, led$G.Green.)


cor(led$R, led$R.LED.on.)
cor(led$B, led$B.LED.on.)
cor(led$G, led$G.LED.on.)

cor(led$R, led$R.Red.)
cor(led$B, led$B.Blue.)
cor(led$G,led$G.Green.)

