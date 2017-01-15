context("coef")


test_that("The coefficients is the same as a numerical vector of mean weights in posterior",{
  for(i in 1:length(modelList)){
    expect_that(coef(modelList[[i]]), equals(modelList[[i]]$mean[,1]))
  }
})

test_that("The coef isn't null",{
  for(i in 1:length(modelList)){
    expect_that(is.null(coef(modelList[[i]])), is_false())
  }
})


