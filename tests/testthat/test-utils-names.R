test_that("SwapNamesForValues swaps names for values", {
  letLET <- rlang::set_names(letters, LETTERS)
  LETlet <- rlang::set_names(LETTERS, letters)
  expect_identical(
    SwapNamesForValues(letLET), LETlet
  )
  expect_identical(
    SwapNamesForValues(LETlet), letLET
  )
})

test_that("ValidateNames fills in names", {
  given <- c(a = "x", "b", c = "z")
  named <- rlang::set_names(given, c("a", "b", "c"))
  expect_identical(ValidateNames(given), named)
})
