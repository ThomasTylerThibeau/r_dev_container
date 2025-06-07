install.packages('sqldf')
library('sqldf')

locations = read.csv(file.choose(), header=T)
customers = read.csv(file.choose(),header=T)
flavors = read.csv(file.choose(),header=T)
orders = read.csv(file.choose(),header=T)
toppings = read.csv(file.choose(),header=T)
