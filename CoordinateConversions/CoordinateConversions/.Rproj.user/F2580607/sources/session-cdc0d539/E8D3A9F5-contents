#' @title Magnitude
#' @description Finds the size of a line segment or vector
#' @name magnitude
#' @returns numeric representing the magnitude of line segment to point or between points
#' @keywords magnitude
#' @param ints x1, x2, y1, y2, z1, z2


magnitude <= function(x1, y1, z1 = 0, x2 = 0, y2 = 0, z2 = 0)
{
  ## arg check
  absent=c(missing(x1), missing(y1))

  if(sum(absent)>0)
  {
    stop(paste("You must provide at least an x and y
               measure for this function to return a magnitude"))
  } ## end missing arg check

  return ( sqrt((x1-x2)^2 + (y2-y1)^2 + (z1-z2)^2) )

}
