quotidian <- function(namedVector = analyze(), top = 10, bottom = 10, hapaxLegomena = TRUE)
{
  ## in case it needs to be established
  namedVector

  ## show the most frequent words
  salient(namedVector, show = top, common = TRUE)

  cat("\n\n")

  salient(namedVector, show = bottom, common = FALSE)

  cat("\n\n")

  if (hapaxLegomena)
  {
    ## most frequently used words
    orderly <- sort(namedVector, decreasing = FALSE)
    ## and then alphabetize as a second sort
    orderly <- orderly[order(-orderly, names(orderly))]



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

}
