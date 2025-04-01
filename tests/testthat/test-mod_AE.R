test_that("mod_AE_UI produces the expected UI", {
  test_result <- mod_AE_UI("testing")
  expect_s3_class(test_result, c("bslib_page", "shiny.tag.list", "list"))
  class(test_result) <- "shiny.tag.list"
  expect_cleaned_html({
    test_result
  })
})
