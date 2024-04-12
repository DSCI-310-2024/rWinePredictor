# objects for testing of calculate_model_metric function

# Load necessary libraries
library(yardstick)
library(rlang)

# test data
test_predictions = yardstick::two_class_example

# Calculate metrics for testing
test_accuracy <- calculate_model_metric(test_predictions, truth_col = 'truth', predictions_col =  'predicted', metric = "accuracy")

test_precision <- calculate_model_metric(test_predictions, truth_col = 'truth', predictions_col =  'predicted', metric = "precision")

test_recall <- calculate_model_metric(test_predictions, truth_col = 'truth', predictions_col =  'predicted', metric = "recall")
