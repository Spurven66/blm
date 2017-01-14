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
  structure(list(formula = model, mean = mu, data = data, coefficients = t(mu), sigma = sigma, call = sys.call()),
            class = "blm")
}

##EXAMPLE OF RUN AND OUTPUT

# fake some data for our linear model

#x <- rnorm(10)
#a <- 1 ; b <- 1.3
#w0 <- 0.2 ; w1 <- 3
#y <- rnorm(10, mean = w0 + w1 * x, sd = sqrt(1/b))

# fit a model

#fittedModel <- blm(y~x, alpha = a, beta = b,data.frame(x=x, y=y))
#fittedModel

#x <- runif(10)
#y <- rnorm(10, x, 1)
#z <- rnorm(10)
#fitted_model = blm(y ~ x + z, 1, 1, data.frame(x=x, y=y, z=z))
#str(fitted_model)

