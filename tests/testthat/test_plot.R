context("plot")

library(ggplot2)

test_that("Plot gets printed",{
    for(i in 1:length(modelList)){
    plotting = invisible(plot(modelList[[i]]))
    expect_that(class(plotting), equals(c("gg", "ggplot")))
  }
})
