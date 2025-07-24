readTheText <- function(textIn = "chooseFile", keepHyphens = TRUE, keepContractions = TRUE)
{
  ## initialize the named vector (c(word = #count#))
  stats = c()

  ## internal helper function(s)
  count <- function(wrd)
  {
    if (wrd %in% names(stats)) ## update
    { stats[wrd] <- stats[wrd] + 1}
    else ## create
    { stats[wrd] <- 1}

    return (stats)
  } ## end count helper


  clean <- function(ln)
  {
    ## any punctuation with a space on either side of it must go
    ln <- gsub("\\s[[:punct:]]|[[:punct:]]\\s", " ", ln)

    ## out with ye contractions (an' what 'bout these?... an bout)
    if(!keepContractions)
    { ln <- gsub("\\b\\w*'\\w\\b", " ", ln)}

    ## filter empty lines
    lines <- lines[nzchar(lines)]

    return (ln)
  } ## end clean

  ####################### end helper functions #################################

  ## finding a file or using a string input?
  if(textIn == "chooseFile")
  {
    print("Please select your text file.")
    ## get the file path, open the file for reading
    file.path <- file.choose()

    print(file.path)

    file.info <- file.info(file.path)
    text <- file(file.path, "r")
  }
  else ## for readLines to work, textConnection the string input
  { text <- textConnection(textIn) }


  ## just in case a line ends in a hyphen (initialize var)
  last <- ""

  lines <- readLines(text)

  for(line in lines)
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

    ## print(last)

    if(nzchar(last))
    {
      if (grep("-$", last))
      {
        last = substring(last, 0, nchar(last) - 1)
        countLast <- FALSE  ## not a whole word (could be a-hole word, though)
      }
    }

    numWords <- length(words)
    onWord <- 0 ## reset the counter and limit each time... (hyphenated enders)


    ## now it can add to the dictionary, and while it's looping these words
    ## it can check for hyphenated words and split or keep them
    for (word in words)
    {
      ## track the word it's on (one-indexed language, intuitive yet a pain)
      onWord <- onWord + 1

      ## skipping the last word? break out
      if(onWord == numWords && countLast == FALSE){ break }

      ## if it needs to split hyphenated words (AND the word has a hyphen)
      if(!keepHyphens && grepl("-", word))
      {
        ## split the words at the hyphen
        both <- strsplit(word, "-")[[1]]
        ## now do all the dataframing for them
        for(part in both)
        { count(part) } ## add/update words (count can figure it out)
      } ## otherwise, count the word as it is
      else { count(word) }


    } ## end add words

  } ## end line in lines



  ## close file if open
  if(textIn == "chooseFile")
  { on.exit(close(text)) }

  return (c(stats))

} ## end readTheText

r = readTheText()
