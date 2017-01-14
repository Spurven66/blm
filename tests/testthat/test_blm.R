context("blm")

setwd("C:/Users/simon/OneDrive/Dokumenter/GitHub/blm/R")
source("blm.R")

##Simulate data and fit to model
#x <- rnorm(10)
#a <- 1 ; b <- 1.3
#w0 <- 0.2 ; w1 <- 3
#y <- rnorm(10, mean = w0 + w1 * x, sd = sqrt(1/b))
#fittedModel <- blm(y~x, alpha = a, beta = b,data.frame(x=x, y=y))

x <- runif(10)
y <- rnorm(10, x, 1)
z <- rnorm(10)
w0 <- rnorm(1) ; w1 <- rnorm(1)
fittedmodel = blm(y ~ x + z, w0,w1, data.frame(x=x, y=y, z=z))

test_that("The fitted model is of class .blm",{
  expect_that(fittedModel, is_a("blm"))
})

test_that("The mean is returned in matrix",{
  expect_that(fittedModel$mean, is_a("matrix"))
})

test_that("The data is returned as data frame",{
  expect_that(fittedModel$data, is_a("data.frame"))
})

test_that("The coefficients are returned as matrix",{
  expect_that(fittedModel$coefficients, is_a("matrix"))
})

test_that("The sigma values are returned as a matrix",{
  expect_that(fittedModel$sigma, is_a("matrix"))
})


