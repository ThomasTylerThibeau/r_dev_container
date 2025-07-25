quotidian <- function(namedVector = analyze(), top = 10)
{
  ## calls analyze for the all-in-one functionality
  namedVector

  ## most frequently used words
  orderly <- sort(namedVector, decreasing = TRUE)
  ## and then alphebetize as a second sort
  orderly <- orderly[order(-orderly, names(orderly))]

  ## needs some formatting!
  for(i in 1:top)
  { print(orderly[i]) }

}

quotidian(top=20)
