readTheText <- function(textIn = "chooseFile", keepHyphens = TRUE, keepContractions = TRUE)
{
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
    print(line)
  }
} ## end readTheText

readTheText()
