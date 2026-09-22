# Format a count for use in the manuscript text.
format_count <- function(x) {
  scales::comma(x, accuracy = 1)
}

# Format a share for use in the manuscript text.
format_percent <- function(x) {
  scales::percent(x, accuracy = 0.1)
}

# Add up usage for matching rows.
usage_total <- function(data, ..., .format_as_str = TRUE) {
  value <- data |>
    dplyr::filter(...) |>
    dplyr::summarise(value = sum(usage)) |>
    dplyr::pull(value)

  if (.format_as_str) format_count(value) else value
}

# Find the share of usage from matching rows.
usage_share <- function(data, ..., .format_as_str = TRUE) {
  value <- usage_total(data, ..., .format_as_str = FALSE) /
    usage_total(data, .format_as_str = FALSE)

  if (.format_as_str) format_percent(value) else value
}

# Find the largest usage total across groups.
usage_max <- function(data, ..., .by, .format_as_str = TRUE) {
  value <- data |>
    dplyr::filter(...) |>
    dplyr::summarise(value = sum(usage), .by = {{ .by }}) |>
    dplyr::summarise(value = max(value)) |>
    dplyr::pull(value)

  if (.format_as_str) format_count(value) else value
}

# Find the share of usage from the most used codes.
usage_top_share <- function(
  data,
  n,
  code = snomed_code,
  with_ties = FALSE,
  .format_as_str = TRUE
) {
  top_usage <- data |>
    dplyr::summarise(usage = sum(usage), .by = {{ code }}) |>
    dplyr::slice_max(usage, n = n, with_ties = with_ties)

  value <- sum(top_usage$usage) / usage_total(data, .format_as_str = FALSE)

  if (.format_as_str) format_percent(value) else value
}
