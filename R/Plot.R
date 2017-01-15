#' Plot
#'
#' This function plots blm models
#'
#' @param object  A fitted object of class blm
#' @param ...     Additifonal data, for example a data frame. Feel free to add other options.
#'
#' @return x-y plot with a line going through it for the fit
#' @export

# I could imagine that it would be useful to see an x-y plot with a line going through it for the fit.

##Plot x and predicted y

plot.blm = function(object,...){

  data = object$data
  y = fitted(object)[,1]

  ggplot(data = data) +
    geom_point(aes(x = object$data[,2], y=y), col = "blue", cex = 0.4)+
    geom_abline(slope = coef(object)[[2]], intercept = coef(object)[[1]], col = "blue") +

  labs(title = paste("Intercept =", round(object$mean[1],3) ,
                     " Slope =",round(object$mean[2],3), " R^2 = ",
                     round(1-sum(residuals(object)^2)/sum((object$data[,1]-mean(object$data[,1]))^2),3)),
                      y="Fitted y",x="x")
}

