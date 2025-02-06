test_that("pluginAE returns the expected result", {
  local_mocked_bindings(
    mod_AE_UI = function(...) "This is mod_AE_UI",
    mod_AE_Server = function(...) "This is mod_AE_Server"
  )
  expect_snapshot(
    {
      pluginAE()
    },
    transform = \(x) {
      gsub("<environment: 0x[0-9a-f]+>", "<environment: xxxx>", x)
    }
  )
})
