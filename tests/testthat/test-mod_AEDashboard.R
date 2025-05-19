test_that("mod_AEDashboard_UI produces the expected UI", {
  test_result <- mod_AEDashboard_UI("testing")
  expect_s3_class(test_result, c("bslib_fragment", "shiny.tag"))
  class(test_result) <- "shiny.tag"
  expect_snapshot({
    test_result
  })
})

test_that("mod_AEDashboard_Server works as expected", {
  call <- rlang::current_env()
  # mod_AE_Server() processes input dfs.
  strMetricID_AE <- "Analysis_kri0001"
  strMetricID_SAE <- "Analysis_kri0002"
  dfAnalyticsInput <- gsm.app::sample_dfAnalyticsInput %>%
    dplyr::filter(.data$MetricID %in% c(strMetricID_AE, strMetricID_SAE)) %>%
    dplyr::mutate(
      MetricID = dplyr::case_match(
        .data$MetricID,
        strMetricID_AE ~ "AE",
        strMetricID_SAE ~ "SAE"
      ),
      dplyr::across(
        c("Numerator", "Denominator"),
        as.integer
      )
    ) %>%
    dplyr::arrange(
      .data$GroupLevel,
      .data$GroupID,
      .data$SubjectID,
      .data$MetricID,
      .data$SnapshotDate
    )
  testServer(
    mod_AEDashboard_Server,
    args = list(
      id = "testing",
      dfAnalyticsInput = dfAnalyticsInput,
      rctv_dSnapshotDate = reactiveVal(as.Date("2020-01-01")),
      rctv_dSnapshotDatePrevious = reactiveVal(as.Date("2019-01-01")),
      # rctv_dfAE = reactive({
      #   gsm.app::sample_fnFetchData("AE")
      # }),
      # rctv_dfSUBJ = reactive({
      #   gsm.app::sample_fnFetchData("SUBJ")
      # }),
      rctv_strGroupID = reactiveVal(NULL),
      rctv_strGroupLevel = reactiveVal("Site"),
      rctv_strSubjectID = reactiveVal(NULL)
    ),
    {
      test_result <- output$`summary-table`
      expect_type(test_result, "list")
      expect_named(test_result, c("html", "deps"))
      test_html <- test_result$html
      expect_cleaned_html(test_html, call = call)

      rctv_dSnapshotDate(as.Date("2019-01-01"))
      rctv_dSnapshotDatePrevious(as.Date("2018-01-01"))
      session$flushReact()
      test_result <- output$`summary-table`
      test_html <- test_result$html
      expect_cleaned_html(test_html, call = call)
    }
  )
})
