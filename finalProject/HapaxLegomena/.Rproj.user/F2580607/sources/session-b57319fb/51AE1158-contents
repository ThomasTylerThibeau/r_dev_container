analyze <- function(textIn = "file",
                    keepHyphens = TRUE,
                    keepContractions = TRUE)
{

  ## pick the file if need be, pick your nose, too!
  chooseFile <- function()
  {
    ## choose file or use path?
    path <- readline(prompt = "enter path or 'enter' to search")

    if (path == "")
    { path <- file.choose() }

    ## and spit it out
    return (path)
  }


  clean <- function(line, hyphens, contractions)
  {
    ## no proper nouns allowed
    line <- tolower(line)

    ## apropros keep hyphy chars
    line <- gsub("[^a-z-']", " ", line)

    if (!contractions) ## if no contractions, replace 'em with spaces
    { line <- gsub("(?<=\\w)'(?=\\w)", " ", line, perl = TRUE)    }
    else
    { line <- gsub("(?<!\\w)'|'(?!\\w)", " ", your_string, perl = TRUE)}

    if (!hyphens)
    { line <- gsub("-", " ", line) }

    # Use gsub with regex to replace apostrophes between letters
    # The pattern "(?<=\\w)'(?=\\w)" matches an apostrophe between word characters
    modified_text <- gsub("(?<=\\w)'(?=\\w)", "", text, perl = TRUE)

    ## does the line end in a hyphenated word? damn, work
    partialWord <- FALSE
    if (grepl("-$", line))
    { partialWord <- TRUE }

    return (c(line, partialWord)
  }

  ######################### end helper functions ##############################

  ## finding a file or using a string input?
  if(textIn == "file")
  {
    ## pick the file and verify
    path <- chooseFile()

    ## no good?
    while(!file.exists(path))
    {
      print("try again! file not found 404 SOS")
      path <- chooseFile()
    } ## end while invalid file path

    ## open the connection to the file
    text <- file(path, open = "r")

  } ## end if using file
  else ## for readLines to work, textConnection the string input
  { text <- textConnection(textIn) }

  stats <- data.frame(word = )

  ## initialize the variable to hold hyphenated end-of-liners
  last <- ""
  while(TRUE)
  {
    line <- readLines(text, n = 1)

    ## if the last line ended with a hyphenated word, paste it on da start
    line <- paste0(last, line)

    ## but how does it know there are no more lines? MAGIC
    if (length(line) == 0) { break }

    ## lines of code where line is on line as line for line (wanna line?)
    wash <- clean(line, keepHyphens, keepContractions)

    line <- wash[1]

    words <- unlist(strsplit(line,"\\s+"))
    if (wash[2])
    {
      last <- words[length(words)]
    }




  } ## end while reading lines

  ## close the file, if it was a file
  if (textIn == "file") { close(text) }
} ## end readTheText

analyze()
