#' Shiny bindings for safetyCharts widgets
#'
#' @inheritParams shared-params
#' @returns An [htmlwidgets::shinyWidgetOutput()] output function.
#' @keywords internal
SCWidgetOutput <- function(id, strWidgetName) {
  htmlwidgets::shinyWidgetOutput(
    id,
    name = strWidgetName,
    width = "100%",
    height = "100%",
    package = "safetyCharts"
  )
}

#' Shiny bindings for safetyCharts widgets
#'
#' @inheritParams shared-params
#' @returns An [htmlwidgets::shinyRenderWidget()] render function.
#' @keywords internal
shinyRenderSCWidget <- function(expr, envEvaluate, fnWidgetOutput) {
  htmlwidgets::shinyRenderWidget(
    expr,
    fnWidgetOutput,
    envEvaluate,
    quoted = TRUE,
    cacheHint = NULL
  )
}

#' Prepare and render a safetyCharts widget
#'
#' @inheritParams shared-params
#' @returns The result of a call to [safetyCharts::render_widget()] with the
#'   initialized data.
#' @keywords internal
render_SC_Widget <- function(lData, lSettings, fnInit, strWidgetName) {
  initialized <- fnInit(lData, lSettings)
  safetyCharts::render_widget(
    strWidgetName,
    initialized$data,
    initialized$settings
  )
}

#' Shiny bindings for safetyCharts aeExplorer widget
#'
#' @inheritParams shared-params
#' @inherit SCWidgetOutput return
#' @keywords internal
aeExplorerOutput <- function(id) {
  SCWidgetOutput(id, "aeExplorer")
}

#' Shiny bindings for safetyCharts aeExplorer widget
#'
#' @inheritParams shared-params
#' @inherit shinyRenderSCWidget return
#' @keywords internal
render_aeExplorer <- function(expr, envEvaluate = parent.frame()) {
  shinyRenderSCWidget(substitute(expr), envEvaluate, aeExplorerOutput)
}

#' Shiny bindings for safetyCharts aeTimelines widget
#'
#' @inheritParams shared-params
#' @inherit SCWidgetOutput return
#' @keywords internal
aeTimelinesOutput <- function(id) {
  SCWidgetOutput(id, "aeTimelines")
}

#' Shiny bindings for safetyCharts aeTimelines widget
#'
#' @inheritParams shared-params
#' @inherit shinyRenderSCWidget return
#' @keywords internal
render_aeTimelines <- function(expr, envEvaluate = parent.frame()) {
  shinyRenderSCWidget(substitute(expr), envEvaluate, aeTimelinesOutput)
}
