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
  sample_strSubjectID <- gsm.app::sample_dfAnalyticsInput %>%
    dplyr::filter(GroupLevel == "Site") %>%
    dplyr::pull("SubjectID") %>%
    .[[1]]
  sample_strGroupID <- gsm.app::sample_dfAnalyticsInput %>%
    dplyr::filter(GroupLevel == "Site") %>%
    dplyr::pull("GroupID") %>%
    .[[1]]

  testServer(
    mod_AESummary_Server,
    args = list(
      id = "testing",
      dfAnalyticsInput = PrepareGSMData(gsm.app::sample_dfAnalyticsInput),
      rctv_dSnapshotDate = reactiveVal(as.Date("2012-03-31")),
      rctv_dSnapshotDatePrevious = reactiveVal(as.Date("2012-02-29")),
      rctv_strGroupID = reactiveVal(NULL),
      rctv_strGroupLevel = reactiveVal("Site"),
      rctv_strSubjectID = reactiveVal(NULL)
    ),
    {
      test_result <- output$table
      expect_type(test_result, "list")
      expect_named(test_result, c("html", "deps"))
      test_html <- test_result$html
      expect_cleaned_html(test_html, call = call)

      rctv_strGroupID(sample_strGroupID)
      session$flushReact()
      test_result <- output$table
      test_html <- test_result$html
      expect_cleaned_html(test_html, call = call)

      rctv_strSubjectID(sample_strSubjectID)
      session$flushReact()
      test_result <- output$table
      test_html <- test_result$html
      expect_cleaned_html(test_html, call = call)

      rctv_dSnapshotDate(as.Date("2012-02-29"))
      rctv_dSnapshotDatePrevious(as.Date("2012-01-31"))
      session$flushReact()
      test_result <- output$table
      test_html <- test_result$html
      expect_cleaned_html(test_html, call = call)
    }
  )
})
