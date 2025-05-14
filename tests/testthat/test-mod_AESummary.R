test_that("mod_AESummary_UI produces the expected UI", {
  test_result <- mod_AESummary_UI("testing")
  expect_s3_class(test_result, c("bslib_fragment", "shiny.tag"))
  class(test_result) <- "shiny.tag"
  expect_cleaned_html({
    test_result
  })
})

test_that("mod_AESummary_Server works as expected", {
  call <- rlang::current_env()
  testServer(
    mod_AESummary_Server,
    args = list(
      id = "testing",
      dfAnalyticsInput = gsm.app::sample_dfAnalyticsInput,
      dfResults = gsm.app::sample_dfResults,
      rctv_dSnapshotDate = reactiveVal(as.Date("2020-01-01")),
      rctv_dSnapshotDatePrevious = reactiveVal(as.Date("2019-01-01")),
      rctv_strGroupID = reactiveVal("All"),
      strMetricID_AE = "Analysis_kri0001",
      strMetricID_SAE = "Analysis_kri0002"
    ),
    {
      test_result <- output$metadataList
      expect_type(test_result, "list")
      expect_named(test_result, c("html", "deps"))
      test_html <- test_result$html
      expect_cleaned_html(test_html, call = call)

      rctv_strGroupID("0X159")
      session$flushReact()
      test_result <- output$title
      expect_equal(output$title, "Summary for Site 0X159")

      test_result <- output$metadataList
      test_html <- test_result$html
      expect_cleaned_html(test_html, call = call)

      rctv_strGroupID("All")
      rctv_dSnapshotDate(as.Date("2019-01-01"))
      rctv_dSnapshotDatePrevious(as.Date("2018-01-01"))
      session$flushReact()
      test_result <- output$metadataList
      test_html <- test_result$html
      expect_cleaned_html(test_html, call = call)
    }
  )
})
