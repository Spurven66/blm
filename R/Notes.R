#fittedModel

source("C:/Users/simon/OneDrive/Dokumenter/GitHub/blm/R/blm.R")

is.between <- function(x, a, b) {
  (x - a)  *  (b - x) > 0
}

#1
x <- runif(10)
y <- rnorm(10, x, 1)
z <- rnorm(10)
fittedModel1 = blm(y ~ x + z, 1, 1, data.frame(y=y,x=x, z=z))

#2
x <- rnorm(10)
a <- 1 ; b <- 1.3
w0 <- 0.2 ; w1 <- 3
y <- rnorm(10, mean = w0 + w1 * x, sd = sqrt(1/b))
covariance = diag(1/a, nrow = 2, ncol = 2)
fittedModel2 <- blm(y~x, alpha = covariance, beta = b,data.frame(y=y,x=x))

#3
x <- runif(100,-10,10)
y <- rnorm(n = 100, m = 0, 5)
z <- rnorm(100)
fittedModel3 = blm(y ~ x + z, 1, 1, data.frame(y=y, x=x, z=z))

#4
x <- runif(100,-10,10)
y <- rnorm(n = 200, m = 0, 5)
z <- rnorm(10)
fittedModel4 = blm(y ~ x + z, 1, 1, data.frame(y=y, x=x, z=z))

#5
x <- runif(100,-10,10)
y <- rnorm(n = 200, m = 0, 5)
z <- rnorm(10)
t <- rnorm(n = 100, m = 2, 5)
fittedModel4 = blm(y ~ x + z*t, 1, 1, data.frame(y=y, x=x, z=z, t=t))

modelList = list(fittedModel1,fittedModel2, fittedModel3, fittedModel4)