context("print")


test_that("The print function returns right size print of type Character", {
  for(i in 1:length(modelList)){
    expLength = 14 + nrow(modelList[[i]]$sigma)

    pri = capture.output(print(modelList[[i]]))
    expect_that(length(pri) == expLength, is_true())
    expect_that(pri, is_a("character"))

  }
})



