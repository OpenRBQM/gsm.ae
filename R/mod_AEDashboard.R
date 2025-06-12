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
  ),
  chrDateFields = c(
    mincreated_dts = "AE Entry Date",
    aest_dt = "AE Start Date",
    aeen_dt = "AE End Date"
  )
) {
  ns <- NS(id)
  bslib::layout_columns(
    mod_AESummary_UI(id = ns("summary")),
    mod_AEPrevalence_UI(id = ns("prevalence"), chrCategoricalFields = chrCategoricalFields),
    mod_AETimeline_UI(id = ns("timeline"), chrDateFields = chrDateFields)
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
  ),
  chrDateFields = c(
    mincreated_dts = "AE Entry Date",
    aest_dt = "AE Start Date",
    aeen_dt = "AE End Date"
  )
) {
  # Leaving these with nocov because this just calls all the server functions
  # without doing anything fancy with them.
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
    mod_AEPrevalence_Server(
      "prevalence",
      rctv_dfAE_Study = rctv_dfAE_Study,
      rctv_strGroupID = rctv_strGroupID,
      rctv_strGroupLevel = rctv_strGroupLevel,
      rctv_strSubjectID = rctv_strSubjectID,
      chrCategoricalFields = chrCategoricalFields
    )
    mod_AETimeline_Server(
      "timeline",
      rctv_dfAE_Study = rctv_dfAE_Study,
      rctv_strGroupID = rctv_strGroupID,
      rctv_strGroupLevel = rctv_strGroupLevel,
      rctv_strSubjectID = rctv_strSubjectID,
      chrDateFields = chrDateFields
    )
  })
  # nocov end
}
