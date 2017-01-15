context("plot")

test_that("Plot gets printed",{
  for(i in 1:length(modelList)){
    plotting = recordPlot(plot(modelList[[i]]))
    expect_that(class(plotting), equals("recordedplot"))
  }
})
