crossroads =
"
Select Capital, State
From Government

Intersect

Select FirstCity, State
From Large


"

simple =
  "
  Select State, Country
  From Government
  Where LowerHouse = UpperHouse
  "

complex =
  "
  select State
  from Government
  where LowerHouse = 'R'

  Intersect

  select State
  from Government
  where UpperHouse = 'R'

  union
  select State
  from Government
  where LowerHouse = 'D'

  Intersect

  select State
  from Government
  where UpperHouse = 'D'
  "

lowercaseNotCapital =
  "
  Select City, State
  From TicketToRide

  Except

  Select Capital, State
  From Government

  order by state
"


sqldf(lowercaseNotCapital)
