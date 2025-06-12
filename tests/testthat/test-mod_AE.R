test_that("mod_AE_UI produces the expected UI", {
  # Capture/accept this warning until we verify that it goes away (which this
  # test should tell me).
  expect_warning(
    {
      test_result <- mod_AE_UI("testing")
    },
    "extra widths will be ignored"
  )
  expect_s3_class(test_result, c("bslib_page", "shiny.tag.list", "list"))
  class(test_result) <- "shiny.tag.list"
  expect_cleaned_html({
    test_result
  })
})

test_that("mod_AE_Server initializes reactive variables", {
  call <- rlang::current_env()
  testServer(
    mod_AE_Server,
    args = list(
      id = "testing",
      dfAnalyticsInput = gsm.app::sample_dfAnalyticsInput,
      dfResults = gsm.app::sample_dfResults,
      rctv_dSnapshotDate = reactiveVal(as.Date("2012-03-31")),
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
      # All mod_AE_Server really does is set up some reactives that are used
      # deeper down.
      expect_equal(rctv_dSnapshotDatePrevious(), as.Date("2012-02-29"))
      rctv_dSnapshotDate(as.Date("2012-02-29"))
      expect_equal(rctv_dSnapshotDatePrevious(), as.Date("2012-01-31"))
      rctv_dSnapshotDate(as.Date("2012-01-31"))
      expect_true(is.na(rctv_dSnapshotDatePrevious()))

      expect_null(rctv_strGroupID_inferred())
      sample_strSubjectID <- gsm.app::sample_dfAnalyticsInput %>%
        dplyr::filter(GroupLevel == "Site") %>%
        dplyr::pull("SubjectID") %>%
        .[[1]]
      rctv_strSubjectID(sample_strSubjectID)
      expected_strGroupID <- gsm.app::sample_dfAnalyticsInput %>%
        dplyr::filter(GroupLevel == "Site") %>%
        dplyr::pull("GroupID") %>%
        .[[1]]
      expect_equal(rctv_strGroupID_inferred(), expected_strGroupID)
    }
  )
})
