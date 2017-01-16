context("plot")

library(ggplot2)

test_that("Plot gets printed",{
    for(i in 1:length(modelList)){
    plotting = invisible(plot(modelList[[i]]))
    expect_that(class(plotting), equals(c("gg", "ggplot")))
  }
})

test_that("Plot gets printed with predict on new data",{
  x <- runif(100,-10,10)
  y <- rnorm(n = 200, m = 0, 5)
  newData = data.frame(y=y, x=x)
  for(i in 1:length(modelList)){
    if(ncol(newData) != ncol(modelList[[i]]$data)){
      expect_that(predict(modelList[[i]], newData = newData), throws_error())
    }
    else{
    plotting = invisible(plot(modelList[[i]], TRUE, newData))
    expect_that(class(plotting), equals(c("gg", "ggplot")))
    }
  }
})
