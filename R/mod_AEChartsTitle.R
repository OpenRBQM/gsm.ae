#' Charts Panel Title Block UI
#'
#' @inheritParams shared-params
#' @returns A [shiny::div()] with text "Prevalence of", then the category
#'   dropdown, then a span that will be filled with information about the
#'   grouping.
#' @keywords internal
mod_AEChartsTitle_UI <- function(id, chrFields) {
  ns <- NS(id)
  div(
    class = "inlineSelectInput",
    htmltools::htmlDependency(
      name = "inlineSelectInput",
      version = "1.0.0",
      src = "css",
      package = "gsm.ae",
      stylesheet = "inlineSelectInput.css"
    ),
    shinyWidgets::virtualSelectInput(
      ns("field"),
      NULL,
      chrFields,
      inline = TRUE
    ),
    uiOutput(ns("grouping"), inline = TRUE)
  )
}

#' Charts Panel Title Block Server
#'
#' @inheritParams shared-params
#'
#' @returns A [shiny::reactive()] with the selected category.
#' @keywords internal
mod_AEChartsTitle_Server <- function(
  id,
  rctv_strGroupID,
  rctv_strGroupLevel,
  rctv_strSubjectID
) {
  moduleServer(id, function(input, output, session) {
    output$grouping <- renderUI({
      groups <- c(
        'Study (<span style="color:#595959;">&#9644;</span>)',
        if (length(rctv_strGroupID())) {
          glue::glue(
            '{rctv_strGroupLevel()} (<span style="color:red;">&vert;</span>)'
          )
        },
        if (length(rctv_strSubjectID())) {
          "Participant (&bull;)"
        }
      )
      span("by", HTML(stringr::str_flatten_comma(groups, last = " and ")))
    })
    return(reactive({input$field}))
  })
}

#' Charts Panel Title Block Server (by color)
#'
#' @inheritParams shared-params
#'
#' @returns A [shiny::reactive()] with the selected category.
#' @keywords internal
mod_AEChartsTitle_Server_Color <- function(
  id,
  chrColors = c("#1b9e77", "#d95f02", "#7570b3"),
  rctv_strGroupID,
  rctv_strGroupLevel,
  rctv_strSubjectID
) {
  moduleServer(id, function(input, output, session) {
    output$grouping <- renderUI({
      groups <- c(
        glue::glue(
          '<span style="font-weight: bold; padding: 3px; color: white; background-color:{chrColors[[1]]};">Study</span>'
        ),
        if (length(rctv_strGroupID())) {
          glue::glue(
            '<span style="font-weight: bold; padding: 3px; color: white; background-color:{chrColors[[2]]};">{rctv_strGroupLevel()}</span>'
          )
        },
        if (length(rctv_strSubjectID())) {
          glue::glue(
            '<span style="font-weight: bold; padding: 3px; color: white; background-color:{chrColors[[3]]};">Participant</span>'
          )
        }
      )
      span("by", HTML(stringr::str_flatten_comma(groups, last = " and ")))
    })
    return(reactive({input$field}))
  })
}
