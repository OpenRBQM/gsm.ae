#' Adverse Events Summary Card UI
#'
#' @inheritParams shared-params
#' @returns A [bslib::card()] with counts of AEs, SAEs, participants, and
#'   participants without AEs.
#' @keywords internal
mod_AESummary_UI <- function(id) {
  ns <- NS(id)
  out_DashboardCard(
    id = id,
    title = "Summary",
    gt::gt_output(ns("table"))
  )
}

#' Adverse Events Summary Card Server
#'
#' @inheritParams shared-params
#' @returns A module server function.
#' @keywords internal
mod_AESummary_Server <- function(
  id,
  dfAnalyticsInput,
  rctv_dSnapshotDate,
  rctv_dSnapshotDatePrevious,
  rctv_strGroupID,
  rctv_strGroupLevel,
  rctv_strSubjectID
) {
  # Set up what I need in the static dfs once, outside the module proper. I use
  # dfAnalyticsInput for everything to make it easier, even though I'm
  # duplicating some work from dfResults.
  dfResults_Study <- SummarizeAE(
    dfAnalyticsInput, c("MetricID", "SnapshotDate", "GroupLevel")
  )
  dfResults_Group <- SummarizeAE(
    dfAnalyticsInput, c("MetricID", "SnapshotDate", "GroupLevel", "GroupID")
  )
  dfResults_Subject <- SummarizeAE(
    dfAnalyticsInput, c("MetricID", "SnapshotDate", "GroupLevel", "GroupID", "SubjectID")
  )

  moduleServer(id, function(input, output, session) {
    # Filtered dfs ----
    rctv_dfResults_Study <- reactive({
      FilterByInputs(
        dfResults_Study,
        dSnapshotDate = rctv_dSnapshotDate(),
        strGroupLevel = rctv_strGroupLevel()
      ) %>%
        dplyr::select(-c("SnapshotDate", "GroupLevel"))
    })
    rctv_dfResults_Group <- reactive({
      if (is.null(rctv_strGroupID())) {
        return(EmptySummaryTable())
      }
      FilterByInputs(
        dfResults_Group,
        dSnapshotDate = rctv_dSnapshotDate(),
        strGroupID = rctv_strGroupID(),
        strGroupLevel = rctv_strGroupLevel()
      ) %>%
        dplyr::select(-c("SnapshotDate", "GroupLevel", "GroupID"))
    })
    rctv_dfResults_Subject <- reactive({
      if (is.null(rctv_strSubjectID())) {
        return(EmptySummaryTable())
      }
      FilterByInputs(
        dfResults_Subject,
        dSnapshotDate = rctv_dSnapshotDate(),
        strGroupID = rctv_strGroupID(),
        strGroupLevel = rctv_strGroupLevel(),
        strSubjectID = rctv_strSubjectID()
      ) %>%
        dplyr::select(-c("SnapshotDate", "GroupLevel", "GroupID", "SubjectID"))
    })

    # Output ----

    rctv_dfAESummary <- reactive({
      dfResults_Study <- rctv_dfResults_Study()
      dfResults_Group <- rctv_dfResults_Group()
      dfResults_Subject <- rctv_dfResults_Subject()

      df <- dplyr::tibble(
        observation = colnames(dfResults_Study),
        Study = unlist(dfResults_Study)
      )
      if (NROW(dfResults_Group)) {
        df$Group <- unlist(dfResults_Group)
        colnames(df)[[3]] <- rctv_strGroupLevel()
      }
      if (NROW(dfResults_Subject)) {
        df$Participant <- unlist(dfResults_Subject)
      }

      return(df)
    })

    output$table <- gt::render_gt({
      gt::gt(
        rctv_dfAESummary(),
        rowname_col = "observation",
        caption = "( ) = change since last snapshot"
      ) %>%
        gt::cols_align("center") %>%
        gt::cols_align("right", "observation") %>%
        gt::opt_row_striping() %>%
        gt::tab_style(
          style = gt::cell_text(whitespace = "nowrap"),
          locations = gt::cells_body()
        )
    })
  })
}

