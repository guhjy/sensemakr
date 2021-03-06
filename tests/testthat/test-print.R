context("Checking print")

test_that("Test print", {

  rm(list = ls())

  # loads data
  library(sensemakr)
  data("darfur")

  # fits model
  model  <- lm(peacefactor ~ directlyharmed + age + farmer_dar + herder_dar +
                 pastvoted + hhsize_darfur + female + village, data = darfur)


  # runs benchmarking etc
  sense <- sensemakr(model=model, treatment="directlyharmed")

  capture_output(interpret(sense))

  # make sure 'max()' is choosing right benchmark point
  # currently points at 'female' not 'village'
  interpret(sense, q = 0.5)
  interpret(sense, q = 0.6)
  summary(sense)

  capture_output(interpret(sense, q = 0.5)) #throws warning
  capture_output(interpret(sense, q = 0.6)) #throws warning.

  capture_output(summary(sense)) #needs more output/ to be different from interpret().

})
