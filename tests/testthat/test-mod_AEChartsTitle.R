test_that("mod_AEChartsTitle_UI produces the expected UI", {
  test_result <- mod_AEChartsTitle_UI("testing")
  expect_s3_class(test_result, c("bslib_fragment", "shiny.tag"))
  class(test_result) <- "shiny.tag"
  expect_cleaned_html({
    test_result
  })
  test_result <- mod_AEChartsTitle_UI(
    "testing",
    chrCategoricalFields = c(other = "Other Thing")
  )
  class(test_result) <- "shiny.tag"
  expect_cleaned_html({
    test_result
  })
})

test_that("mod_AEChartsTitle_Server works as expected", {
  call <- rlang::current_env()
  testServer(
    mod_AEChartsTitle_Server,
    args = list(
      id = "testing",
      rctv_strGroupID = reactiveVal(NULL),
      rctv_strGroupLevel = reactiveVal("Site"),
      rctv_strSubjectID = reactiveVal(NULL)
    ),
    {
      session$setInputs(`category` = "aeser")
      test_result <- output$grouping
      expect_type(test_result, "list")
      expect_named(test_result, c("html", "deps"))
      test_html <- test_result$html
      expect_cleaned_html(test_html, call = call)

      rctv_strGroupID("12345")
      session$flushReact()
      test_result <- output$grouping
      expect_cleaned_html(test_result$html, call = call)

      rctv_strSubjectID("6789")
      session$flushReact()
      test_result <- output$grouping
      expect_cleaned_html(test_result$html, call = call)

      expect_s3_class(session$returned, "reactive")
      expect_equal(session$returned(), "aeser")

      session$setInputs(`category` = "aetoxgr")
      expect_equal(session$returned(), "aetoxgr")
    }
  )
})
