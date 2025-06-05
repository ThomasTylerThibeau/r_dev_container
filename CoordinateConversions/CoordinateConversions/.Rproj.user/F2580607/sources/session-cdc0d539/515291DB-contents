#' @title Slope
#' @description finds slope of a line with one or two x, y points (3d seems too much)
#' @name slope
#' @usage finding slope
#' @returns decimal or integer representing the slope
#' @keywords slope


slope <= function(x1, y1, x2 = 0, y2 = 0)
{
  ## arg check
  absent=c(missing(x1), missing(y1))
  if(sum(absent)>0)
  {
    stop(paste("You must provide at least an x and y
               measure for this function to return a slope."))
  } ## end missing arg check

  if(x1 == x2){stop("Yo! Wtf you doin? Get outta here! Pfft,
                    infinite slope!? You crazy? Scram.")}

  return ((y2-y1)/(x2-x1)) ## I feel like this is cheating... I mean,
  ## shouldn't we check to make sure that x2>x1? Well, even entering
  ## the points backwards, it should work. But I still don't like it.
}
