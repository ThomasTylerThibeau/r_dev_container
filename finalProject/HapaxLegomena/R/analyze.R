analyze <- function(textIn = "file", keepHyphens = TRUE, keepContractions = TRUE)
{

  ## pick the file if need be, pick your nose, too!
  chooseFile <- function()
  {
    ## choose file or use path?
    path <- readline(prompt = "enter the file path if you know it
                               (or hit enter to search): \n")
    if (path == "")
    { path <- file.choose() }
    ## and spit it out
    return (path)
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

  while(TRUE)
  {
    line <- readLines(text, n = 1)

    ## but how does it know there are no more lines? MAGIC
    if (length(line) == 0) { break }

    print(line)

  } ## end while reading lines

  ## close the file, if it was a file
  if (textIn == "file") { close(text) }
} ## end readTheText

analyze()
