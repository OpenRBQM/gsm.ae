test_that("mod_AEDashboard_UI produces the expected UI", {
  # Capture/accept this warning until we verify that it goes away (which this
  # test should tell me).
  expect_warning(
    {
      test_result <- mod_AEDashboard_UI("testing")
    },
    "extra widths will be ignored"
  )
  expect_s3_class(test_result, c("bslib_fragment", "shiny.tag"))
  class(test_result) <- "shiny.tag"
  expect_snapshot({
    test_result
  })
})
