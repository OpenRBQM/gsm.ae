#' Adverse Events Prevalence Panel UI
#'
#' @inheritParams shared-params
#' @returns A [bslib::card()] for visualizing categorical variables in the AE
#'   data.
#' @keywords internal
mod_AEPrevalence_UI <- function(
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
    title = "Prevalence",
    mod_AEChartsTitle_UI(
      ns("title"),
      chrDescriptor = "Prevalence",
      chrFields = rlang::set_names(
        names(chrCategoricalFields),
        chrCategoricalFields
      )
    ),
    plotOutput(ns("plot"))
  )
}

#' Adverse Events Prevalence Panel Server
#'
#' @inheritParams shared-params
#' @returns A module server function.
#' @keywords internal
mod_AEPrevalence_Server <- function(
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

    rctv_chrTop5_Study <- reactive({
      req(rctv_dfAE_Counts_Study())
      req(rctv_strCategory())
      if (!NROW(rctv_dfAE_Counts_Study())) {
        return(character()) # nocov
      }
      rctv_dfAE_Counts_Study() %>%
        dplyr::arrange(dplyr::desc(.data$pct)) %>%
        dplyr::pull(.data[[rctv_strCategory()]]) %>%
        utils::head(5) %>%
        as.character()
    })

    rctv_chrTop5_Group <- reactive({
      req(rctv_strCategory())
      if (!length(rctv_strGroupID()) || !NROW(rctv_dfAE_Counts_Group())) {
        return(character())
      }
      rctv_dfAE_Counts_Group() %>%
        dplyr::arrange(dplyr::desc(.data$pct_Group)) %>%
        dplyr::pull(.data[[rctv_strCategory()]]) %>%
        utils::head(5) %>%
        as.character()
    })

    rctv_chrTop5_Subject <- reactive({
      req(rctv_strCategory())
      if (!length(rctv_strSubjectID()) || !NROW(rctv_dfAE_Counts_Subject())) {
        return(character())
      }
      rctv_dfAE_Counts_Subject() %>%
        dplyr::arrange(dplyr::desc(.data$pct_Subject)) %>%
        dplyr::pull(.data[[rctv_strCategory()]]) %>%
        utils::head(5) %>%
        as.character()
    })

    rctv_chrTop5 <- reactive({
      req(rctv_strCategory())
      c(
        rctv_chrTop5_Subject(),
        rctv_chrTop5_Group(),
        rctv_chrTop5_Study()
      ) %>%
        unique() %>%
        utils::head(5) %>%
        sort()
    })

    output$plot <- renderPlot({
      req(rctv_dfAE_Counts_Study())
      req(rctv_strCategory())
      strCategory <- rctv_strCategory()
      chrTop5 <- rctv_chrTop5()
      rctv_dfAE_Counts_Study() %>%
        dplyr::mutate(
          category = dplyr::if_else(
            .data[[strCategory]] %in% chrTop5,
            .data[[strCategory]],
            "Other"
          ) %>%
            factor(levels = c(chrTop5, "Other"), ordered = TRUE)
        ) %>%
        dplyr::summarize(
          pct = sum(.data$pct),
          .by = "category"
        ) %>%
        ggplot2::ggplot() +
        ggplot2::aes(y = .data$category) +
        ggplot2::geom_col(ggplot2::aes(x = .data$pct)) +
        ggplot2::scale_x_continuous(
          limits = c(0, 1),
          labels = scales::label_percent()
        ) +
        ggplot2::theme_minimal(base_size = 20) +
        ggplot2::labs(
          x = "% of AEs",
          y = chrCategoricalFields[[strCategory]]
        ) +
        {if (length(rctv_strGroupID()) && NROW(rctv_dfAE_Counts_Group())) {
          dfAE_Counts_Group <- rctv_dfAE_Counts_Group() %>%
            dplyr::mutate(
              category = dplyr::if_else(
                .data[[strCategory]] %in% chrTop5,
                .data[[strCategory]],
                "Other"
              ) %>%
                factor(levels = c(chrTop5, "Other"), ordered = TRUE),
              y_min = as.numeric(.data$category) - 0.5,
              y_max = as.numeric(.data$category) + 0.5
            ) %>%
            dplyr::summarize(
              pct_Group = sum(.data$pct_Group),
              .by = c("y_min", "y_max")
            )
          ggplot2::geom_segment(
            ggplot2::aes(
              x = .data$pct_Group,
              xend = .data$pct_Group,
              y = .data$y_min,
              yend = .data$y_max
            ),
            data = dfAE_Counts_Group,
            linewidth = 0.8,
            color = "red"
          )
        }} +
        {if (length(rctv_strSubjectID()) && NROW(rctv_dfAE_Counts_Subject())) {
          dfAE_Counts_Subject <- rctv_dfAE_Counts_Subject() %>%
            dplyr::mutate(
              category = dplyr::if_else(
                .data[[strCategory]] %in% chrTop5,
                .data[[strCategory]],
                "Other"
              ) %>%
                factor(levels = c(chrTop5, "Other"), ordered = TRUE)
            ) %>%
            dplyr::summarize(
              pct_Subject = sum(.data$pct_Subject),
              .by = "category"
            )
          ggplot2::geom_point(
            ggplot2::aes(y = .data$category, x = .data$pct_Subject),
            data = dfAE_Counts_Subject
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
