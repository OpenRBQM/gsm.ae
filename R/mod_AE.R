#' Adverse Events Plugin UI
#'
#' @inheritParams shared-params
#'
#' @returns A [bslib::page_fillable()] with the AE plugin UI.
#' @export
mod_AE_UI <- function(id) {
  ns <- NS(id)
  bslib::page_fillable(
    mod_AEDashboard_UI(ns("dashboard"))
  )
}

#' Adverse Events Plugin Server
#'
#' @inheritParams shared-params
#'
#' @returns A module server function.
#' @export
mod_AE_Server <- function(
  id,
  dfAnalyticsInput,
  dfResults,
  rctv_dSnapshotDate,
  rctv_dfAE,
  rctv_dfSUBJ,
  rctv_strSiteID,
  strCreatedField = "mincreated_dts",
  strMetricID_AE = "Analysis_kri0001",
  strMetricID_SAE = "Analysis_kri0002"
) {
  moduleServer(id, function(input, output, session) {
    rctv_dSnapshotDatePrevious <- reactive({
      dSnapshotDates <- as.Date(unique(dfResults$SnapshotDate))
      dSnapshotDatesPrevious <- dSnapshotDates[
        !is.na(dSnapshotDates) & dSnapshotDates < rctv_dSnapshotDate()
      ]
      if (length(dSnapshotDatesPrevious)) {
        return(max(dSnapshotDatesPrevious, na.rm = TRUE))
      }
      return(as.Date(NA, origin = "1970-01-01"))
    })
    mod_AEDashboard_Server(
      "dashboard",
      dfAnalyticsInput = dfAnalyticsInput,
      dfResults = dfResults,
      rctv_dSnapshotDate = rctv_dSnapshotDate,
      rctv_dSnapshotDatePrevious = rctv_dSnapshotDatePrevious,
      rctv_dfAE = rctv_dfAE,
      rctv_dfSUBJ = rctv_dfSUBJ,
      rctv_strSiteID = rctv_strSiteID,
      strCreatedField = strCreatedField,
      strMetricID_AE = strMetricID_AE,
      strMetricID_SAE = strMetricID_SAE
    )
  })
}
