##
## when done -> code > insert roxygen skeleton (ctrl + alt + shift + r)
##
## add the shit up here
##



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
