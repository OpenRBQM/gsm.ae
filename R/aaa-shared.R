#' Parameters used in multiple functions
#'
#' Reused parameter definitions are gathered here for easier usage. Note: We
#' intentionally use `id` rather than the more standardized `strID` throughout
#' this package, because [shiny::testServer()] specifically expects an `id`
#' argument in module server functions.
#'
#' @param chrCategoricalFields `character` A named vector of fields in `dfAE` to
#'   treat as categorical, where the names are the column names and the values
#'   are what to display to users. Unnamed elements will be used as both the
#'   field name and the display name. These fields are currently used in the
#'   Prevalence panel.
#' @param chrDateFields `character` A named vector of fields in `dfAE` to treat
#'   as dates, where the names are the column names and the values are what to
#'   display to users. Unnamed elements will be used as both the field name and
#'   the display name. These fields are currently used in the Timeline panel.
#' @param chrColors `character` Colors to use for a scale, labels, etc.
#' @param chrFields `character` A named vector of fields in `dfAE` to display in
#'   a drop-down menu, where the names are display values and the values are
#'   column names. Passed to [shinyWidgets::virtualSelectInput()] as `choices`.
#' @param chrMetricID_AE `character` The ID(s) of the adverse events metric(c).
#'   The default value is named by `GroupLevel`, but the names are not currently
#'   used. It is advisable to only provide one `MetricID` per `GroupLevel`,
#'   though.
#' @param chrMetricID_SAE `character` The ID(s) of the serious adverse events
#'   metric(s). The default value is named by `GroupLevel`, but the names are
#'   not currently used. It is advisable to only provide one `MetricID` per
#'   `GroupLevel`, though.
#' @param envCall `environment` The environment from which this function was
#'   called, for use in better error messages. This value should usually be left
#'   as the default, or passed from the calling function if the calling function
#'   also has an `envCall` argument.
#' @param id `character` The id for this element.
#' @param dfAnalyticsInput `data.frame` Participant-level metric data.
#' @param dfResults `data.frame` A stacked summary of analysis pipeline output.
#' @param ns `function` A namespace function, such as the one returned by
#'   [shiny::NS()].
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
#'
#' @name shared-params
#' @keywords internal
NULL
