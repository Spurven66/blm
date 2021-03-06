context("blm")

source("C:/Users/simon/OneDrive/Dokumenter/GitHub/blm/tests/testthat/DataGenerator.R")

#1
test_that("test for classes",{
  for(i in 1:length(modelList)){
    expect_that(modelList[[i]], is_a("blm"))
    expect_that(modelList[[i]]$mean, is_a("matrix"))
    expect_that(modelList[[i]]$data, is_a("data.frame"))
    expect_that(modelList[[i]]$sigma, is_a("matrix"))
  }
})

test_that("test for data quality",{
  expect_that(blm(y~x, alpha = 1, beta = 1, data = 1), throws_error())
  matDat = matrix(runif(10),nrow = 2, ncol =2)
  expect_that(blm(y~x, alpha = 1, beta = 1, data = matDat), throws_error())
})



