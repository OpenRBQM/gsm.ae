#' AE Plugin Definition
#'
#' Plugins for gsm.app are defined by a named `list` with information about the
#' plugin. These can be loaded from a yaml file with [gsm.app::plugin_Read()].
#' We provide a ready-to-use plugin definition for this AE plugin.
#'
#' @returns A plugin definition for use in gsm.app.
#' @export
#'
#' @examples
#' pluginAE()
pluginAE <- function() {
  gsm.app::plugin_Define(
    strName = "Adverse Events",
    chrDomains = c("AE", "SUBJ"),
    fnShinyUI = mod_AE_UI,
    fnShinyServer = mod_AE_Server
  )
}
