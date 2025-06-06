#' @title normalize
#' @description ensures that angles are between 0 and 2pi
#' @param angle
#' @name normalize
#' @usage normalizing angles via clock division to reduce angles to one anti-clockwise (clockstupid?) rotations
#' @keywords normal angle
#' @return (0, 2pi] angle
#' @examples { normalize(10)}


## I couldn't figure out why sphereToCyl(3,4,5) returned one thing
## and that thing as inputs for cylToSphere was not giving me 3,4,5
## a 20 minute chat with AI later, and I feel quite retarded
normalize <- function(a)
{

  if(a > 2 * pi || a < 0)
  {
    print("Please ensure that angle is in RADIANS.")
    print("If necessary, run again using:")
    print("    ( (degree measure) * pi / 180 )")

    a = (a %% (2 * pi))
  }

  return (a)
}

