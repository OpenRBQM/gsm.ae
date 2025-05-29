#' Charts Panel Title Block UI
#'
#' @inheritParams shared-params
#' @returns A [shiny::div()] with text "Prevalence of", then the category
#'   dropdown, then a span that will be filled with information about the
#'   grouping.
#' @keywords internal
mod_AEChartsTitle_UI <- function(
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
  chrCategoricalFields <- rlang::set_names(
    names(chrCategoricalFields),
    chrCategoricalFields
  )
  div(
    class = "inlineSelectInput",
    htmltools::htmlDependency(
      name = "inlineSelectInput",
      version = "1.0.0",
      src = "css",
      package = "gsm.ae",
      stylesheet = "inlineSelectInput.css"
    ),
    "Prevalence of ",
    shinyWidgets::virtualSelectInput(
      ns("category"),
      NULL,
      chrCategoricalFields,
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
      groups <- list(
        HTML(
          'Study (<span style="color:#595959;">&#9607;</span>)'
        ),
        if (length(rctv_strGroupID())) {
          HTML(
            glue::glue(
              ', {rctv_strGroupLevel()} (<span style="color:red;">&vert;</span>)'
            )
          )
        },
        if (length(rctv_strSubjectID())) {
          HTML(", and Participant (&bull;)")
        }
      )
      span("by", !!!groups)
    })
    return(reactive({input$category}))
  })
}
