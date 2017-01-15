#' Predict
#'
#' make predictions based on the fitted model
#'
#' @param object fitted model of type blm
#' @param newData NewData to fit the model to - the posterior of the object will be used for prior
#' If you do not provide new data, it instead gives you the predictions on the data used to fit the model.
#' @param ...     additional arguments affecting the predictions produced.
#'
#' @return predicted values of y based on fitted model and set of data
#' @export

predict.blm = function(object, newData,...){
  if(!hasArg(newData)) newData = object$data
  if(class(object) != "blm") warning("Assigned object should be of class .blm")
  if(ncol(newData) != ncol(object$data)) stop("Wrong number of variables in newData for original formula")
  objectVars = colnames(object$data)
  newDataVars = colnames(newData)

  predictionModel = blm(object$formula, alpha = object$sigma, beta = object$beta, data = newData)
  prediction = fitted(predictionModel)
  prediction
}


