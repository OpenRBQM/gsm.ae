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
  strMetricID_AE = "Analysis_kri0001",
  strMetricID_SAE = "Analysis_kri0002"
) {
  chrCategoricalFields <- ValidateNames(chrCategoricalFields)
  lCategoricalFieldsDefinitions <- rlang::set_names(
    rep(
      list(list(type = "character")),
      length(chrCategoricalFields) - 1
    ),
    setdiff(names(chrCategoricalFields), "aeser")
  )

  gsm.app::plugin_Define(
    strName = "Adverse Events",
    lSpec = list(
      AE = c(
        list(
          aest_dt = list(type = "Date"),
          aeser = list(type = "character"),
          SubjectID = list(type = "character"),
          GroupID = list(type = "character"),
          GroupLevel = list(type = "character")
        ),
        lCategoricalFieldsDefinitions
      ),
      SUBJ = list(
        SubjectID = list(type = "character")
      )
    ),
    fnShinyUI = mod_AE_UI,
    fnShinyServer = mod_AE_Server,
    chrCategoricalFields = chrCategoricalFields,
    strMetricID_AE = strMetricID_AE,
    strMetricID_SAE = strMetricID_SAE
  )
}
