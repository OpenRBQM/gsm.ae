test_that("mod_AECharts_UI produces the expected UI", {
  test_result <- mod_AECharts_UI("testing")
  expect_s3_class(test_result, c("bslib_fragment", "shiny.tag"))
  class(test_result) <- "shiny.tag"
  expect_cleaned_html({
    test_result
  })
  test_result <- mod_AECharts_UI(
    "testing",
    chrCategoricalFields = c(other = "Other Thing")
  )
  class(test_result) <- "shiny.tag"
  expect_cleaned_html({
    test_result
  })
})

test_that("mod_AECharts_Server works as expected", {
  testServer(
    mod_AECharts_Server,
    args = list(
      id = "testing",
      rctv_dfAE_Study = reactive({
        gsm.app::sample_fnFetchData("AE")
      }),
      rctv_strGroupID = reactiveVal(NULL),
      rctv_strGroupLevel = reactiveVal("Site"),
      rctv_strSubjectID = reactiveVal(NULL)
    ),
    {
      session$setInputs(`title-category` = "aeser")
      test_result <- output$plot
      expect_type(test_result, "list")
      expect_setequal(
        test_result$coordmap$panels[[1]]$domain$discrete_limits$y,
        c("N", "Y")
      )

      session$setInputs(`title-category` = "aetoxgr")
      test_result <- output$plot
      expect_setequal(
        test_result$coordmap$panels[[1]]$domain$discrete_limits$y,
        as.character(1:5)
      )

      rctv_strGroupID("0X1145")
      session$flushReact();
      test_result <- output$plot
      expect_setequal(
        test_result$coordmap$panels[[1]]$domain$discrete_limits$y,
        as.character(1:5)
      )

      rctv_strSubjectID("S75378")
      session$flushReact()
      test_result <- output$plot
      expect_setequal(
        test_result$coordmap$panels[[1]]$domain$discrete_limits$y,
        as.character(1:5)
      )
    }
  )
})

test_that("CountField works as expected", {
  expect_null(CountField(NULL, field = "whatever"))
  df <- dplyr::tibble(a = character())
  expect_identical(CountField(df, field = "whatever"), df)

  # Normal use is tested via usage.
})
