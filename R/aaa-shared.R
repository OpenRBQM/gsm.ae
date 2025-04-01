#' Parameters used in multiple functions
#'
#' Reused parameter definitions are gathered here for easier usage. Note: We
#' intentionally use `id` rather than the more standardized `strID` throughout
#' this package, because [shiny::testServer()] specifically expects an `id`
#' argument in module server functions.
#'
#' @param envCall `environment` The environment from which this function was
#'   called, for use in better error messages. This value should usually be left
#'   as the default, or passed from the calling function if the calling function
#'   also has an `envCall` argument.
#' @param envEvaluate `environment` The environment in which any variables used
#'   in the message or widget are defined. You almost definitely want to leave
#'   this as the default value.
#' @param fnInit `function` An initialization function such as
#'   [safetyCharts::init_aeExplorer()].
#' @param fnWidgetOutput `function` An [htmlwidgets::shinyWidgetOutput()]
#'   function.
#' @param id `character` The id for this element.
#' @param lData `list` Raw data for use in a safetyCharts widget.
#' @param lSettings `list` Named list of settings for a safetyCharts widget.
#' @param rctv_dateSnapshot `reactive Date` A [shiny::reactive()] object that
#'   returns the date of a data snapshot.
#' @param rctv_dfAE `reactive dataframe` A [shiny::reactive()] object that
#'   returns an adverse events domain dataframe.
#' @param rctv_dfSUBJ `reactive dataframe` A [shiny::reactive()] object that
#'   returns a subject domain dataframe.
#' @param rctv_strSiteID `reactive character` A [shiny::reactiveVal()] object
#'   that returns the `GroupID` of the selected site, and can be used to update
#'   the selected site.
#' @param rctv_strSubjectID `reactive character` A [shiny::reactive()] object
#'   that returns the `SubjectID` of the selected participant.
#' @param session `environment` Session from which to make a child scope (the
#'   default should almost always be used).
#' @param strWidgetName `character` The name of a widget in the gsm package.
#'
#' @name shared-params
#' @keywords internal
NULL
