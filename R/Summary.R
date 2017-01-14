#' Summary
#'
#' This function returns an oject with a summary of the fitted model
#'
#' @param model   fitted model of class blm
#' @param ...     Additifonal data, for example a data frame. Feel free to add other options.
#'
#' @return returns an object with summary information
#' @export

summary.blm = function(object, ...){
  formula = object$formula
  data = object$data
  coef = coef(object)
  mean = object$mean
  sigma = object$sigma
  method = object$call
  structure(list(formula = formula, data = data, coefficients = coef, Mean = mean, sigma = sigma, method = method),
                 class = c("summaryDefault", "table"))
}

summary(fittedModel)

#This function is usually used as a longer version of print.
#It gives you more information about the fitted model.

#It does more than this, however. It returns an object with summary information.
#What that actually means is up to the model implementation so do what you like here.
