context("confint")

test_that("The confint isn't null and upper is higher than lower end of interval",{
  for(i in 1:length(modelList)){
    interv = confint(modelList[[i]])
    expect_that(is.null(interv), is_false())

    for(j in 1:nrow(interv)){
      expect_that(interv[j,1] < interv[j,2], is_true())
    }
  }
})


test_that("the level(confidence interval) must be less than or (meaningless) equal to one, and parm must exist",{
  for(i in 1:length(modelList)){
    expect_that(confint(modelList[[i]],level = 1.1), gives_warning())
    expect_that(confint(modelList[[i]],level = -1.1), gives_warning())
    expect_that(confint(modelList[[i]],parm = "h"), gives_warning())
  }
})





#test_that("The confint lies around the mean values",{
#  for(i in 1:length(modelList)){
#    for(j in 1:nrow(modelList[[i]]$mean)){
#      expect_that(is.between( modelList[[i]]$mean[j] , confint(modelList[[i]])[1,j] ,
#                  confint(modelList[[i]])[2,j]), is_true())
#    }
#  }
#})

#for(i in 1:4){
#  for (j in 1:length(modelList[[i]]$mean)){
#  print(is.between(modelList[[i]]$mean[j] , confint(modelList[[i]])[1,j] ,
#                          confint(modelList[[i]])[2,j]))
#    print(modelList[[i]]$mean[j])
#    print(confint(modelList[[i]])[1:2,j])
#  }
#}

