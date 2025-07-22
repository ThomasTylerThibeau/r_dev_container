#' @title Test Text to Try Thomas Tyler Thibeau's Thing
#' @description Serves mostly to organize my thoughts and to try the app out
#' @name TestText
#' @docType .txt
#' @usage TestText
#' @format text-file
#' @keywords test
#' @param <none>


NULL

## get the filepath from
## HapaxLegomena/R/TestText.R -> HapaxLegomena/textFiles/TestText.txt
path <- system.file("textFiles", "TestText.txt", package="HapaxLegomena")

## read the file
if(file.exists(path)){
  redlines = readLines(path)
} else {
  stop("Shit... something fucked up.")
} ## gawdy... I hate the unaligned brackets. ugly ugly ugly

## now we create a wordcount for all the words
