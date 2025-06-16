#' Fill Scale for Study, Group, and Subject
#'
#' @inheritParams shared-params
#' @returns A [ggplot2::scale_fill_discrete()].
#' @keywords internal
scale_fill_StudyGroupSubject <- function(
  chrColors = c(Study = "#1b9e77", Group = "#d95f02", Subject = "#7570b3")
) {
  ggplot2::scale_fill_discrete(type = unname(chrColors), guide = "none")
}

#' Standard Theme for AE Plots
#'
#' @returns A [ggplot2::theme()].
#' @keywords internal
theme_AE <- function() {
  ggplot2::theme_minimal(base_size = 20)
}
