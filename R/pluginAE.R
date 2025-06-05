#' AE Plugin Definition
#'
#' Plugins for gsm.app are defined by a named `list` with information about the
#' plugin. These can be loaded from a yaml file with [gsm.app::plugin_Read()].
#' We provide a ready-to-use plugin definition for this AE plugin.
#'
#' @returns A plugin definition for use in gsm.app.
#' @inheritParams shared-params
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
    mincreated_dts = "AE Created",
    aest_dt = "AE Start",
    aeen_dt = "AE End"
  ),
  strMetricID_AE = "Analysis_kri0001",
  strMetricID_SAE = "Analysis_kri0002"
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
    strMetricID_AE = strMetricID_AE,
    strMetricID_SAE = strMetricID_SAE
  )
}
