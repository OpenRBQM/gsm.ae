#' Dashboard Tab UI
#'
#' @inheritParams shared-params
#' @returns A [bslib::layout_columns()] layout with information about the AE
#'   domain.
#' @keywords internal
mod_AEDashboard_UI <- function(
  id,
  chrCategoricalFields = c(
    aeser = "Serious?",
    mdrpt_nsv = "Preferred Term",
    mdrsoc_nsv = "System Organ Class",
    aetoxgr = "Toxicity Grade",
    aeongo = "Ongoing?",
    aerel = "Related?"
  )
) {
  ns <- NS(id)
  bslib::layout_columns(
    mod_AESummary_UI(id = ns("summary")),
    mod_AECharts_UI(id = ns("charts"), chrCategoricalFields = chrCategoricalFields),
    out_DashboardCard(
      id = ns("data_quality"),
      "Data Quality",
      tags$em("Placeholder: Box plot to show distribution of time to AE entry and Queries on AE forms\nAverage time to entry for AEs (date of next visit after AE start date, until the mincreated date) at the study and selected level (site or country).\nQueries on AE forms (count with ability to details on demand the queries) - no update to data model needed. Based on output received from DM/CP (on DNA tab), add to deep dive app.")
    ),
    out_DashboardCard(
      id = ns("top_soc"),
      "Top SOC",
      tags$em("Placeholder: Compare top SOC for the study to whatever is selected - either site or country e.g., Gastro site 25%, study 75%\nIn order to identify Systems or Organ Classes (SOCs) with particular issues in AEs, as a CM/RA, I would like to see counts/% by SOC, for site and (if data is subset) selected thing.")
    ),
    col_widths = c(-2, 4, 4, -2, -2, 4, 4, -2)
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
  rctv_dSnapshotDate,
  rctv_dSnapshotDatePrevious,
  rctv_dfAE_Study,
  rctv_strGroupID,
  rctv_strGroupLevel,
  rctv_strSubjectID,
  chrCategoricalFields = c(
    aeser = "Serious?",
    mdrpt_nsv = "Preferred Term",
    mdrsoc_nsv = "System Organ Class",
    aetoxgr = "Toxicity Grade",
    aeongo = "Ongoing?",
    aerel = "Related?"
  )
) {
  # All dashboard card server functions will be called here. That's why this
  # function looks like it's unnecessary. Since it doesn't have other contents,
  # there's nothing to test yet.
  #
  # nocov start
  moduleServer(id, function(input, output, session) {
    mod_AESummary_Server(
      "summary",
      dfAnalyticsInput = dfAnalyticsInput,
      rctv_dSnapshotDate = rctv_dSnapshotDate,
      rctv_dSnapshotDatePrevious = rctv_dSnapshotDatePrevious,
      rctv_strGroupID = rctv_strGroupID,
      rctv_strGroupLevel = rctv_strGroupLevel,
      rctv_strSubjectID = rctv_strSubjectID
    )
    mod_AECharts_Server(
      "charts",
      rctv_dfAE_Study = rctv_dfAE_Study,
      rctv_strGroupID = rctv_strGroupID,
      rctv_strGroupLevel = rctv_strGroupLevel,
      rctv_strSubjectID = rctv_strSubjectID,
      chrCategoricalFields = chrCategoricalFields
    )
  })
  # nocov end
}
