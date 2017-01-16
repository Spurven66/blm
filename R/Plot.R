#' Plot
#'
#' This function plots blm models
#'
#' @param x  An objct of class blm
#' @param fit Should target variables (y axis) be plotted from fitted or data values
#' @param newData for plot of new predicted target variable values, add new Data and assign fit = TRUE
#' @param ...     Additifonal data,
#'
#' @return if fit = FALSE: x-y plot with a line going through it for the fit, if fit = TRUE and newData assigned, a plot is returned with original data and line (blue) and red data points for the predicted target variables
#' @export

plot.blm = function(x,fit = FALSE, newData = NULL,...){
  data = x$data
  intercept = coef(x)[[1]]
  slope = coef(x)[[2]]

  if(fit == FALSE){

  ggplot(data = data) +
    geom_point(aes(x = data[,2], y=data[,1]), col = "blue", cex = 0.4)+
    geom_abline(slope = slope, intercept = intercept, col = "blue") +

    labs(title = paste("Intercept =", round(x$mean[1],3) ,
                       " Slope =",round(x$mean[2],3), " R^2 = ",
                       round(1-sum(residuals(x)^2)/sum((data[,1]-mean(data[,1]))^2),3)),
         y="y",x="x")
  }
  else{
    if(fit != FALSE){

      y = fitted(x)[,1]

    if(!is.null(newData)){

      pred = blm(x$formula, alpha = x$sigma, beta = x$beta, data = newData)
    }
      if(ncol(newData) != ncol(x$data)) stop("Wrong number of variables in newData for original formula")

      intercept = coef(pred)[[1]]
      slope = coef(pred)[[2]]

      ggplot() +
        geom_point(data = data , aes(x = data[,2], y=data[,1]), col = "blue", cex = 0.4) +
        geom_point(data = newData, aes(x = newData[,2], y=y), col = "red", cex = 0.4)+
        geom_abline(slope = slope, intercept = intercept, col = "red") +

        labs(title = paste("Intercept =", round(pred$mean[1],3) ,
                           " Slope =",round(pred$mean[2],3)),
             y="Predicted y",x="x")
    }
  }
}

