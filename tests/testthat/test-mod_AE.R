test_that("mod_AE_UI produces the expected UI", {
  test_result <- mod_AE_UI("testing")
  expect_s3_class(test_result, c("bslib_page", "shiny.tag.list", "list"))
  class(test_result) <- "shiny.tag.list"
  expect_cleaned_html({
    test_result
  })
})

test_that("mod_AE_Server works as expected", {
  call <- rlang::current_env()
  testServer(
    mod_AE_Server,
    args = list(
      id = "testing",
      dfAnalyticsInput = gsm.app::sample_dfAnalyticsInput,
      dfResults = gsm.app::sample_dfResults,
      rctv_dSnapshotDate = reactiveVal(as.Date("2019-01-01")),
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
      test_result <- output$`dashboard-summary-table`
      expect_type(test_result, "list")
      expect_named(test_result, c("html", "deps"))
      test_html <- test_result$html
      expect_cleaned_html(test_html, call = call)

      rctv_dSnapshotDate(as.Date("2019-01-01"))
      session$flushReact()
      test_result <- output$`dashboard-summary-table`
      test_html <- test_result$html
      expect_cleaned_html(test_html, call = call)
      expect_false(is.na(rctv_dSnapshotDatePrevious()))

      rctv_dSnapshotDate(as.Date("2018-01-01"))
      session$flushReact()
      expect_true(is.na(rctv_dSnapshotDatePrevious()))

      expect_null(rctv_strGroupID_inferred())

      rctv_strSubjectID("0358")
      expect_equal(rctv_strGroupID_inferred(), "0X001")
    }
  )
})
