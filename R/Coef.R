#' Coefficients
#'
#' Retrieve parameters of the fitted model
#'
#' @param object   A formula describing the model of class blm
#' @param ...     Additional data, for example a data frame. Feel free to add other options.
#'
#' @return a numeric vector with the parameters named from a fitted model
#' @export

coef.blm <- function(object, ...){
   namelist <- colnames(model$coefficients)
   coefs <- as.vector(model$coefficients)
   names(coefs) <- namelist
   coefs
}
