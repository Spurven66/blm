#' deviance
#'
#' sum of squared distances from the predicted response variables to the observed
#'
#' @param model   A formula describing the model of class blm
#' @param ...     Additifonal data, for example a data frame. Feel free to add other options.
#'
#' @return a numeric vector with sum of squared distances from the predicted response variables to the observed
#' @export

#This function just computes the sum of squared distances from the predicted response variables to the observed.
deviance.blm = function(object,...){
  if(class(object) != "blm") warning("Assigned object should be of class .blm")

  deviance = sum(residuals(object)^2)
  deviance
}
