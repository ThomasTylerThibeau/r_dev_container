paint <- read.csv(file.choose(), header=T)
names(paint)

plot(paint) ## see what's going on with all x/y options

columns <- colnames(paint)

for(col in columns)
{
  for(col2 in columns)
  {
    if(is.numeric(col) & is.numeric(col2))
    {
      print("Correlation between",col, "and", col2, "is: ",cor(col, col2), "\n")
    }
  }
}
