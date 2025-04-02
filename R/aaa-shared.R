#' Parameters used in multiple functions
#'
#' Reused parameter definitions are gathered here for easier usage. Note: We
#' intentionally use `id` rather than the more standardized `strID` throughout
#' this package, because [shiny::testServer()] specifically expects an `id`
#' argument in module server functions.
#'
#' @param id `character` The id for this element.
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
#'
#' @name shared-params
#' @keywords internal
NULL
