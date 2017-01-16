#' Summary
#'
#' This function returns an oject with a summary of the fitted model
#'
#' @param object   fitted model of class blm
#' @param ...     Additifonal data
#'
#' @return returns an object with summary information
#' @export

summary.blm = function(object, ...){
  distance = residuals(object)
  sum_of_squaredDist = deviance(object)
  fitted_response_variable = fitted(object)
  confidence_interval = confint(object)
  coefficients = coef(object)

  Rsquared = 1-sum(residuals(object)^2)/sum((object$data[,1]-mean(object$data[,1]))^2)

  formula = object$formula
  data = object$data
  mean = object$mean
  sigma = object$sigma
  method = object$call

  cat("-------Summary Of Bayesian Linear Model-------", "\n", "\n")
  cat("Call:","\n")
  print(object$call)
  cat("\n")
  cat("-----------------------------------------------------------------------", "\n")
  cat("Sum of squared distance:", "\n")
  cat(round(sum_of_squaredDist,3),"\n")
  cat("-----------------------------------------------------------------------", "\n")
  cat("\n")
  cat("Coefficients (mean):", "\n")
  co = as.matrix(coefficients)
  colnames(co) = "estimate"
  print(co)
  cat("\n", "\n")
  cat("Covariance Matrix, Sigma:", "\n")
  print(sigma)
  cat("-----------------------------------------------------------------------", "\n")
  cat("Data[1:10,]: ")
  cat("\n")
  print(data[1:10,])

  summaryObject <<- structure(list("formula" = formula, Data = data, Mean = mean, Covariance = sigma, Coefficients = coefficients,
                 Method = method, Distance = distance, "sum of Squared Distance" = sum_of_squaredDist,
                 "fitted response variable" = fitted_response_variable,
                 "confidence interval" = confidence_interval), class = c("summaryDefault", "table"))
}


