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
mod_AEDashboard_Server <- function(
  id,
  dfAnalyticsInput,
  dfResults,
  rctv_dSnapshotDate,
  rctv_dSnapshotDatePrevious,
  rctv_dfAE,
  rctv_dfSUBJ,
  rctv_strSiteID,
  strCreatedField = "mincreated_dts",
  strMetricID_AE = "Analysis_kri0001",
  strMetricID_SAE = "Analysis_kri0002"
) {
  shiny::moduleServer(id, function(input, output, session) {
    mod_AESummary_Server(
      "summary",
      dfAnalyticsInput = dfAnalyticsInput,
      dfResults = dfResults,
      rctv_dSnapshotDate = rctv_dSnapshotDate,
      rctv_dSnapshotDatePrevious = rctv_dSnapshotDatePrevious,
      rctv_strSiteID = rctv_strSiteID,
      strMetricID_AE = strMetricID_AE,
      strMetricID_SAE = strMetricID_SAE
    )
    # All dashboard cards will be called here (that's why this function looks
    # like it's unnecessary).
  })
}
