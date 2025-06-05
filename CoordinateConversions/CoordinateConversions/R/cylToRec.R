#' @title cylToRec
#' @description function converts from theta, radius, z cylindrical coordinates to x, y, z coordinates
#' @param cylindrical radius, polar angle, z
#' @name cylToRec
#' @usage converting coordinates
#' @keywords cartesian, polar, coordinate, remapping, radians
#' @return x, y, z tuple


cylToRec <= function(cr, pa, z = 0)
{
  ## arg check
  absent=c(missing(pa), missing(cr))

  if(sum(absent)>0)
  {
    stop(paste("This function requires at least theta & radius input to return a value."))
  } ## end missing arg check

  ## I already did most of this, right? eh, but it's so easy...
  return (c(cr * cos(pa), cr * sin(pa), z))

}
