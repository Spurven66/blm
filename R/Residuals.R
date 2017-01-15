#' Residuals
#'
#' This function returns the residuals of the fit.
#'
#' That is the difference between predicted values and observed values for the response variable.
#' @param object   object of class .blm
#' @param ...     Additifonal data, for example a data frame. Feel free to add other options.
#'
#' @return the difference between predicted values and observed values for the response variable.
#' @export

residuals.blm = function(object,...){
  if(class(object) != "blm") warning("Assigned object should be of class .blm")

  observed = object$data[,as.character(object$formula[[2]])]
  predicted = fitted(object)[,1]
  residual = observed - predicted
  residual
}
