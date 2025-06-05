#' @title sphereToCyl
#' @description converts from spherical coordinates to cylindrical
#' @param spherical radius, polar angle, azimuthal angle
#' @name sphereToCyl
#' @usage converting coordinates, ass-pains
#' @keywords cartesian, polar, coordinate, remapping, radians
#' @return cylindrical radius, polar angle, z tuple


sphereToCyl <- function(sr, pa, aa)
{
  ## arg check
  absent=c(missing(sr), missing(pa), missing(aa))

  if(sum(absent)>0)
  {
    stop(paste("This function requires radius, polar angle and azimuthal angle input to return a value."))
  } ## end missing arg check

  pa = normalize(pa)
  aa = normalize(aa)

  ## not nearly as bad as I thought it'd be...
  cr = sr * sin(aa)
  z = sr * cos(aa)

  return (c(cr, pa, z))
}
