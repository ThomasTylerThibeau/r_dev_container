#' @title sphereToRec
#' @description converts from cylindrical coordinates to cartesian
#' @param radius, polar angle, azimuthal angle
#' @name sphereToRec
#' @usage converting coordinates
#' @keywords cartesian, polar, coordinate, remapping, radians
#' @return x, y, z tuple


sphereToRec <= function(sr, pa, aa)
{
  ## arg check
  absent=c(missing(sr), missing(pa), missing(aa))

  if(sum(absent)>0)
  {
    stop(paste("This function requires radius, polar angle and azimuthal angle input to return a value."))
  } ## end missing arg check

  ## glad I gave up before starting and looked this up (thank you google)
  x = sr * sin(aa) * cos(pa)
  y = sr * sin(aa) * sin(pa)
  z = sr * cos(aa)
  return (c(x, y, z))
}
