# Launch the ShinyApp (Do not remove this comment)
if (grepl("gsm\\.ae", getwd()) ||
    !("gsm.ae" %in% list.files(.libPaths()))) {
  pkgload::load_all(".", export_all = FALSE, attach_testthat = FALSE)
} else {
  library(gsm.ae)
}
library(gsm.app)

gsm.app::run_gsm_app(
  dfAnalyticsInput = gsm.app::sample_dfAnalyticsInput,
  dfBounds = gsm.app::sample_dfBounds,
  dfGroups = gsm.app::sample_dfGroups,
  dfMetrics = gsm.app::sample_dfMetrics,
  dfResults = gsm.app::sample_dfResults,
  fnFetchData = gsm.app::sample_fnFetchData,
  lPlugins = list(pluginAE()),
  strTitle = Sys.getenv("GSMAPP_TITLE", "gsm.ae Demo"),
  strFavicon = Sys.getenv("GSMAPP_FAVICON", "comment-medical"),
  strFaviconColor = Sys.getenv("GSMAPP_FAVICONCOLOR", gsm.app::ColorScheme("red"))
)
