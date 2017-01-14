context("print")

setwd("C:/Users/simon/OneDrive/Dokumenter/GitHub/blm/R")
source("Print.R")

x <- runif(10)
y <- rnorm(10, x, 1)
z <- rnorm(10)
w0 <- rnorm(1) ; w1 <- rnorm(1)
fittedModel = blm(y ~ x + z, w0,w1, data.frame(x=x, y=y, z=z))

string = print(fittedModel)

test_that("The print function contains all the right fields"{
  expect_that(print(fittedModel), matches("Bayesian Linear Model:"))
})


