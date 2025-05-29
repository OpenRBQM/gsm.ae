ValidateNames <- function(
  chrValues,
  envCall = rlang::caller_env()
) {
  # Fill in any missing names.
  names(chrValues) <- dplyr::coalesce(
    dplyr::na_if(rlang::names2(chrValues), ""),
    chrValues
  )
  return(chrValues)
}
