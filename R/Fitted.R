#' fitted
#'
#' This function should give you the fitted response variables.
#'
#' @param object   An object class blm
#' @param ...     Additifonal data, for example a data frame. Feel free to add other options.
#'
#' @return the fitted response variables.
#' @export

fitted.blm = function(object, ...){
  if(class(object) != "blm") warning("Assigned object should be of class .blm")

  phi = object$phix
  sigma = object$sigma
  mean = object$mean
  beta = object$beta
  var = 1/beta

  results = as.data.frame(matrix(nrow = nrow(phi), ncol = 2))
  for (i in 1:nrow(results)){
    results[i,1] = t(mean)%*%phi[i,]
    results[i,2] = var + t(phi[i,]) %*% sigma %*% phi[i,]
  }
  colnames(results) = c("Predicted value","Sigma")
  results
}
