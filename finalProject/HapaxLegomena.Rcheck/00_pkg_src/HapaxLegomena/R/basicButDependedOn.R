minmax <- function(x, ...){
  c(Min = min(x, ...), Max = max(x, ...))
}
## basic function that is seen as a dependency of others
## ... allows the user to add their own arguments


## this actually has nothing to do with the package, but I learned about
## testing functions that are depended on, and felt I should put it to use
## and perhaps down the line do this for something else in the package, maybe
