context("deviance")

test_that("The deviance isn't null, is > 0, and is the sum of squared residuals",{
  for(i in 1:length(modelList)){
    devi = deviance(modelList[[i]])
    expect_that(is.null(devi), is_false())
    expect_that(devi > 0, is_true())
    expect_that(devi, equals(sum(residuals(modelList[[i]])^2)))
  }
})

