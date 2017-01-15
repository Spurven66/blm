#' confint
#'
#' Calculate confidence interval of fitted parameters
#'
#' @param object   An object of class blm
#' @param parm  Parameter to calculate confidence interval for. Default 0 to return confidence interval for all weights
#' @param level Percentage of confidence interval limit, standard = 95%
#' @param ...     Additional data, for example a data frame. Feel free to add other options.
#'
#' @return A confidence interval for weights
#' @export

confint.blm <- function(object, parm=0, level=0.95){
  mean = object$mean
  sigma = object$sigma

  ##Test if parm is okay - perhaps change to exceptions?
  if(!is.numeric(parm)){
    if(!parm %in% rownames(mean)){
      warning("unrecognized variable. Please note, first variable is (Intercept) - all variables will be returned")
    }
  }

  ##Test if level is okay
  if(level > 1||level < 0){
    warning("Be minded, that the given level(confidene interval) is out of limits and set to 1")
    level = 1
  }

  listOfIntervals = data.frame()
  lower = (1-level)/2
  upper = level + (1-level)/2

  for(i in 1:nrow(mean)){
    low = qnorm(lower, mean[i,], sigma[i,i])
    up = qnorm(upper, mean[i,], sigma[i,i])

    listOfIntervals[i,1] = low ; listOfIntervals[i,2] = up
  }
  colnames(listOfIntervals) = c("Lower","upper")
  rownames(listOfIntervals) = rownames(mean)

  if(parm ==0){
    return(listOfIntervals) }
  else {
    return(listOfIntervals[parm,])}
}