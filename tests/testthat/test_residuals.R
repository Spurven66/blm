context("residuals")

test_that("The residuals are not null",{
  for(i in 1:length(modelList)){
    resi = residuals(modelList[[i]])
    expect_that(is.null(resi), is_false())

    expect_that(length(resi) == nrow(modelList[[i]]$data), is_true())
    expect_that(class(resi) == "numeric", is_true())
    #expect_that(abs(resi) > 0, is_true())
  }
})
