#' Calculate a specified model metric
#'
#' This function calculates a specified model metric (e.g., accuracy, precision, recall)
#' for a given set of predictions and ground truth values.
#'
#' @param predictions A data frame or tibble containing model predictions
#' @param truth_col A vector containing the ground truth values
#' @param predictions_col A vector containing the prediction values
#' @param metric The metric to calculate (e.g., "accuracy", "precision", "recall")
#' @param event_level The event level for precision and recall calculations. Default is "first".
#'
#' @return The calculated value of the specified metric
#'
#' @export
#'
#' @examples
#' df = yardstick::two_class_example
#' calculate_model_metric(df, "truth", "predicted", "accuracy",
#' event_level = "first")
#'
calculate_model_metric <- function(predictions,
                                   truth_col = "",
                                   predictions_col = "",
                                   metric = "",
                                   event_level = "first") {
  if (metric == "accuracy") {
    metric_table <- predictions |>
    yardstick::metrics(truth = truth_col, estimate = predictions_col) |>
    dplyr::filter(.metric == "accuracy")
    metric_value <- metric_table$.estimate
  } else if (metric == "precision") {
    metric_table <- predictions |>
    yardstick::precision(truth = truth_col, estimate = predictions_col,
                         event_level="first")
    metric_value <- metric_table$.estimate
  } else if (metric == "recall") {
    metric_table <- predictions |>
    yardstick::recall(truth = truth_col, estimate = predictions_col,
                      event_level="first")
    metric_value <- metric_table$.estimate
  } else {
      stop("Invalid metric used")
  }
  return(metric_value)
}
