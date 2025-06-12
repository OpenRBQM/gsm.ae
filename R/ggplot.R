scale_fill_StudyGroupSubject <- function(
  chrColors = c(Study = "#1b9e77", Group = "#d95f02", Subject = "#7570b3")
) {
  ggplot2::scale_fill_discrete(type = unname(chrColors), guide = "none")
}

theme_AE <- function() {
  ggplot2::theme_minimal(base_size = 20)
}
