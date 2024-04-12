#' Generate Summary Statistics
#'
#' Groups input data by one input variable and generates the following metrics:
#' Observation Count,
#' Group percentage out of all observations, and
#' Mean averages for all other included variables.
#'
#' @param data Input data frame, or data frame extension (eg: tibble). REQUIRES: no NULL variables
#' @param group_var String containing name of variable to group by.
#'
#' @return A data frame with n + 2 columns, where n is the number of columns in the input data frame.
#'   The first column (group_var) Contains the unique values by which we group the data. (see group_by() dplyr function)
#'   The second column (count) lists the number of observations for each class from the input data frame.
#'   The third column (percentage) depicts what percentage of all original observations are represented by said row.
#'   All subsequent columns are mean averages of their respective original variables.
#'
#' @export
#'
#' @examples
#' df = data.frame("x" = c(0.2, 0.4, 0.8, 1.6, 3.2),
#'   "var" = c("a","b", "a", "b", "a"))
#' generate_summary_stats (data = df, group_var = "var")
#'
generate_summary_stats <- function(data, group_var) {
    num_obs <- nrow(data)
    summary <- data |>
      dplyr::group_by({{group_var}}) |>
      dplyr::summarize(
                count = dplyr::n(),
                percentage = dplyr::n() / num_obs * 100,
                dplyr::across(!c(count, percentage), .fns = mean, .names = "{.col}_avg"))
    return(summary)
}
