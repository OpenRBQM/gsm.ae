test_that("SCWidgetOutput loads a widget", {
  expect_snapshot({
    SCWidgetOutput("myWidget", "aeExplorer")
  })
  expect_snapshot({
    aeExplorerOutput("myWidget")
  })
  expect_snapshot({
    aeTimelinesOutput("myWidget")
  })
})

test_that("render_aeExplorer generates a render function", {
  dfSubj <- gsm.app::sample_fnFetchData("SUBJ", strSubjectID = "0358")
  dfAE <- gsm.app::sample_fnFetchData("AE", strSubjectID = "0358")
  aes_settings <- list(
    id_col = "SubjectID",
    seq_col = "seq",
    stdy_col = "aest_dy",
    endy_col = "aeen_dy",
    term_col = "mdrpt_nsv",
    bodsys_col = "mdrsoc_nsv",
    severity_col = "aetoxgr",
    serious_col = "aeser"
  )
  test_result <- render_SC_Widget(
    lData = list(dm = dfSubj, aes = dfAE),
    lSettings = list(
      dm = list(
        id_col = "SubjectID"
      ),
      aes = aes_settings
    ),
    fnInit = safetyCharts::init_aeExplorer,
    strWidgetName = "aeExplorer"
  )
  expect_s3_class(test_result, c("aeExplorer", "suppress_viewer", "htmlwidget"))
  expect_s3_class(
    render_aeExplorer(test_result),
    c("shiny.render.function", "function")
  )
})

test_that("render_aeTimelines generates a render function", {
  dfAE <- gsm.app::sample_fnFetchData("AE", strSubjectID = "0358")
  aes_settings <- list(
    id_col = "SubjectID",
    seq_col = "seq",
    stdy_col = "aest_dy",
    endy_col = "aeen_dy",
    term_col = "mdrpt_nsv",
    bodsys_col = "mdrsoc_nsv",
    severity_col = "aetoxgr",
    serious_col = "aeser"
  )
  expect_s3_class(
    render_aeTimelines({
      render_SC_Widget(
        lData = dfAE,
        lSettings = aes_settings,
        fnInit = safetyCharts::init_aeTimelines,
        strWidgetName = "aeTimelines"
      )
    }),
    c("shiny.render.function", "function")
  )
})
