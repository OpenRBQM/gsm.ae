test_that("mod_AEPrevalence_UI produces the expected UI", {
  test_result <- mod_AEPrevalence_UI("testing")
  expect_s3_class(test_result, c("bslib_fragment", "shiny.tag"))
  class(test_result) <- "shiny.tag"
  expect_cleaned_html({
    test_result
  })
  test_result <- mod_AEPrevalence_UI(
    "testing",
    chrCategoricalFields = c(other = "Other Thing")
  )
  class(test_result) <- "shiny.tag"
  expect_cleaned_html({
    test_result
  })
})

test_that("mod_AEPrevalence_Server works as expected", {
  testServer(
    mod_AEPrevalence_Server,
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
      session$setInputs(`title-field` = "aeser")
      test_result <- output$plot
      expect_type(test_result, "list")
      expect_setequal(
        test_result$coordmap$panels[[1]]$domain$discrete_limits$y,
        c("N", "Y")
      )

      session$setInputs(`title-field` = "aetoxgr")
      test_result <- output$plot
      expect_setequal(
        test_result$coordmap$panels[[1]]$domain$discrete_limits$y,
        as.character(1:5)
      )

      rctv_strGroupID("0X1221")
      session$flushReact()
      test_result <- output$plot
      expect_setequal(
        test_result$coordmap$panels[[1]]$domain$discrete_limits$y,
        as.character(1:5)
      )

      rctv_strSubjectID("S38022")
      session$flushReact()
      test_result <- output$plot
      expect_setequal(
        test_result$coordmap$panels[[1]]$domain$discrete_limits$y,
        as.character(1:5)
      )
    }
  )
})

test_that("mod_AEPrevalence_Server displays the expanded UI", {
  call <- rlang::current_env()
  testServer(
    mod_AEPrevalence_Server,
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
      session$setInputs(`title-field` = "aeser")
      test_result <- output$expandable
      expect_type(test_result, "list")
      expect_named(test_result, c("html", "deps"))
      test_html <- test_result$html
      expect_false(stringr::str_detect(test_html, "gt_shiny"))
      expect_cleaned_html(test_html, call = call)

      session$setInputs(`card_full_screen` = TRUE)
      test_html <- output$expandable$html
      expect_true(stringr::str_detect(test_html, "gt_shiny"))
      expect_cleaned_html(test_html, call = call)
    }
  )
})
