library(testthat)
library(dplyr)
library(rlang)

summary_stats_min <- generate_summary_stats(minimal_data, var1)
summary_stats_test <- generate_summary_stats(test_data, length)

test_that("'generate_summary_stats' should return a data frame or extension with n + 2 columns, where n
is the number of columns in the original input data frame.", {
   expect_equal(minimal_data_output_col_count, ncol(summary_stats_min))
   expect_equal(test_data_output_col_count, ncol(summary_stats_test))
})

test_that("'generate_summary_stats' should return a data frame or extension where values in the 'count'
 column represent the number of observations in each group_var column, from the original data frame.", {
   expect_equal(test_data_output_counts, summary_stats_test %>% pull(count))
   expect_equal(minimal_data_output_counts, summary_stats_min %>% pull(count))
 })

 test_that("'generate_summary_stats' should return a data frame or extension where values in the 'percentage'
 column represent the percentage of observations in the group_var column, from the total observation count.", {
   expect_equal(test_data_output_percentages, summary_stats_test %>% pull(percentage), tolerance = 0.01)
   expect_equal(minimal_data_output_percentages, summary_stats_min %>% pull(percentage), tolerance = 0.01)
 })

 test_that("'generate_summary_stats' should throw an error message when incorrect types are passed to 'data' and
 'group_var' arguments.", {
   expect_error(generate_summary_stats(list_data, 1))
 })
