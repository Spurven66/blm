context("predict")

test_that("The predicted values and sigma are not null and the dimensions of output is correct",{
  for(i in 1:length(modelList)){
    fitVal = predict(modelList[[i]])
    expect_that(is.null(fitVal), is_false())
    expect_that(dim(fitVal)[1] == nrow(modelList[[i]]$data), is_true())
    expect_that(dim(fitVal)[2] == 2, is_true())
  }
})

test_that("The predicted and sigma are not null + dimensions of output is correct with added newData",{
  x <- runif(100,-10,10)
  y <- rnorm(n = 200, m = 0, 5)
  z <- rnorm(10)
  newData = data.frame(y=y, x=x)
  for(i in 1:length(modelList)){
    if(ncol(newData) != ncol(modelList[[i]]$data)){
      expect_that(predict(modelList[[i]], newData = newData), throws_error())
    }
    else{
      fitVal = predict(modelList[[i]], newData = newData)
      expect_that(is.null(fitVal), is_false())
      expect_that(dim(fitVal)[1] == nrow(newData), is_true())
      expect_that(dim(fitVal)[2] == 2, is_true())
    }
  }
})


#for(i in 1:length(modelList)){
#  objectVars = colnames(modelList[[i]]$data)
#  newDataVars = colnames(newData)
#  if(!objectVars %in% newDataVars){
#    expect_that(fitVal = predict(modelList[[i]], newData = newData), gives_warning())
#  }
#  else {
