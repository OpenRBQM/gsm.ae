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
      shiny::tags$em("Placeholder: Site rates of attributes compared to study (Relatedness, Grade, Action Taken, ongoing/resolved,outcome). Per Jon will assess if we can include any available.")
    ),
    out_DashboardCard(
      id = ns("top_soc"),
      "Top SOC",
      shiny::tags$em("Placeholder: Compare top SOC for the study to whatever is selected - either site or country e.g., Gastro site 25%, study 75%\nIn order to identify Systems or Organ Classes (SOCs) with particular issues in AEs, as a CM/RA, I would like to see counts/% by SOC, for site and (if data is subset) selected thing.")
    ),
    out_DashboardCard(
      id = ns("data_quality"),
      "Data Quality",
      shiny::tags$em("Placeholder: Box plot to show distribution of time to AE entry and Queries on AE forms\nAverage time to entry for AEs (date of next visit after AE start date, until the mincreated date) at the study and selected level (site or country).\nQueries on AE forms (count with ability to details on demand the queries) - no update to data model needed. Based on output received from DM/CP (on DNA tab), add to deep dive app.")
    ),
    out_DashboardCard(
      id = ns("timelines"),
      "Timelines",
      shiny::tags$em("Placeholder: Filter on category and then surface count of safety PDs by time. For AE timeline use the mincreated date. Ideally be able to have a zoom bar that we could zoom into specific timeframes. Separate tab for details and heatmap calendar\nNeed to add safety-related PDs to development data. Spencer to confirm/derive AE delayed data entry")
    ),
    out_DashboardCard(
      id = ns("participant_summary"),
      "Participant Summary",
      shiny::tags$em("Placeholder: Participant ID, AE count (# since last snapshot), time on study, participant AE rate")
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
  rctv_strGroupID,
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
      rctv_strGroupID = rctv_strGroupID,
      strMetricID_AE = strMetricID_AE,
      strMetricID_SAE = strMetricID_SAE
    )
    # All dashboard cards will be called here (that's why this function looks
    # like it's unnecessary).
  })
}
