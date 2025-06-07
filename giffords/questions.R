## 1.) confirm all 500 orders have a first scoop
fiveHunFirstScoop =
  "
  Select count(Scoop1)
  From orders
  "

sqldf(fiveHunFirstScoop)

## 2.) site names by sales, descending
mostSales =
  "
  Select distinct Site as spot

  From orders

  order by Count(spot)

  "

sqldf(mostSales)
