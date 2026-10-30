# Set the plot style.
theme_proms <- function(base_size = 13) {
  ggplot2::theme_classic(base_size = base_size) +
    ggplot2::theme(
      panel.grid.major = ggplot2::element_line(
        colour = "gray90",
        linetype = "dotted"
      ),
      strip.text = ggplot2::element_text(face = "bold"),
      strip.background = ggplot2::element_blank(),
      strip.text.x = ggplot2::element_text(size = base_size, face = "bold")
    )
}

# Plot usage over time.
plot_usage_trend <- function(
  data,
  x,
  y,
  group,
  panel_label,
  x_breaks,
  caption = NULL,
  position = ggplot2::position_identity(),
  y_jitter_abs = 0
) {
  summarised <- data |>
    dplyr::group_by({{ x }}, {{ group }}) |>
    dplyr::summarise(
      .usage = sum({{ y }}),
      .groups = "drop"
    )

  group_values <- dplyr::pull(summarised, {{ group }})
  group_number <- if (is.factor(group_values)) {
    as.integer(group_values)
  } else {
    match(group_values, unique(group_values))
  }
  n_groups <- dplyr::n_distinct(group_values)

  summarised |>
    dplyr::mutate(
      .panel = panel_label,
      .usage = .usage +
        (group_number - ceiling(n_groups / 2)) * y_jitter_abs
    ) |>
    ggplot2::ggplot(ggplot2::aes(
      y = .usage,
      x = {{ x }},
      colour = {{ group }},
      shape = {{ group }}
    )) +
    ggplot2::geom_line(alpha = 0.2, position = position) +
    ggplot2::geom_point(size = 2, position = position) +
    ggplot2::labs(
      x = "End date of yearly reporting period",
      y = "Recorded events",
      colour = NULL,
      shape = NULL,
      caption = caption
    ) +
    ggplot2::scale_x_date(
      breaks = x_breaks,
      labels = scales::label_date("%b\n%Y")
    ) +
    ggplot2::scale_y_continuous(
      labels = scales::label_number(accuracy = 1),
      limits = c(0, NA)
    ) +
    ggplot2::facet_wrap(~.panel, ncol = 1) +
    theme_proms()
}

# Style a manuscript table.
style_manuscript_table <- function(gt_table) {
  gt_table |>
    gt::tab_style(
      style = gt::cell_text(weight = "bold"),
      locations = gt::cells_column_labels(columns = dplyr::everything())
    ) |>
    gt::tab_style(
      style = gt::cell_text(v_align = "top"),
      locations = gt::cells_body(columns = dplyr::everything())
    ) |>
    gt::tab_style(
      style = gt::cell_text(weight = "bold"),
      locations = gt::cells_row_groups()
    )
}

# Count usage of old codes as their linked new code, using the new code's
# description.
combine_linked_codes <- function(data, linked_codes) {
  data |>
    dplyr::mutate(
      is_old_code = snomed_code %in% names(linked_codes),
      snomed_code = dplyr::coalesce(
        unname(linked_codes[snomed_code]),
        snomed_code
      )
    ) |>
    dplyr::mutate(
      description = dplyr::first(
        description[!is_old_code],
        default = dplyr::first(description)
      ),
      .by = snomed_code
    ) |>
    dplyr::summarise(
      usage = sum(usage),
      .by = c(start_date, end_date, snomed_code, description)
    )
}
