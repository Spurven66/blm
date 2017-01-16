#' Bayesian linear model.
#'
#' Fits a model, given as a formula, optionally with data provided through the "..." parameter.
#'
#' @param model   A formula describing the model.
#' @param beta    Precision hyperparameter
#' @param alpha   Covariance from prior
#' @param data    data for estimation, in data frame.
#'
#' @param ...     Additional data
#'
#' @return An Object of class .blm, containing the inputted information as well as the fitted values of mean and sigma.
#' @export

blm <- function(model, alpha, beta, data,...) {
  if(!is.data.frame(data)) stop("Data must be data frame")

  ##Calculation of model matrix
  phiX = model.matrix(model, data = data)

  ##extraction of y-values from the data
  y = model.response(model.frame(model, data = data))

  ##Calculate posterior values of sigma and Mu based on the input
  sigma = solve(alpha + beta * t(phiX) %*% phiX)
  mu = beta * sigma %*% t(phiX) %*% y

  ##Return fitted values, model,
  structure(list(formula = model, mean = mu, data = data, sigma = sigma, phix = phiX, alpha = alpha, beta = beta, call = sys.call()),
            class = "blm")
}