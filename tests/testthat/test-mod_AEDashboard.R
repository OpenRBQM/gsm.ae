test_that("mod_AEDashboard_UI produces the expected UI", {
  test_result <- mod_AEDashboard_UI("testing")
  expect_s3_class(test_result, c("bslib_fragment", "shiny.tag"))
  class(test_result) <- "shiny.tag"
  expect_snapshot({
    test_result
  })
})
