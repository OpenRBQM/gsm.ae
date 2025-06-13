test_that("scale_fill_StudyGroupSubject returns the expected object", {
  expect_snapshot({
    test_result <- scale_fill_StudyGroupSubject()
    test_result
  })
  expect_snapshot({
    test_result$palette(3)
  })
})

test_that("theme_AE returns the expected object", {
  expect_snapshot({
    test_result <- theme_AE()
    test_result
  })
  expect_equal(
    test_result$text$size,
    20
  )
})
