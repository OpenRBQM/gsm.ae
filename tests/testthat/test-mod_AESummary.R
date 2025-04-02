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
      rctv_dateSnapshot = reactiveVal(as.Date("2019-01-01")),
      rctv_dfAE = reactive({gsm.app::sample_fnFetchData("AE")}),
      rctv_dfSUBJ = reactive({gsm.app::sample_fnFetchData("SUBJ")})
    ),
    {
      test_result <- output$metadataList
      expect_type(test_result, "list")
      expect_named(test_result, c("html", "deps"))
      test_html <- test_result$html
      expect_cleaned_html(test_html, call = call)

      rctv_dateSnapshot(as.Date("2019-02-01"))
      test_result <- output$metadataList
      test_html <- test_result$html
      expect_cleaned_html(test_html, call = call)
    }
  )
})
