counter <- function(keepHyphens = TRUE, keepContractions = TRUE)
{
  print("Please select your text file.")

  file.path <- file.choose()
  file.info <- file.info(file.path)
  text <- file(file.path, "r")

  while(length(line <- readLines(text, warn = FALSE)) > 0)
  {
    ## no capitals... i don't care
    line <- tolower(line)

    ## and the trickier text cleaning
    striPunc <- function(txt, hyphen, contraction)
    {
      ## any punctuation with a space on either side of it must go
      ouTxt <- gsub("\\s[[:punct:]]|[[:punct:]]\\s", " ", txt)
      ## well, what if it has double punctuation!?
      ouTxt <- gsub("\\s[[:punct:]]|[[:punct:]]\\s", " ", txt)


      if(!contraction)
      { ouTxt <- gsub("'", "", txt)}


      ## well, we need to stop this because if the last word ends in a long-
      ## er word, then we'll have to do some extra shit to ensure that word
      ## is preserved like some raspberry jambs, yo
      ## what about hyphens?
      if(!hyphen) ## out with ye contractions (an' what 'bout these?... an bout)
      { ouTxt <- gsub("\\b\\w*'\\w\\b", "", txt)}

      ## okay
    } ## end striPunc

  }


}
