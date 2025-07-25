analyze <- function(textIn = "file",
                    keepHyphens = TRUE,
                    keepContractions = TRUE)
{

  ######################## start helper functions #############################

  ## pick the file if need be, pick your nose, too!
  chooseFile <- function()
  {
    ## choose file or use path?
    path <- readline(prompt = "enter path or 'enter' to search")

    if (path == "")
    { path <- file.choose() }

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
 ## super annoying
    #cat("\n")
    #cat("into clean:", line)
    #cat("\n")


    ## does the line end in a hyphenated word? damn, work
    partialWord <- FALSE
    if (grepl("-$", line))
    { partialWord <- TRUE }

    ## no proper nouns allowed
    line <- tolower(line)

    ## apropros keep hyphy chars
    line <- gsub("[^a-z'-]", " ", line)

 ## okay WTF is going on here?
    #print("removed punctuation?")
    #print(line)

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

 ## this is annoying
    #cat("out of clean:", line)
    #cat("\n\n")


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


  ##while(TRUE)
  for (i in 1:1)
  {
    line <- readLines(text, n = 1)

    ## if the last line ended with a hyphenated word, paste it on da start
    line <- paste0(last, line)

    cat("\n")
    cat("this is line:" , line)

    ## but how does it know there are no more lines? MAGIC
    if (length(line) == 0) { break }
    else
    {
      ## lines of code where line is on line as line for line (wanna line?)
      wash <- clean(line, keepHyphens, keepContractions)

   ## wtf
      #cat("wash[1]:", wash[1])
      #cat("\nwash[2]:", wash[2])

      line <- wash[1]

      words <- unlist(strsplit(line,"\\s+"))

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

     ## print("added word")
      }


    } ## end not empty line

  } ## end while reading lines

  ## close the file, if it was a file
  if (textIn == "file") { close(text) }

## .... (turns out... I had "wordCount<- wordCount[word] + 1" replacing the entire vector....)
  ## cat("\n\nfinal vector", wordCount, "\n\n")


  return (wordCount)

} ## end readTheText

wordCnt <- analyze()



####### final thoughts, c(word, 1) 1 != integer. fix that?
