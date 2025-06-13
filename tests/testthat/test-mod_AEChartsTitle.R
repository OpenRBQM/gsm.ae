test_that("mod_AEChartsTitle_UI produces the expected UI", {
  test_result <- mod_AEChartsTitle_UI(
    "testing",
    c("Label" = "value", "Label 2" = "value2")
  )
  expect_s3_class(test_result, c("bslib_fragment", "shiny.tag"))
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
      session$setInputs(`field` = "aeser")
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

      session$setInputs(`field` = "aetoxgr")
      expect_equal(session$returned(), "aetoxgr")
    }
  )
})

test_that("mod_AEChartsTitle_Server_Color works as expected", {
  call <- rlang::current_env()
  testServer(
    mod_AEChartsTitle_Server_Color,
    args = list(
      id = "testing",
      chrColors = c(Study = "#1b9e77", Group = "#d95f02", Subject = "#7570b3"),
      rctv_strGroupID = reactiveVal(NULL),
      rctv_strGroupLevel = reactiveVal("Site"),
      rctv_strSubjectID = reactiveVal(NULL)
    ),
    {
      session$setInputs(`field` = "aeser")
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

      session$setInputs(`field` = "aetoxgr")
      expect_equal(session$returned(), "aetoxgr")
    }
  )
})

test_that("mod_AEChartsTitle_Server_Color sets names if necessary", {
  call <- rlang::current_env()
  testServer(
    mod_AEChartsTitle_Server_Color,
    args = list(
      id = "testing",
      chrColors = c("#1b9e77", "#d95f02", "#7570b3"),
      rctv_strGroupID = reactiveVal(NULL),
      rctv_strGroupLevel = reactiveVal("Site"),
      rctv_strSubjectID = reactiveVal(NULL)
    ),
    {
      session$setInputs(`field` = "aeser")
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

      session$setInputs(`field` = "aetoxgr")
      expect_equal(session$returned(), "aetoxgr")
    }
  )
})
