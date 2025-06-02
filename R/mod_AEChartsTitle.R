#' Charts Panel Title Block UI
#'
#' @inheritParams shared-params
#' @returns A [shiny::div()] with text "Prevalence of", then the category
#'   dropdown, then a span that will be filled with information about the
#'   grouping.
#' @keywords internal
mod_AEChartsTitle_UI <- function(id, chrDescriptor, chrFields) {
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
    chrDescriptor,
    " of ",
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
            ', {rctv_strGroupLevel()} (<span style="color:red;">&vert;</span>)'
          )
        },
        if (length(rctv_strSubjectID())) {
          ", and Participant (&bull;)"
        }
      )
      span("by", HTML(rlang::inject({paste0(!!!groups)})))
    })
    return(reactive({input$field}))
  })
}
