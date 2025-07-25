## 1.) confirm all 500 orders have a first scoop
fiveHunFirstScoop =
  "
    SELECT
      count(Scoop1)

    FROM
      orders o
  "

sqldf(fiveHunFirstScoop)


## 2.) site names by sales, descending
mostSales =
  "
    SELECT
      l.City,
      Count(o.ID) as TotalOrders

    From
      orders o

    Join
        locations l On o.Site = l.ID

    Group By
        l.City

    Order By
        TotalOrders Desc
  "

sqldf(mostSales)


## 3.) number of each customer's purchases, by name not number
timesVisited =
  "
    SELECT
      o.Customer,
      c.Fname,
      c.Lname,
      COUNT(o.ID) AS visits

    FROM
      orders o

    JOIN
      customers c ON o.Customer = c.ID

    GROUP BY
      o.Customer, c.Fname, c.Lname

    ORDER BY
      visits DESC
  "

sqldf(timesVisited)


## 4.) which ice creams &/ toppings contain nuts
nutty =
  "
    SELECT
      f.Flavor AS Name,
      'Flavor' AS Type

    FROM
      flavors f

    WHERE
      Nuts = 'Y'

    UNION

    SELECT
      t.Name,
      'Topping' AS Type

    FROM
      toppings t

    WHERE Nuts = 'Y'

    ORDER BY Type
  "


sqldf(nutty)


## 5.) find every order with at least one topping
sunnyDays =
  "
    SELECT
      f1.Flavor AS Scoop1_Flavor,
      f2.Flavor AS Scoop2_Flavor,
      f3.Flavor AS Scoop3_Flavor,
      t1.Name AS Topping1_Name,
      t2.Name AS Topping2_Name,
      t3.Name AS Topping3_Name

    FROM
      orders o

    LEFT JOIN
      flavors f1 ON o.Scoop1 = f1.ID
    LEFT JOIN
      flavors f2 ON o.Scoop2 = f2.ID
    LEFT JOIN
      flavors f3 ON o.Scoop3 = f3.ID
    LEFT JOIN
      toppings t1 ON o.Topping1 = t1.ID
    LEFT JOIN
      toppings t2 ON o.Topping2 = t2.ID
    LEFT JOIN
      toppings t3 ON o.Topping3 = t3.ID

    WHERE
      o.Topping1 != 'NA'
  "

sqldf(sunnyDays)


## 6.) all the customers (by name) not from Maine or New Hampshire
southies =
  "
    SELECT
      c.Fname,
      c.Lname,
      c.State

    FROM
      customers c

    WHERE
      State != 'ME' and State != 'NH'
  "

sqldf(southies)  ## yay! I did one (well, 1 and 6) without AI help!

## 7.) how types of dessert and how many of each
desserts =
  "
    SELECT
      Type,
      COUNT(*) AS NumberOfFlavors

    FROM
      flavors

    GROUP BY
      Type
  "

sqldf(desserts)

## 8.) list out all of the possible orders of one, two, or three scoops.
## I'm going to take some leeway here and assume that chocolate chocolate chocolate == chocolate chocolate == chocolate
## all constitute the same order, that cherry vanilla chocolate == vanilla cherry chocolate
icecreams =
  "
    SELECT
      f.Flavor

    FROM
      flavors f

    WHERE
      Type = 'I'
  "

rtn = sqldf(icecreams)

flvrs = rtn$Flavor

for (first in flvrs)
{
  cat(first,"\n")
  for (second in flvrs)
  {
    if(!identical(first,second)) {cat(first,second,"\n")}
    for (third in flvrs)
    {
      if(!identical(first,second) && !identical(second,third) && !identical(first,third))
      {
        cat(first, second, third, "\n")
      }
    }
  }
}


## 9.) find most common flavor
topFlavors =
  "
    SELECT
      f.Flavor,
      COUNT(*) AS Count

    FROM
      orders o

    JOIN
      flavors f ON o.Scoop1 = f.ID OR o.Scoop2 = f.ID OR o.Scoop3 = f.ID

    GROUP BY
      f.Flavor

    ORDER BY
      Count DESC

    LIMIT 10
  "

sqldf(topFlavors)

topPings =
  "
    SELECT
      t.Name AS Topping,
      COUNT(*) AS Count

    FROM
      orders o

    JOIN
      toppings t ON o.Topping1 = t.ID OR o.Topping2 = t.ID OR o.Topping3 = t.ID

    GROUP BY
      t.Name

    ORDER BY
      Count DESC

    LIMIT 10
  "

sqldf(topPings)


## 10.) find all the places people came from that do not have ice cream stands
towns =
  "
    SELECT
      DISTINCT c.City

    FROM
      customers c

    WHERE
      c.City NOT IN
      (
        SELECT
          l.City FROM locations l
      )
  "

sqldf(towns)
