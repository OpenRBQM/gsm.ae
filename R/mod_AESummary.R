mod_AESummary_UI <- function(id) {
  ns <- NS(id)
  summary_data <- c(
    AE = "99 (new: 9)",
    SAE = "9 (new: 1)",
    Participants = 999,
    Participants0 = 9
  )
  out_DashboardCard(
    id = id,
    title = "Summary",
    uiOutput(ns("metadataList"))
  )
}

mod_AESummary_Server <- function(id, rctv_dateSnapshot, rctv_dfAE, rctv_dfSUBJ) {
  moduleServer(id, function(input, output, session) {
    # TODO: This should come in as an argument.
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
      summary_data <- c(
        `Adverse Events` = glue::glue(
          "{rctv_intAE()} (new: {rctv_intAE_new()})"
        ),
        `Serious Adverse Events` = glue::glue(
          "{rctv_intSAE()} (new: {rctv_intSAE_new()})"
        ),
        Participants = rctv_intParticipants(),
        `Particpiants with 0 Adverse Events` = rctv_intParticipants0()
      )
      gsm.app::out_MetadataList(
        chrLabels = names(summary_data),
        chrValues = unname(summary_data)
      )
    })
  })

}
