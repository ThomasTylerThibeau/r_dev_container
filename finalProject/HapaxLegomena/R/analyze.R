#' analyze - an over-the-top word frequency counter
#'
#' @param textIn
#' @param keepHyphens
#' @param keepContractions
#'
#' @returns your.variable <- c("word" = #count, "etc" = #, ...)
#' @export
#'
#' @examples
#' wordCounts <- analyze()
#' wordCounts <- analyze("don't look at this text", keepContractions=FALSE)
#' wordCounts <- analyze(textIn="don't enter file-paths yet", keepHyphens=FALSE)
#'


analyze <- function(textIn = "file",
                    keepHyphens = TRUE,
                    keepContractions = TRUE)
{

  ######################## start helper functions #############################

  ## pick the file if need be, pick your nose, too!
  chooseFile <- function()
  {
    ## choose file or use path?
    path <- readline(prompt = "enter path or 'enter' to search: ")

    if (path == "") ## else, give up.. never gotten the input line to work
    { path <- file.choose() }

    ## should likely just use file.choose() and obviate error handling
    if(!file.exists(path))
    {
      print("try again! file not found 404 SOS")
      ## try again
      chooseFile()
    } ## end while invalid file path

    ## and spit it out
    return (path)
  }


  ## clean the line, keep or remove hyphens and contractions
  clean <- function(line, hyphens, contractions)
  {
    ## does the line end in a hyphenated word? damn, work
    partialWord <- FALSE
    if (grepl("-$", line))
    {
      ## remove that hyphen
      line <- gsub("-$", "", line )

      ## declare a partial word
      partialWord <- TRUE
    }

    ## no proper nouns allowed
    line <- tolower(line)

    ## apropros keep hyphy chars
    line <- gsub("[^a-z'-]", " ", line)

    if (!contractions)
    { line <- gsub("'", " ", line) }
    else
    {
      ## it'll kill quotes and weird contractions ('bout)
      line <- gsub("' ", " ", line)
      line <- gsub(" '", " ", line)
    }

    if (!hyphens)
    { line <- gsub("-", " ", line) }

    return (c(line, partialWord))
  }

  ######################### end helper functions ##############################


  ## finding a file or using a string input?
  if(textIn == "file")
  {
    ## pick the file and verify
    path <- chooseFile()

    ## open the connection to the file
    text <- file(path, open = "r")

  } ## end if using file
  else ## for readLines to work, textConnection the string input
  { text <- textConnection(textIn) }


  ## initialize the variable to hold hyphenated end-of-liners
  last <- ""
  ## initialize a vector to hold the counts
  wordCount <- c()


  while(TRUE)
  ##for (i in 1:10)
  {
    line <- readLines(text, n = 1)

    ## but how does it know there are no more lines? MAGIC
    if (length(line) == 0) { break }
    else
    {
      ## if the last line ended with a hyphenated word, paste it on da start
      line <- paste0(last, line)
      ## don't forget to reset
      last <- ""

      ## lines of code where line is on line as line for line (wanna line?)
      wash <- clean(line, keepHyphens, keepContractions)
      ## line is now the first part of the vector
      line <- wash[1]
      ## make that it's own thing
      words <- unlist(strsplit(line,"\\s+"))


      ## the second part -> hyphenated end-of-line? T/F
      if (wash[2])
      {
        ## store the last word frag
        last <- words[length(words)]
        ## reset the line to not hold that part
        words <- words[-length(words)]
      } ## partial word saved for next line


      for (word in words) ## word
      {
        if(word %in% names(wordCount))
        { wordCount[word] <- as.numeric(wordCount[word]) + 1}
        else ## wordCount[word]++, no? 'course not
        { wordCount[word] <- 1}
      } ## end add/update words

    } ## end not empty line

  } ## end while reading lines

  ## close the file (even text entry is considered a "file")
  close(text)

  return (wordCount)

} ## end readTheText
