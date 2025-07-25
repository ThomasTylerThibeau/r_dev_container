#' factotum - a person who does a variety of tasks
#'
#' @param namedVector defaults to use analyze
#' @param top t most common used words
#' @param bottom b least common words (alphabetized)
#' @param hapaxLegomena shows all the unique words (obviates bottom argument)
#'
#' @returns nothing, prints a report
#' @export
#'
#' @examples
#' factotum(hapaxLegomena = FALSE)
#' factotum(c("find" = 10, "the" = 3, "top" = 2), top = 2)

factotum <- function(namedVector = analyze(), top = 10, bottom = 10, hapaxLegomena = TRUE)
{
  ## in case it needs to be established
  namedVector

  ## show the most frequent words
  salient(namedVector, show = top, common = TRUE)

  cat("\n\n")

  if (hapaxLegomena)
  {
    ## most frequently used words
    orderly <- sort(namedVector, decreasing = FALSE)
    ## and then alphabetize as a second sort
    orderly <- orderly[order(orderly, names(orderly))]

    ## check your usage
    for(i in 1:length(orderly))
    {
      key <- names(orderly)[i]
      value <- orderly[i]
      ## done
      if(value > 1){break}

      cat("word ", i, ": ", key, "\n", sep = "")
      cat("count:", value, "\n")
      cat("\n")
    }

  } ## end show the hapax legomena
  else ## only show me a few
  { salient(namedVector, show = bottom, common = FALSE) }

}
