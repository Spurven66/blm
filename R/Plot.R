#' Plot
#'
#' This function plots blm models
#'
#' @param x  A fitted x of class blm
#' @param ...     Additifonal data, for example a data frame. Feel free to add other options.
#'
#' @return x-y plot with a line going through it for the fit
#' @export
plot.blm = function(x,...){

  intercept = coef(x)[[1]]
  slope = coef(x)[[2]]

  data = x$data
  y = fitted(x)[,1]

  ggplot(data = data) +
    geom_point(aes(x = x$data[,2], y=y), col = "blue", cex = 0.4)+
    geom_abline(slope = slope, intercept = intercept, col = "blue") +

  labs(title = paste("Intercept =", round(x$mean[1],3) ,
                     " Slope =",round(x$mean[2],3), " R^2 = ",
                     round(1-sum(residuals(x)^2)/sum((x$data[,1]-mean(x$data[,1]))^2),3)),
                      y="Fitted y",x="x")
}

