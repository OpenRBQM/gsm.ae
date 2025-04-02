#' Adverse Events Plugin UI
#'
#' @inheritParams shared-params
#'
#' @returns A [bslib::page_fillable()] with the AE plugin UI.
#' @export
mod_AE_UI <- function(id) {
  ns <- NS(id)
  bslib::page_fillable(
    mod_AEDashboard_UI(ns("dashboard"))
  )
}

#' Adverse Events Plugin Server
#'
#' @inheritParams shared-params
#'
#' @returns A module server function.
#' @export
mod_AE_Server <- function(
  id,
  rctv_dateSnapshot,
  rctv_dfAE,
  rctv_dfSUBJ
) {
  moduleServer(id, function(input, output, session) {
    mod_AEDashboard_Server(
      "dashboard",
      rctv_dateSnapshot,
      rctv_dfAE,
      rctv_dfSUBJ
    )
  })
}
