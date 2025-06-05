#' @title recToSphere
#' @description function converts from x, y, z coordinates to radius, polar theta, azimuthal
#' @param theta, radius, z
#' @name recToSphere
#' @usage converting coordinates
#' @keywords cartesian, polar, coordinate, remapping, radians
#' @return spherical-radius, polar-angle, azimuthal-angle tuple


recToSphere <= function(x, y, z)
{
  ## arg check
  absent=c(missing(x), missing(y), missing(z))

  if(sum(absent)>0)
  {
    stop(paste("This function requires x, y and z input to return a value."))
  } ## end missing arg check

  sr = sqrt(x^2 + y^2 + z^2)
  ## polar/theta
  pa = atan(y/x)
  ## az
  aa = atan(z/sr)

  return (c(sr, pa, aa))
}
