library(testthat)
library(dplyr)
library(rlang)


test_that("calculate_model_metric should correctly calculate accuracy", {
  expect_equal(test_accuracy, 0.838, tolerance = 0.01)
})

test_that("calculate_model_metric should correctly calculate precision", {
  expect_equal(test_precision, 0.8195, tolerance = 0.01)
})

test_that("calculate_model_metric should correctly calculate recall", {
  expect_equal(test_recall, 0.8798, tolerance = 0.01)
})

test_that("gives an error when an incorrect metric is put in", {
  expect_error(test_predictions %>%
              calculate_model_metric(truth_col = .truth, predictions_col =  .pred_class, metric = "invalid"))
})

