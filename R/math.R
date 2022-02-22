#' @title Math functions
#' @description Convert radians to degrees
#' @name radians_to_degrees
#' @param x A numeric value or vector
#' @rdname radians_to_degrees
#' @return A numeric value or vector
#' @examples
#' radians_to_degrees(1)
#' @export

radians_to_degrees = function(x)
{
  x * 180 / pi
}

#' @title Math functions
#' @description Convert degrees to radians
#' @name degrees_to_radians
#' @param x A numeric value or vector
#' @rdname degrees_to_radians
#' @return A numeric value or vector
#' @examples
#' degrees_to_radians(45)
#' @export

degrees_to_radians <- function(x)
{
  pi * x / 180
}
