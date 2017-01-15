#' Coefficients
#'
#' Retrieve parameters of the fitted model
#'
#' @param object   A (fitted) object of class blm
#' @param ...     Additional data, for example a data frame. Feel free to add other options.
#'
#' @return a numeric vector with the coefficients from a fitted model
#' @export

coef.blm <- function(object, ...){
  mean = as.vector(object$mean)
  names(mean) = rownames(object$mean)
  mean
}