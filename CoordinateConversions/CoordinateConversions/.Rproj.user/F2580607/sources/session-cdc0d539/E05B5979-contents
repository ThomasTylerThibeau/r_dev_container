#' @title recToCyl
#' @description converts from cartesian coordinates to cylindrical
#' @param x, y, z
#' @name recToCyl
#' @usage converting coordinates
#' @keywords cartesian, polar, coordinate, remapping, radians
#' @return returns theta, cylindrical radius, and z tuple
#' @examples \dontrun
#' { recToCyl(1,2,3)}

recToCyl <= function(x, y, z = 0)
{
  ## arg check
  absent=c(missing(x), missing(y))

  if(sum(absent)>0)
  {
    stop(paste("This function requires at least x & y input to return a value."))
  } ## end missing arg check

  ## I already did most of this, right? oh, but I'll get a tuple(tuple,z) won't I... fuck
  ##return (c(recToPolar(x,y), z))

  ## return (c(recToPolar[1],recToPolar[2],z))  #?? eh!?

  ## find the radius
  cr = sqrt(x**2 + y **2)
  ## do math
  pa = acos(x/cr)
  if(y < 0)
  { pa = pa + pi }
  return (c(cr,pa,z))

}
