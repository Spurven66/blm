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
  cat("Bayesian Linear Model: ", "\n")
  print(x$formula)
  cat("\n")
  cat("Call: ")
  cat("\n")
  print(x$call)
  cat("\n")
  cat("Fitted coefficients (mean): ","\n")
  print(coef(x))
  cat("\n")
  cat("Covariance: ", "\n")
  print(x$sigma)
  cat("\n")
}

