#' salient - basically the opposite of quotidian
#'
#' @param namedVector defaults to analyze()
#' @param bottom number of lest-used words to show
#'
#' @returns nothing, prints a list
#' @export
#'
#' @examples
#' salient()
#' salient(bottom = 15)
#' salient(vector)

salient <- function(namedVector = analyze(), bottom = 10)
{
  ## calls analyze for the all-in-one functionality
  namedVector

  ## most frequently used words
  orderly <- sort(namedVector, decreasing = FALSE)
  ## and then alphebetize as a second sort
  orderly <- orderly[order(-orderly, names(orderly))]

  ## needs some formatting!
  for(i in 1:bottom)
  {
    key <- names(orderly)[i]
    value <- orderly[i]

    cat("word ", i, ": ", key, "\n", sep = "")
    cat("count:", value, "\n")
    cat("\n")
  }
}