EmptySummaryTable <- function() {
  dplyr::tibble(
    "AE" = character(),
    "AE Rate" = character(),
    "SAE" = character(),
    "SAE Rate" = character(),
    "Days on Study" = character(),
    "Participants" = character(),
    " w/0 AE" = character()
  )
}

SummarizeAE <- function(
    dfAnalyticsInput,
    by = c("MetricID", "SnapshotDate", "GroupLevel", "GroupID", "SubjectID")
) {
  # I assume dfAnalyticsInput is valid, since it will always come from gsm.app
  # right now.
  format_delta <- scales::label_number(
    big.mark = ",",
    style_negative = "minus",
    style_positive = "plus"
  )
  format_number <- scales::label_number(big.mark = ",")
  dplyr::summarize(
    dfAnalyticsInput,
    n = sum(.data$Numerator),
    days = sum(.data$Denominator),
    rate = signif(.data$n/.data$days, 2),
    participants = dplyr::n(),
    participants0 = sum(.data$Numerator == 0),
    .by = dplyr::all_of(by)
  ) %>%
    tidyr::pivot_wider(
      names_from = "MetricID",
      values_from = c("n", "days", "rate", "participants", "participants0")
    ) %>%
    dplyr::mutate(
      d_AE = format_delta(.data$n_AE - dplyr::lag(.data$n_AE)),
      d_rate_AE = dplyr::if_else(
        .data$n_AE > 0,
        format_delta(.data$rate_AE - dplyr::lag(.data$rate_AE)),
        "0"
      ),
      d_SAE = format_delta(.data$n_SAE - dplyr::lag(.data$n_SAE)),
      d_rate_SAE = dplyr::if_else(
        .data$n_SAE > 0,
        format_delta(.data$rate_SAE - dplyr::lag(.data$rate_SAE)),
        "0"
      ),
      d_participants = format_delta(
        .data$participants_AE - dplyr::lag(.data$participants_AE)
      ),
      d_participants0 = format_delta(
        .data$participants0_AE - dplyr::lag(.data$participants0_AE)
      ),
      d_days = format_delta(
        .data$days_AE - dplyr::lag(.data$days_AE)
      ),
      dplyr::across(
        c(
          "n_AE",
          "rate_AE",
          "n_SAE",
          "rate_SAE",
          "participants_AE",
          "participants0_AE",
          "days_AE"
        ),
        format_number
      )
    ) %>%
    dplyr::mutate(
      AE = GlueDelta(.data$n_AE, .data$d_AE),
      "AE Rate" = GlueDelta(.data$rate_AE, .data$d_rate_AE),
      SAE = GlueDelta(.data$n_SAE, .data$d_SAE),
      "SAE Rate" = GlueDelta(.data$rate_SAE, .data$d_rate_SAE),
      "Days on Study" = GlueDelta(.data$days_AE, .data$d_days),
      "Participants" = GlueDelta(.data$participants_AE, .data$d_participants),
      " w/0 AE" = GlueDelta(.data$participants0_AE, .data$d_participants0)
    ) %>%
    dplyr::select(
      dplyr::any_of(setdiff(by, "MetricID")),
      "AE",
      "AE Rate",
      "SAE",
      "SAE Rate",
      "Days on Study",
      "Participants",
      " w/0 AE"
    )
}

GlueDelta <- function(n, d) {
  n <- dplyr::case_when(
    is.na(n) ~ "\u2014",
    !grepl("[^0.]", n) ~ "0",
    .default = n
  )
  d <- dplyr::case_when(
    is.na(d) ~ "",
    d == "0" ~ " (\u2014)",
    !grepl("[^0.]", d) ~ " (\u2014)",
    .default = glue::glue(" ({d})")
  )
  paste0(n, d)
}
