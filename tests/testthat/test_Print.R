context("print")

test_that("The print function returns print of type Character", {
  for(i in 1:length(modelList)){
    pri = capture.output(print(modelList[[i]]))
    expect_that(is.null(pri), is_false())
  }
})



