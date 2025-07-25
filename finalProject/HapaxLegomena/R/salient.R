#' salient - basically the opposite of quotidian
#'
#' @param namedVector defaults to analyze()
#' @param bottom number of lest-used words to show
#' @param common display frequent words? (T/F)
#'
#' @returns nothing, prints a list
#' @export
#'
#' @examples
#' salient()
#' salient(bottom = 15)
#' salient(vector)

salient <- function(namedVector = analyze(), show = 10, common = FALSE)
{
  ## calls analyze for the all-in-one functionality
  namedVector

  ## most frequently used words
  orderly <- sort(namedVector, decreasing = common)
  ## and then alphebetize as a second sort
  orderly <- orderly[order(-orderly, names(orderly))]

  if(common)
  { cat(show, "most commonly used words:") }
  else
  { cat(show, "least frequently used words:")}
  ## needs some formatting!
  for(i in 1:show)
  {
    key <- names(orderly)[i]
    value <- orderly[i]

    cat("word ", i, ": ", key, "\n", sep = "")
    cat("count:", value, "\n")
    cat("\n")
  }
}
