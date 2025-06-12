test_that("mod_AETimeline_UI produces the expected UI", {
  test_result <- mod_AETimeline_UI("testing")
  expect_s3_class(test_result, c("bslib_fragment", "shiny.tag"))
  class(test_result) <- "shiny.tag"
  expect_cleaned_html({
    test_result
  })
})

test_that("mod_AETimeline_Server works as expected", {
  testServer(
    mod_AETimeline_Server,
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
      session$setInputs(`title-field` = "mincreated_dts")
      test_result <- output$plot
      expect_type(test_result, "list")
      # This is super fragile, but it will work for now.
      expect_length(test_result$coordmap$panels, 1)
      expect_equal(
        test_result$coordmap$panels[[1]]$domain$top, 175
      )

      session$setInputs(`title-field` = "aest_dt")
      session$flushReact()
      test_result <- output$plot
      expect_length(test_result$coordmap$panels, 1)
      expect_equal(
        test_result$coordmap$panels[[1]]$domain$top, 175
      )

      session$setInputs(`title-field` = "aeen_dt")
      session$flushReact()
      test_result <- output$plot
      expect_length(test_result$coordmap$panels, 1)
      expect_equal(
        test_result$coordmap$panels[[1]]$domain$top, 168
      )

      rctv_strGroupID("0X1221")
      session$flushReact()
      test_result <- output$plot
      expect_length(test_result$coordmap$panels, 2)
      expect_equal(
        test_result$coordmap$panels[[1]]$domain$top, 168
      )
      expect_equal(
        test_result$coordmap$panels[[2]]$domain$top, 5
      )

      rctv_strSubjectID("S38022")
      session$flushReact()
      test_result <- output$plot
      expect_length(test_result$coordmap$panels, 3)
      expect_equal(
        test_result$coordmap$panels[[1]]$domain$top, 168
      )
      expect_equal(
        test_result$coordmap$panels[[2]]$domain$top, 5
      )
      expect_equal(
        test_result$coordmap$panels[[3]]$domain$top, 2
      )
    }
  )
})
