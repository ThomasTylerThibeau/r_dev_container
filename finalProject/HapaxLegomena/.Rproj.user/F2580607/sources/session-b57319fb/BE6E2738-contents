counter <- function(keepHyphens = TRUE, keepContractions = TRUE)
{
  print("Please select your text file.")

  file.path <- file.choose()
  file.info <- file.info(file.path)
  text <- file(file.path, "r")

  counts <- data.frame(word = c(), count=c(), length=c())
  last <- "" ## just in case a line ends in a hyphen

  ## go over the file line by line
  while(length(line <- readLines(text, warn = FALSE)) > 0)
  {
    ## no capitals... i don't care. i am machine
    ## add the last hyphenated word maybe
    line <- paste0(last, tolower(line))


    ## any punctuation with a space on either side of it must go
    ouTxt <- gsub("\\s[[:punct:]]|[[:punct:]]\\s", " ", text)
    ## well, what if it has double punctuation!?
    ouTxt <- gsub("\\s[[:punct:]]|[[:punct:]]\\s", " ", text)
    ## extra whitespace?

    if(!keepContractions) ## out with ye contractions (an' what 'bout these?... an bout)
    { ouTxt <- gsub("\\b\\w*'\\w\\b", "", text)}

    ## split line into words by whitespace (hyphenated words still in tact)
    words <- unlist(strsplit(line,"\\s+"))
    last <- tail(words, n = 1)

    countLast <- TRUE
    ## what if the string ends on a hyphen? well... fuck
    if (substring(last, nchar(last), nchar(last)) == "-")
    {
      last = substring(last, 0, nchar(last) - 1)
      countLast <- FALSE  ## not a whole word (could be a-hole word, though)
    }
    else
    {
      last = ""
    }

    numWords <- length(words)
    onWord <- 0 ## reset the counter and limit each time... (hyphenated enders)

    ## now it can add to the dictionary, and while it's looping these words
    ## it can check for hyphenated words and split or keep them
    for (word in words)
    {
      ## skipping the last word? break out
      if(onWord == numWords && countLast == FALSE){ break }

      ## check hyphen condition
      if(!keepHyphens)
      {

      }

      onWord <- onWord + 1
    }









    ## and the trickier text cleaning
    striPunc <- function(txt, hyphen, contraction)
    {
      ## any punctuation with a space on either side of it must go
      ouTxt <- gsub("\\s[[:punct:]]|[[:punct:]]\\s", " ", text)
      ## well, what if it has double punctuation!?
      ouTxt <- gsub("\\s[[:punct:]]|[[:punct:]]\\s", " ", text)
      ## extra whitespace?

      if(!contraction) ## out with ye contractions (an' what 'bout these?... an bout)
      { ouTxt <- gsub("\\b\\w*'\\w\\b", "", text)}



      ## well, we need to stop this because if the last word ends in a long-
      ## er word, then we'll have to do some extra shit to ensure that word
      ## is preserved like some raspberry jambs, yo
      ## what about hyphens?


      ## okay
    } ## end striPunc

  } ## end while in text


}


