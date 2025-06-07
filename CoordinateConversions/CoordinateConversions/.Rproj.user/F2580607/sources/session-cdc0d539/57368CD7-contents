script =
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

sqldf(script)
