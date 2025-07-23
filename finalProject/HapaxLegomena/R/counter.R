## text: defaults to chooseFile or input a string

counter <- function(textIn = chooseFile, keepHyphens = TRUE, keepContractions = TRUE)
{
  ## initialize the named vector (c(word = #count#))
  stats = c()

  ## internal helper function(s)
  count <- function(wrd)
  {
    if (wrd %in% names(stats)) ## update
    { stats[wrd] <- stats[wrd] + 1 }
    else ## create
    { stats[wrd] <- 1}
  } ## end count helper


  clean <- function(ln)
  {
    ## any punctuation with a space on either side of it must go
    ln <- gsub("\\s[[:punct:]]|[[:punct:]]\\s", " ", ln)

    ## out with ye contractions (an' what 'bout these?... an bout)
    if(!keepContractions)
    { ln <- gsub("\\b\\w*'\\w\\b", "", ln)}

    return (ln)
  } ## end clean

  ####################### end helper functions #################################

  ## finding a file or using a string input?
  if(textIn == chooseFile)
  {
    print("Please select your text file.")
    ## get the file path, open the file for reading
    file.path <- file.choose()
    file.info <- file.info(file.path)
    text <- file(file.path, "r")
  }
  else ## for readLines to work, textConnection the string input
  { text <- textConnection(textIn) }


  ## just in case a line ends in a hyphen (initialize var)
  last <- ""

  ## go over the file line by line
  while(length(line <- readLines(text, warn = FALSE)) > 0)
  {
    ## no capitals... i don't care. i am machine
    ## add the last hyphenated word maybe
    line <- paste0(last, tolower(line))

    ## wash, rinse, Repeat!
    line <- clean(line)
    line <- clean(line) ## because, what if it is double punctuated?!

    ## split line into words by white space (hyphenated words still in tact)
    words <- unlist(strsplit(line,"\\s+"))
    last <- tail(words, n = 1)

    ## does the line end in a hyphenated/truncated word?
    countLast <- TRUE
    if (substring(last, nchar(last), nchar(last)) == "-")
    {
      last = substring(last, 0, nchar(last) - 1)
      countLast <- FALSE  ## not a whole word (could be a-hole word, though)
    }
    else
    { last = "" }

    numWords <- length(words)
    onWord <- 0 ## reset the counter and limit each time... (hyphenated enders)


    ## now it can add to the dictionary, and while it's looping these words
    ## it can check for hyphenated words and split or keep them
    for (word in words)
    {
      ## skipping the last word? break out
      if(onWord == numWords && countLast == FALSE){ break }

      ## check hyphen condition
      if(!keepHyphens && grepl("-", word))
      {
        ## split the words at the hyphen
        both <- strsplit(word, "-")[[1]]
        ## now do all the dataframing for them
        for(word in both)
        { count(word) } ## end adding both words
      } ## end if no hyphenated words
      else { count(word) }

      onWord <- onWord + 1

    } ## end reading input


    ## close file if open
    if(textIn == chooseFile)
    { close(file.path) }

}
