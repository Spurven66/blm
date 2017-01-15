context("fitted")

test_that("The fitted values and sigma are not null and that dimensions of output is correct ",{
  for(i in 1:length(modelList)){
    fitVal = fitted(modelList[[i]])
    expect_that(is.null(fitVal), is_false())
    expect_that(dim(fitVal)[1] == nrow(modelList[[i]]$data), is_true())
    expect_that(dim(fitVal)[2] == 2, is_true())
  }
})
