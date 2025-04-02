#' Dashboard Tab UI
#'
#' @inheritParams shared-params
#' @returns A [bslib::layout_columns()] layout with information about the AE
#'   domain.
#' @keywords internal
mod_AEDashboard_UI <- function(id) {
  ns <- shiny::NS(id)
  bslib::layout_columns(
    mod_AESummary_UI(id = ns("summary")),
    out_DashboardCard(
      id = ns("charts"),
      "Charts",
      "(placeholder)"
    ),
    out_DashboardCard(
      id = ns("top_soc"),
      "Top SOC",
      "(placeholder)"
    ),
    out_DashboardCard(
      id = ns("data_quality"),
      "Data Quality",
      "(placeholder)"
    ),
    out_DashboardCard(
      id = ns("timelines"),
      "Timelines",
      "(placeholder)"
    ),
    out_DashboardCard(
      id = ns("participant_summary"),
      "Participant Summary",
      "(placeholder)"
    ),
    col_widths = c(4, 4, 4, 4, 4, 4)
  )
}

#' Standardized cards for dashboard tab
#'
#' @inheritParams shared-params
#' @returns A [bslib::card()] with appropriate size and title.
#' @keywords internal
out_DashboardCard <- function(id, title, ...) {
  bslib::card(
    id = id,
    bslib::card_title(title),
    full_screen = TRUE,
    min_height = "300px",
    ...
  )
}

#' Dashboard Tab Server
#'
#' @inheritParams shared-params
#' @returns A module server function.
#' @keywords internal
mod_AEDashboard_Server <- function(id, rctv_dateSnapshot, rctv_dfAE, rctv_dfSUBJ) {
  shiny::moduleServer(id, function(input, output, session) {
    mod_AESummary_Server("summary", rctv_dateSnapshot, rctv_dfAE, rctv_dfSUBJ)
    # All dashboard cards will be called here (that's why this function looks
    # like it's unnecessary).
  })
}
