#' Adverse Events Plugin UI
#'
#' @inheritParams shared-params
#'
#' @returns A [bslib::navset_card_underline()] with the main AE plugin UI.
#' @export
mod_AE_UI <- function(id) {
  ns <- NS(id)
  bslib::navset_card_underline(
    id = ns("selected_tab"),
    title = "Adverse Events",
    bslib::nav_panel(
      "Dashboard",
      mod_AEDashboard_UI(ns("dashboard"))
    ),
    bslib::nav_panel(
      "Explorer",
      aeExplorerOutput(ns("explorer"))
    ),
    bslib::nav_panel(
      "Timeline",
      aeTimelinesOutput(ns("timeline"))
    ),
    full_screen = TRUE
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
  rctv_dfAE,
  rctv_dfSUBJ,
  rctv_strSiteID,
  rctv_strSubjectID
) {
  moduleServer(id, function(input, output, session) {
    rctv_dfAE_mod <- reactive({
      dfAE <- rctv_dfAE()
      if (NROW(dfAE)) {
        dfAE <- dfAE %>%
          dplyr::inner_join(rctv_dfSUBJ(), by = "SubjectID") %>%
          dplyr::mutate(
            aetoxgr = toupper(
              sub("^out of bound:", "", .data$aetoxgr)
            ),
            aest_dy = .data$aest_dt - .data$firstparticipantdate + 1L,
            aeen_dy = .data$aeen_dt - .data$firstparticipantdate + 1L
          ) %>%
          dplyr::arrange(
            .data$SubjectID,
            .data$aest_dy,
            .data$aeen_dy,
            .data$mdrpt_nsv,
            .data$aetoxgr
          ) %>%
          dplyr::mutate(
            seq = dplyr::row_number(),
            .by = "SubjectID"
          )
      }
    })
    aes_settings <- list(
      id_col = "SubjectID",
      seq_col = "seq",
      stdy_col = "aest_dy",
      endy_col = "aeen_dy",
      term_col = "mdrpt_nsv",
      bodsys_col = "mdrsoc_nsv",
      severity_col = "aetoxgr",
      serious_col = "aeser"
    )
    mod_AEDashboard_Server("dashboard", rctv_dfAE_mod)
    output$explorer <- render_aeExplorer({
      dfAE <- rctv_dfAE_mod()
      if (NROW(dfAE)) {
        render_SC_Widget(
          lData = list(dm = rctv_dfSUBJ(), aes = dfAE),
          lSettings = list(
            dm = list(
              id_col = "SubjectID"
            ),
            aes = aes_settings
          ),
          fnInit = safetyCharts::init_aeExplorer,
          strWidgetName = "aeExplorer"
        )
      }
    })
    output$timeline <- render_aeTimelines({
      dfAE <- rctv_dfAE_mod()
      if (NROW(dfAE)) {
        render_SC_Widget(
          lData = dfAE,
          lSettings = aes_settings,
          fnInit = safetyCharts::init_aeTimelines,
          strWidgetName = "aeTimelines"
        )
      }
    })
  })
}
