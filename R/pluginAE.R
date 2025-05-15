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
  strField_Created = "mincreated_dts",
  strMetricID_AE = "Analysis_kri0001",
  strMetricID_SAE = "Analysis_kri0002"
) {
  gsm.app::plugin_Define(
    strName = "Adverse Events",
    lSpec = list(
      AE = list(
        aest_dt = list(type = "Date"),
        aeser = list(type = "character"),
        SubjectID = list(type = "character"),
        mincreated_dts = list(type = "character")
      ),
      SUBJ = list(
        SubjectID = list(type = "character")
      )
    ),
    fnShinyUI = mod_AE_UI,
    fnShinyServer = mod_AE_Server,
    strField_Created = strField_Created,
    strMetricID_AE = strMetricID_AE,
    strMetricID_SAE = strMetricID_SAE
  )
}
