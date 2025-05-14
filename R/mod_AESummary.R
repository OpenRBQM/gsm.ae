#' Adverse Events Summary Card UI
#'
#' @inheritParams shared-params
#' @returns A [bslib::card()] with counts of AEs, SAEs, participants, and
#'   participants without AEs.
#' @keywords internal
mod_AESummary_UI <- function(id) {
  ns <- NS(id)
  out_DashboardCard(
    id = id,
    title = shiny::textOutput(ns("title"), inline = TRUE),
    uiOutput(ns("metadataList"))
  )
}

#' Adverse Events Summary Card Server
#'
#' @inheritParams shared-params
#' @returns A module server function.
#' @keywords internal
mod_AESummary_Server <- function(
  id,
  dfAnalyticsInput,
  dfResults,
  rctv_dSnapshotDate,
  rctv_dSnapshotDatePrevious,
  rctv_strGroupID,
  strMetricID_AE = "Analysis_kri0001",
  strMetricID_SAE = "Analysis_kri0002"
) {
  moduleServer(id, function(input, output, session) {
    rctv_bSiteIsSelected <- reactive({
      strSiteID <- gsm.app:::NullifyEmpty(rctv_strGroupID())
      as.logical(length(strSiteID))
    })
    output$title <- renderText({
      if (rctv_bSiteIsSelected()) {
        return(glue::glue("Summary for Site {rctv_strGroupID()}"))
      }
      return("Summary for Overall Study")
    })
    rctv_dfResults_current <- reactive({
      df <- dplyr::filter(dfResults, .data$SnapshotDate == rctv_dSnapshotDate())
      if (rctv_bSiteIsSelected()) {
        df <- dplyr::filter(df, .data$GroupID == rctv_strGroupID())
      }
      return(df)
    })
    rctv_dfResults_previous <- reactive({
      df <- dplyr::filter(
        dfResults,
        .data$SnapshotDate == rctv_dSnapshotDatePrevious()
      )
      if (rctv_bSiteIsSelected()) {
        df <- dplyr::filter(df, .data$GroupID == rctv_strGroupID())
      }
      return(df)
    })

    SumMetricIDNumerator <- function(df, strMetricID) {
      sum(df$Numerator[df$MetricID == strMetricID])
    }

    rctv_intAE_current <- reactive({
      SumMetricIDNumerator(rctv_dfResults_current(), strMetricID_AE)
    })
    rctv_intAE_previous <- reactive({
      SumMetricIDNumerator(rctv_dfResults_previous(), strMetricID_AE)
    })
    rctv_intAE_new <- reactive({
      rctv_intAE_current() - rctv_intAE_previous()
    })

    rctv_intSAE_current <- reactive({
      SumMetricIDNumerator(rctv_dfResults_current(), strMetricID_SAE)
    })
    rctv_intSAE_previous <- reactive({
      SumMetricIDNumerator(rctv_dfResults_previous(), strMetricID_SAE)
    })
    rctv_intSAE_new <- reactive({
      rctv_intSAE_current() - rctv_intSAE_previous()
    })

    rctv_dfAnalyticsInput <- reactive({
      df <- dfAnalyticsInput
      if ("SnapshotDate" %in% colnames(df)) {
        df <- dplyr::filter(df, .data$SnapshotDate == rctv_dSnapshotDate())
      }
      if (rctv_bSiteIsSelected()) {
        df <- dplyr::filter(df, .data$GroupID == rctv_strGroupID())
      }
      return(df)
    })

    rctv_AllParticipants <- reactive({
      unique(rctv_dfAnalyticsInput()$SubjectID)
    })
    rctv_ParticipantsWithAE <- reactive({
      df <- rctv_dfAnalyticsInput()
      x <- unique(
        df$SubjectID[df$MetricID == strMetricID_AE & df$Numerator > 0]
      )
    })
    rctv_intParticipants <- reactive({
      length(rctv_AllParticipants())
    })
    rctv_intParticipants0 <- reactive({
      length(
        setdiff(
          rctv_AllParticipants(),
          rctv_ParticipantsWithAE()
        )
      )
    })

    output$metadataList <- renderUI({
      gsm.app::out_MetadataList(
        chrLabels = c(
          "Adverse Events", "Serious Adverse Events",
          "Participants", "Participants with 0 Adverse Events"
        ),
        chrValues = c(
          glue::glue("{rctv_intAE_current()} (new: {rctv_intAE_new()})"),
          glue::glue("{rctv_intSAE_current()} (new: {rctv_intSAE_new()})"),
          rctv_intParticipants(),
          rctv_intParticipants0()
        )
      )
    })
  })
}
