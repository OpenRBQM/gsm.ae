#' AE Plugin Definition
#'
#' Plugins for gsm.app are defined by a named `list` with information about the
#' plugin. We provide a ready-to-use plugin definition for this AE plugin.
#'
#' @returns A plugin definition for use in gsm.app.
#' @inheritParams shared-params
#' @inheritParams gsm.app::plugin_Define
#' @export
#'
#' @examples
#' pluginAE()
pluginAE <- function(
  chrCategoricalFields = c(
    aeser = "Serious?",
    mdrpt_nsv = "Preferred Term",
    mdrsoc_nsv = "System Organ Class",
    aetoxgr = "Toxicity Grade",
    aeongo = "Ongoing?",
    aerel = "Related?"
  ),
  chrDateFields = c(
    mincreated_dts = "AE Entry Date",
    aest_dt = "AE Start Date",
    aeen_dt = "AE End Date"
  ),
  chrMetricID_AE = c(Site = "Analysis_kri0001", Country = "Analysis_cou0001"),
  chrMetricID_SAE = c(Site = "Analysis_kri0002", Country = "Analysis_cou0002"),
  lWorkflows = list()
) {
  chrCategoricalFields <- ValidateNames(chrCategoricalFields)
  chrDateFields <- ValidateNames(chrDateFields)
  lCategoricalFieldsDefinitions <- rlang::set_names(
    rep(
      list(list(type = "character")),
      length(chrCategoricalFields)
    ),
    names(chrCategoricalFields)
  )
  lDateFieldsDefinitions <- rlang::set_names(
    rep(
      list(list(type = "Date")),
      length(chrDateFields)
    ),
    names(chrDateFields)
  )
  lSpec_AE <- c(
    list(
      SubjectID = list(type = "character"),
      GroupID = list(type = "character"),
      GroupLevel = list(type = "character")
    ),
    lCategoricalFieldsDefinitions,
    lDateFieldsDefinitions
  )
  lSpec_AE <- lSpec_AE[unique(names(lSpec_AE))]

  gsm.app::plugin_Define(
    strName = "Adverse Events",
    lSpec = list(
      AE = lSpec_AE,
      SUBJ = list(
        SubjectID = list(type = "character")
      )
    ),
    fnShinyUI = mod_AE_UI,
    fnShinyServer = mod_AE_Server,
    chrCategoricalFields = chrCategoricalFields,
    chrDateFields = chrDateFields,
    chrMetricID_AE = chrMetricID_AE,
    chrMetricID_SAE = chrMetricID_SAE,
    lWorkflows = lWorkflows
  )
}
