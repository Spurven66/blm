#' Print
#'
#' This function prints an object
#'
#' @param x   object of class .blm
#' @param ...     Additifonal data, for example a data frame. Feel free to add other options.
#'
#' @return prints a very short description of the object.
#' @export

print.blm <- function(x, ...) {
  ##Formula = how the fitting was called
  cat("Bayesian Linear Model: ", "\n")
  print(x$formula)
  cat("\n")
  cat("Fitted coefficients: ", coef(x),"\n")
  cat("Mean: ", x$mean,"\n")
  cat("Goodness of fit: ", x$sigma, "\n")
  cat("How the fit was done: ")
  print(x$call)
}

print(fittedModel)

