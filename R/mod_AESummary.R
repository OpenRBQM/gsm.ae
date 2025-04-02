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
    title = "Summary",
    uiOutput(ns("metadataList"))
  )
}

#' Adverse Events Summary Card Server
#'
#' @inheritParams shared-params
#' @returns A module server function.
#' @keywords internal
mod_AESummary_Server <- function(id, rctv_dateSnapshot, rctv_dfAE, rctv_dfSUBJ) {
  moduleServer(id, function(input, output, session) {
    rctv_intAE <- reactive({
      NROW(rctv_dfAE())
    })
    rctv_intAE_new <- reactive({
      dfAE <- rctv_dfAE()
      intAE_new <- 0L
      if (NROW(dfAE)) {
        # This should be mincreated_dts
        intAE_new <- dplyr::filter(dfAE, .data$aest_dt > rctv_dateSnapshot()) %>%
          nrow()
      }
      return(intAE_new)
    })
    rctv_intSAE <- reactive({
      dfAE <- rctv_dfAE()
      n_sae <- 0L
      if (NROW(dfAE)) {
        n_sae <- sum(dfAE$aeser == "Y")
      }
      return(n_sae)
    })
    rctv_intSAE_new <- reactive({
      dfAE <- rctv_dfAE()
      intSAE_new <- 0L
      if (NROW(dfAE)) {
        # This should be mincreated_dts
        intAE_new <- dplyr::filter(
          dfAE,
          .data$aeser == "Y",
          .data$aest_dt > rctv_dateSnapshot()
        ) %>%
          nrow()
      }
      return(intSAE_new)
    })
    rctv_intParticipants <- reactive({
      NROW(rctv_dfSUBJ())
    })
    rctv_intParticipants0 <- reactive({
      length(setdiff(rctv_dfSUBJ()$SubjectID, unique(rctv_dfAE()$SubjectID)))
    })

    output$metadataList <- renderUI({
      gsm.app::out_MetadataList(
        chrLabels = c(
          "Adverse Events", "Serious Adverse Events",
          "Participants", "Participants with 0 Adverse Events"
        ),
        chrValues = c(
          glue::glue("{rctv_intAE()} (new: {rctv_intAE_new()})"),
          glue::glue("{rctv_intSAE()} (new: {rctv_intSAE_new()})"),
          rctv_intParticipants(),
          rctv_intParticipants0()
        )
      )
    })
  })
}
