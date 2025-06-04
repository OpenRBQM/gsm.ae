#' Swap Names and Values of an Object
#'
#' @param x `character` A character vector, or something that can be coerced to
#'   one.
#'
#' @returns A character vector, with what were previously the names as the
#'   values, and what were previously the values as names.
#' @keywords internal
SwapNamesForValues <- function(x) {
  rlang::set_names(
    names(x),
    x
  )
}

#' Make Sure a Vector of Fields is Named
#'
#' @inheritParams shared-params
#'
#' @returns The vector, named.
#' @keywords internal
ValidateNames <- function(chrFields, envCall = rlang::caller_env()) {
  # Fill in any missing names.
  names(chrFields) <- dplyr::coalesce(
    dplyr::na_if(rlang::names2(chrFields), ""),
    chrFields
  )
  return(chrFields)
}
