#' @title cylToSphere
#' @description converts from cylindrical coordinates to spherical
#' @param cylindrical radius, polar angle, z
#' @name cylToSphere
#' @usage converting coordinates
#' @keywords cartesian, polar, coordinate, remapping, radians
#' @return x, y, z tuple


cylToSphere <= function(cr, pa, z)
{
  ## arg check
  absent=c(missing(cr), missing(pa), missing(z))

  if(sum(absent)>0)
  {
    stop(paste("This function requires x, y and z input to return a value."))
  } ## end missing arg check

  ## spherical radius, easy
  sr = sqrt(cr^2 + z^2)
  ## azimuthal angle
  aa = acos(z / (sqrt(cr^2 + z^2)))

  return (c(sr, pa, aa))
}
