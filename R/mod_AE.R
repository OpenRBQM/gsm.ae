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
  rctv_strGroupID,
  rctv_strGroupLevel,
  rctv_strSubjectID,
  strMetricID_AE = "Analysis_kri0001",
  strMetricID_SAE = "Analysis_kri0002"
) {
  dfAnalyticsInput <- PrepareGSMData(dfAnalyticsInput)
  dfResults <- PrepareGSMData(dfResults)

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
    # Ideally this should happen in gsm.app, see
    # https://github.com/Gilead-BioStats/gsm.app/issues/449
    rctv_strGroupID_inferred <- reactive({
      strGroupID <- rctv_strGroupID()
      strSubjectID <- rctv_strSubjectID()
      if (is.null(strGroupID) && length(strSubjectID) == 1) {
        test1 <- dfAnalyticsInput$SubjectID == strSubjectID
        test2 <- dfAnalyticsInput$GroupLevel == rctv_strGroupLevel()
        return(
          dfAnalyticsInput$GroupID[test1 & test2][[1]]
        )
      }
      return(strGroupID)
    }) %>%
      bindCache(rctv_strSubjectID(), rctv_strGroupID(), rctv_strGroupLevel())
    mod_AEDashboard_Server(
      "dashboard",
      dfAnalyticsInput = dfAnalyticsInput,
      rctv_dSnapshotDate = rctv_dSnapshotDate,
      rctv_dSnapshotDatePrevious = rctv_dSnapshotDatePrevious,
      rctv_strGroupID = rctv_strGroupID_inferred,
      rctv_strGroupLevel = rctv_strGroupLevel,
      rctv_strSubjectID = rctv_strSubjectID
    )
  })
}

PrepareGSMData <- function(
  df,
  strMetricID_AE = "Analysis_kri0001",
  strMetricID_SAE = "Analysis_kri0002"
) {
  df %>%
    dplyr::filter(
      .data$MetricID %in% c(strMetricID_AE, strMetricID_SAE),
      .data$Denominator > 0
    ) %>%
    dplyr::mutate(
      MetricID = dplyr::case_match(
        .data$MetricID,
        strMetricID_AE ~ "AE",
        strMetricID_SAE ~ "SAE"
      ),
      dplyr::across(
        c("Numerator", "Denominator"),
        as.integer
      )
    ) %>%
    dplyr::arrange(
      .data$SnapshotDate,
      .data$GroupLevel,
      .data$GroupID,
      .data$MetricID
    )
}
