Rowify =
  "
  Select State, FirstCity As City, Country, 1 as RankInState
  From Large

  Union

  Select State, SecondCity, Country, 2
  From Large

  Union

  Select State, ThirdCity, Country, 3
  From Large

  "
CapitalAndLargest =
  "
  Select Capital, State, 'Capital' As Designation
  From Government
  Where Country = 'US'

  Union

  Select FirstCity, State, 'Largest' As Designation
  From Large
  Where Country = 'US'

  Order by State
  "


sqldf(CapitalAndLargest)
