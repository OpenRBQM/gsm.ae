#' Parameters used in multiple functions
#'
#' Reused parameter definitions are gathered here for easier usage. Note: We
#' intentionally use `id` rather than the more standardized `strID` throughout
#' this package, because [shiny::testServer()] specifically expects an `id`
#' argument in module server functions.
#'
#' @param id `character` The id for this element.
#' @param dfAnalyticsInput `data.frame` Participant-level metric data.
#' @param dfResults `data.frame` A stacked summary of analysis pipeline output.
#' @param rctv_dSnapshotDate `reactive Date` A [shiny::reactive()] object that
#'   returns the date of a data snapshot.
#' @param rctv_dSnapshotDatePrevious `reactive Date` A [shiny::reactive()]
#'   object that returns the date of a data snapshot immediately before
#'   `rctv_dSnapshotDate`, or `NA` if there aren't any snapshots before the
#'   selected date.
#' @param rctv_dfAE `reactive dataframe` A [shiny::reactive()] object that
#'   returns an adverse events domain dataframe.
#' @param rctv_dfAE_Study `reactive dataframe` A [shiny::reactive()] object that
#'   returns a study-level adverse events domain dataframe.
#' @param rctv_dfSUBJ `reactive dataframe` A [shiny::reactive()] object that
#'   returns a subject domain dataframe.
#' @param rctv_strGroupID `reactive character` A [shiny::reactiveVal()] object
#'   that returns the `GroupID` of the selected group (usually site), and can be
#'   used to update which group is selected.
#' @param rctv_strGroupLevel `reactive character` A [shiny::reactiveVal()]
#'   object that returns the selected `GroupLevel`.
#' @param rctv_strSubjectID `reactive character` A [shiny::reactive()] object
#'   that returns the `SubjectID` of the selected participant.
#' @param session `environment` Session from which to make a child scope (the
#'   default should almost always be used).
#' @param strField_Created `length-1 character` The field that indicates when
#'   the adverse event was logged. Defaults to `"mincreated_dts"`.
#' @param strField_GroupActive `length-1 character` The field that indicates
#'   when the group (usually site or country) became active. Defaults to
#'   `"site_active_dt"`.
#' @param strField_StudyActive `length-1 character` The field that indicates
#'   when the study became active. Defaults to `"act_fpfv"`.
#' @param strMetricID_AE `length-1 character` The ID of the adverse events
#'   metric. Defaults to `"Analysis_kri0001"`.
#' @param strMetricID_SAE `length-1 character` The ID of the serious adverse
#'   events metric. Defaults to `"Analysis_kri0001"`.
#'
#' @name shared-params
#' @keywords internal
NULL
