#' @title recToPolar
#' @description converts rectangular coordinates to polar coordinates
#' @param  x, y
#' @name recToPolar
#' @usage converting coordinates
#' @keywords cartesian, polar, coordinate, remapping,
#' @return cylindrical radius, polar angle
#' @examples \dontrun
#' { recToPolar(3,4)}


recToPolar(x, y)
{
  ## arg check
  absent=c(missing(x), missing(y))
  if(sum(absent)>0)
  {
    stop(paste("You must provide at least an x and y
               measure for this function to return a coordinate."))
  } ## end missing arg check

  ## find the radius
  cr = sqrt(x**2 + y **2)
  ## do math
  pa = acos(x/cr)
  if(y < 0)
  { pa = pa + pi }

  return (c(cr, pa))
}
