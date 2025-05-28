#' Adverse Events Charts Panel UI
#'
#' @inheritParams shared-params
#' @returns A [bslib::card()] for visualizing categorical variables in the AE
#'   data.
#' @keywords internal
mod_AECharts_UI <- function(
  id,
  chrCategoricalFields = c(
    aeser = "Serious?",
    mdrpt_nsv = "Preferred Term",
    mdrsoc_nsv = "System Organ Class",
    aetoxgr = "Toxicity Grade",
    aeongo = "Ongoing?",
    aerel = "Related?"
  )
) {
  ns <- NS(id)
  out_DashboardCard(
    id = id,
    title = "Charts",
    mod_AEChartsTitle_UI(
      ns("title"),
      chrCategoricalFields = chrCategoricalFields
    ),
    plotOutput(ns("plot"))
  )
}

#' Adverse Events Charts Panel Server
#'
#' @inheritParams shared-params
#' @returns A module server function.
#' @keywords internal
mod_AECharts_Server <- function(
  id,
  rctv_dfAE_Study,
  rctv_strGroupID,
  rctv_strGroupLevel,
  rctv_strSubjectID,
  chrCategoricalFields = c(
    aeser = "Serious?",
    mdrpt_nsv = "Preferred Term",
    mdrsoc_nsv = "System Organ Class",
    aetoxgr = "Toxicity Grade",
    aeongo = "Ongoing?",
    aerel = "Related?"
  )
) {
  moduleServer(id, function(input, output, session) {
    rctv_strCategory <- mod_AEChartsTitle_Server(
      "title",
      rctv_strGroupID = rctv_strGroupID,
      rctv_strGroupLevel = rctv_strGroupLevel,
      rctv_strSubjectID = rctv_strSubjectID
    )

    rctv_dfAE_Counts_Study <- reactive({
      req(rctv_dfAE_Study())
      req(rctv_strCategory())
      CountField(rctv_dfAE_Study(), rctv_strCategory())
    })

    rctv_dfAE_Counts_Group <- reactive({
      req(rctv_dfAE_Counts_Study())
      req(rctv_strGroupID())
      req(rctv_strCategory())

      dfAE_Counts_Group <- CountField(
        rctv_dfAE_Study(),
        rctv_strCategory(),
        by = c("GroupLevel", "GroupID")
      ) %>%
        dplyr::filter(
          .data$GroupLevel == rctv_strGroupLevel(),
          .data$GroupID == rctv_strGroupID()
        )
      rctv_dfAE_Counts_Study() %>%
        dplyr::left_join(
          dfAE_Counts_Group,
          by = rctv_strCategory(),
          suffix = c("_Study", "_Group")
        ) %>%
        dplyr::mutate(
          dplyr::across(
            dplyr::starts_with("pct"),
            ~ tidyr::replace_na(.x, 0)
          )
        ) %>%
        dplyr::mutate(
          y_min = as.numeric(factor(.data[[rctv_strCategory()]])) - 0.5,
          y_max = as.numeric(factor(.data[[rctv_strCategory()]])) + 0.5
        )
    })

    rctv_dfAE_Counts_Subject <- reactive({
      req(rctv_dfAE_Counts_Study())
      req(rctv_strGroupID())
      req(rctv_strSubjectID())
      req(rctv_strCategory())

      dfAE_Counts_Subject <- CountField(
        rctv_dfAE_Study(),
        rctv_strCategory(),
        by = c("GroupLevel", "GroupID", "SubjectID")
      ) %>%
        dplyr::filter(
          .data$GroupLevel == rctv_strGroupLevel(),
          .data$GroupID == rctv_strGroupID(),
          .data$SubjectID == rctv_strSubjectID()
        )
      rctv_dfAE_Counts_Study() %>%
        dplyr::left_join(
          dfAE_Counts_Subject,
          by = rctv_strCategory(),
          suffix = c("_Study", "_Subject")
        ) %>%
        dplyr::mutate(
          dplyr::across(
            dplyr::starts_with("pct"),
            ~ tidyr::replace_na(.x, 0)
          )
        )
    })

    output$plot <- renderPlot({
      req(rctv_dfAE_Counts_Study())
      req(rctv_strCategory())
      ggplot2::ggplot(rctv_dfAE_Counts_Study()) +
        ggplot2::aes(y = .data[[rctv_strCategory()]]) +
        ggplot2::geom_col(ggplot2::aes(x = .data$pct)) +
        ggplot2::scale_x_continuous(
          limits = c(0, 1),
          labels = scales::label_percent()
        ) +
        ggplot2::theme_minimal(base_size = 20) +
        ggplot2::labs(
          x = "% of AEs",
          y = chrCategoricalFields[[rctv_strCategory()]]
        ) +
        {if (length(rctv_strGroupID()) && NROW(rctv_dfAE_Counts_Group())) {
          ggplot2::geom_segment(
            ggplot2::aes(
              x = .data$pct_Group,
              xend = .data$pct_Group,
              y = .data$y_min,
              yend = .data$y_max
            ),
            data = rctv_dfAE_Counts_Group(),
            linewidth = 0.8,
            color = "red"
          )
        }} +
        {if (length(rctv_strSubjectID()) && NROW(rctv_dfAE_Counts_Subject())) {
          ggplot2::geom_point(
            ggplot2::aes(x = .data$pct_Subject),
            data = rctv_dfAE_Counts_Subject()
          )
        }} +
        ggplot2::theme(legend.position = "none")
    })
  })
}

CountField <- function(df, field, by = NULL) {
  if (!NROW(df)) {
    return(df)
  }
  df %>%
    dplyr::summarize(n = dplyr::n(), .by = dplyr::all_of(c(field, by))) %>%
    dplyr::mutate(
      pct = .data$n / sum(.data$n),
      .by = dplyr::all_of(by)
    )
}
