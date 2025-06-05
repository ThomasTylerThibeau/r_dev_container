#' @title polarToRec
#' @description converts polar coordinates to cartesian coordinates
#' @param cylindrical radius, polar angle
#' @name polarToRec
#' @usage converting coordinates
#' @keywords cartesian, polar, coordinate, remapping, radians
#' @return x, y tuple
#' @examples \dontrun
#' { polarToRec( (2 * pi)/3 , 4 )}


polarToRec <- function(cr, pa)
{
  paste("This message is to ensure that theta is in radians.
        \nIf not, run again using radians = (degrees * pi)/180")
  ## arg check
  absent=c(missing(pa), missing(cr))
  if(sum(absent)>0)
  {
    stop(paste("This function requires radius and theta to work"))
  } ## end missing arg check

  pa = normalize(pa)

  x = cr * cos(pa)
  y = cr * sin(pa)

  paste("X is: ", x, "\nY is: ", y)
  return (c(x,y))

}
