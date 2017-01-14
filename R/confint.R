#' confint
#'
#' Calculate confidence interval of fitted parameters
#'
#' @param model   A formula describing the model of class blm
#' @param parameter Parameter to calculate confidence interval for
#' @param interval Percentage of confidence interval limit, standard = 95%
#' @param ...     Additional data, for example a data frame. Feel free to add other options.
#'
#' @return A confidence interval for parameter
#' @export
confint.blm <- function(model, parameter, interval=0.95){
  coefficients = coef.blm(model)
  level = levels(coefficients$parameter)
  upper = qnorm(level/2)
  lower = qnorm(1-level/2)
  cat("[",lower,";",upper,"]")
}

#confint(fitted_model,x)

#coefs = coef.blm(fitted_model)
