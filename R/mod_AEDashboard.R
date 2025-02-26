#' Dashboard Tab UI
#'
#' @inheritParams shared-params
#' @returns A [bslib::layout_columns()] layout with information about the AE
#'   domain.
#' @keywords internal
mod_AEDashboard_UI <- function(id) {
  ns <- shiny::NS(id)
  bslib::layout_columns(
    bslib::value_box(
      "# of AE",
      shiny::textOutput(ns("ae_count")),
      id = ns("n_ae")
    ),
    bslib::value_box(
      "# of SAE",
      shiny::textOutput(ns("sae_count")),
      id = ns("n_sae")
    ),
    bslib::card(
      bslib::card_title("Severity"),
      full_screen = TRUE,
      shiny::plotOutput(ns("severity_bars")),
      id = ns("n_severity")
    )
  )
}

#' Dashboard Tab Server
#'
#' @inheritParams shared-params
#' @returns A module server function.
#' @keywords internal
mod_AEDashboard_Server <- function(id, rctv_dfAE) {
  shiny::moduleServer(id, function(input, output, session) {
    output$ae_count <- shiny::renderText({
      NROW(rctv_dfAE())
    })
    output$sae_count <- shiny::renderText({
      dfAE <- rctv_dfAE()
      n_sae <- 0L
      if (NROW(dfAE)) {
        n_sae <- sum(dfAE$aeser == "Y")
      }
      return(n_sae)
    })
    output$severity_bars <- shiny::renderPlot({
      shiny::req(rctv_dfAE())
      dfAE <- rctv_dfAE()
      ggplot2::ggplot(dfAE) +
        ggplot2::theme_minimal(base_size = 20) +
        ggplot2::theme(
          panel.grid = ggplot2::element_blank(),
          axis.title = ggplot2::element_blank(),
          axis.text.y = ggplot2::element_blank()
        ) +
        ggplot2::aes(x = .data$aetoxgr) +
        ggplot2::geom_bar(fill = "#007BC2") +
        ggplot2::geom_text(
          stat = "count",
          ggplot2::aes(label = ggplot2::after_stat(.data$count)),
          vjust = -0.5,
          size = ggplot2::rel(5)
        )
    })
  })
}
