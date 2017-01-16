context("summary")

test_that("Summary prints appropriately",{
  for(i in 1:length(modelList)){
    a = 0
    if(nrow(modelList[[i]]$data) < 10) {a = 10-nrow(modelList[[i]]$data)}
    expLength = 29 + nrow(modelList[[i]]$sigma) + nrow(modelList[[i]]$mean) - a

    summ = capture.output(summary(modelList[[i]]))
   # expect_that(length(summ) == expLength, is_true())
    expect_that(summ, is_a("character"))
  }
})

test_that("Summary returns appropriate object",{
  for(i in 1:length(modelList)){
    summ = capture.output(summary(modelList[[i]]))
    expect_that(length(summaryObject) == 10, is_true())
    expect_that(summaryObject$formula, equals(modelList[[i]]$formula))
    expect_that(summaryObject$Data, equals(modelList[[i]]$data))
    expect_that(summaryObject$Mean, equals(modelList[[i]]$mean))
    expect_that(summaryObject$Covariance, equals(modelList[[i]]$sigma))
    expect_that(summaryObject$Coefficients, equals(coef(modelList[[i]])))
    expect_that(summaryObject$Method, equals(modelList[[i]]$call))
    expect_that(summaryObject$Distance, equals(residuals(modelList[[i]])))
    expect_that(summaryObject$"sum of Squared Distance", equals(deviance(modelList[[i]])))
    expect_that(summaryObject$"fitted response variable", equals(fitted(modelList[[i]])))
    expect_that(summaryObject$"confidence interval", equals(confint(modelList[[i]])))
    expect_that(summaryObject, is_a(c("summaryDefault", "table")))

  }
})
