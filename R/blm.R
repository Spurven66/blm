#' Bayesian linear model.
#'
#' Fits a model, given as a formula, optionally with data provided through the "..." parameter.
#'
#' @param model   A formula describing the model.
#' @param alpha   Precision hyperparameter
#' @param ...     Additional data, for example a data frame. Feel free to add other options.
#'
#' @return A fitted model.
#' @export

blm <- function(model, alpha, beta, data) {

  phiX = model.matrix(model, data = data)
  y = model.response(model.frame(model, data = data))

  sigma = solve(diag(alpha, nrow=ncol(phiX)) + beta * t(phiX) %*% phiX)
  mu = beta * sigma %*% t(phiX) %*% y
  structure(list(mu = mu, sigma = sigma, model = model, data = data, coefficients = t(mu)),
            class = "blm")
}

##EXAMPLE OF RUN AND OUTPUT

x <- runif(10)
y <- rnorm(10, x, 1)
z <- rnorm(10)
fitted_model = blm(y ~ x + z, 1, 1, data.frame(x=x, y=y, z=z))
str(fitted_model)

