#' Adverse Events Timeline Panel UI
#'
#' @inheritParams shared-params
#' @returns A [bslib::card()] for visualizing date variables in the AE data.
#' @keywords internal
mod_AETimeline_UI <- function(id) {
  ns <- NS(id)
  out_DashboardCard(
    id = id,
    title = "Timeline",
    mod_AEChartsTitle_UI(
      ns("title"),
      chrDescriptor = "Timeline",
      chrFields = c(
        "AE Created" = "mincreated_dts",
        "AE Start" = "aest_dt",
        "AE End" = "aeen_dt"
      )
    ),
    plotOutput(ns("plot"))
  )
}

#' Adverse Events Timeline Panel Server
#'
#' @inheritParams shared-params
#' @returns A module server function.
#' @keywords internal
mod_AETimeline_Server <- function(
  id,
  rctv_dfAE_Study,
  rctv_strGroupID,
  rctv_strGroupLevel,
  rctv_strSubjectID
) {
  moduleServer(id, function(input, output, session) {
    chrFields <- c(
      mincreated_dts = "AE Created",
      aest_dt = "AE Start",
      aeen_dt = "AE End"
    )

    rctv_strField <- mod_AEChartsTitle_Server(
      "title",
      rctv_strGroupID = rctv_strGroupID,
      rctv_strGroupLevel = rctv_strGroupLevel,
      rctv_strSubjectID = rctv_strSubjectID
    )

    rctv_strFieldLevels <- reactive({
      # A sorted vector of all months, in case some months are missing from the
      # data.
      req(rctv_dfAE_Study())
      req(rctv_strField())
      dfAE_Study <- rctv_dfAE_Study()
      strField <- rctv_strField()
      dMin <- min(as.Date(dfAE_Study[[strField]]), na.rm = TRUE)
      dMax <- max(as.Date(dfAE_Study[[strField]]), na.rm = TRUE)
      dSeq <- as.Date(dMin:dMax)
      months <- lubridate::month(dSeq, label = TRUE)
      years <- lubridate::year(dSeq)
      rev(unique(glue::glue("{months} {years}")))
    })

    rctv_dfAE_Study_my <- reactive({
      req(rctv_dfAE_Study())
      req(rctv_strField())
      strField <- rctv_strField()
      rctv_dfAE_Study() %>%
        dplyr::arrange(dplyr::desc(.data[[strField]])) %>%
        dplyr::mutate(
          month = lubridate::month(.data[[strField]], label = TRUE),
          year = lubridate::year(.data[[strField]])
        ) %>%
        dplyr::mutate(
          my = factor(
            glue::glue("{.data$month} {.data$year}"),
            levels = rctv_strFieldLevels()
          ),
          .keep = "unused"
        )
    })

    rctv_dfAE_Counts_Study <- reactive({
      req(rctv_dfAE_Study_my())
      CountField(rctv_dfAE_Study_my(), "my")
    })

    rctv_dfAE_Counts_Group <- reactive({
      req(rctv_dfAE_Counts_Study())
      req(rctv_strGroupID())
      req(rctv_dfAE_Study_my())

      dfAE_Counts_Group <- CountField(
        rctv_dfAE_Study_my(),
        "my",
        by = c("GroupLevel", "GroupID")
      ) %>%
        dplyr::filter(
          .data$GroupLevel == rctv_strGroupLevel(),
          .data$GroupID == rctv_strGroupID()
        )
      rctv_dfAE_Counts_Study() %>%
        dplyr::left_join(
          dfAE_Counts_Group,
          by = "my",
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
      req(rctv_dfAE_Study_my())

      dfAE_Counts_Subject <- CountField(
        rctv_dfAE_Study_my(),
        "my",
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
          by = "my",
          suffix = c("_Study", "_Subject")
        ) %>%
        dplyr::mutate(
          dplyr::across(
            dplyr::starts_with("pct"),
            ~ tidyr::replace_na(.x, 0)
          )
        )
    })
  #
  #   rctv_chrTop5_Study <- reactive({
  #     req(rctv_dfAE_Counts_Study())
  #     req(rctv_strCategory())
  #     if (!NROW(rctv_dfAE_Counts_Study())) {
  #       return(character()) # nocov
  #     }
  #     rctv_dfAE_Counts_Study() %>%
  #       dplyr::arrange(dplyr::desc(.data$pct)) %>%
  #       dplyr::pull(.data[[rctv_strCategory()]]) %>%
  #       utils::head(5) %>%
  #       as.character()
  #   })
  #
  #   rctv_chrTop5_Group <- reactive({
  #     req(rctv_strCategory())
  #     if (!length(rctv_strGroupID()) || !NROW(rctv_dfAE_Counts_Group())) {
  #       return(character())
  #     }
  #     rctv_dfAE_Counts_Group() %>%
  #       dplyr::arrange(dplyr::desc(.data$pct_Group)) %>%
  #       dplyr::pull(.data[[rctv_strCategory()]]) %>%
  #       utils::head(5) %>%
  #       as.character()
  #   })
  #
  #   rctv_chrTop5_Subject <- reactive({
  #     req(rctv_strCategory())
  #     if (!length(rctv_strSubjectID()) || !NROW(rctv_dfAE_Counts_Subject())) {
  #       return(character())
  #     }
  #     rctv_dfAE_Counts_Subject() %>%
  #       dplyr::arrange(dplyr::desc(.data$pct_Subject)) %>%
  #       dplyr::pull(.data[[rctv_strCategory()]]) %>%
  #       utils::head(5) %>%
  #       as.character()
  #   })
  #
  #   rctv_chrTop5 <- reactive({
  #     req(rctv_strCategory())
  #     c(
  #       rctv_chrTop5_Subject(),
  #       rctv_chrTop5_Group(),
  #       rctv_chrTop5_Study()
  #     ) %>%
  #       unique() %>%
  #       utils::head(5) %>%
  #       sort()
  #   })

    ## End break ----
    output$plot <- renderPlot({
      req(rctv_dfAE_Counts_Study())
      req(rctv_strField())
      strField <- rctv_strField()
      rctv_dfAE_Counts_Study() %>%
        dplyr::summarize(
          pct = sum(.data$pct),
          .by = "my"
        ) %>%
        ggplot2::ggplot() +
        ggplot2::aes(y = .data$my) +
        ggplot2::geom_col(ggplot2::aes(x = .data$pct)) +
        ggplot2::scale_x_continuous(
          limits = c(0, 1),
          labels = scales::label_percent()
        ) +
        ggplot2::theme_minimal(base_size = 20) +
        ggplot2::labs(
          x = "% of AEs",
          y = chrFields[[strField]]
        ) +
        {if (length(rctv_strGroupID()) && NROW(rctv_dfAE_Counts_Group())) {
          dfAE_Counts_Group <- rctv_dfAE_Counts_Group() %>%
            dplyr::mutate(
              y_min = as.numeric(.data$my) - 0.5,
              y_max = as.numeric(.data$my) + 0.5
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
            dplyr::summarize(
              pct_Subject = sum(.data$pct_Subject),
              .by = "my"
            )
          ggplot2::geom_point(
            ggplot2::aes(y = .data$my, x = .data$pct_Subject),
            data = dfAE_Counts_Subject
          )
        }} +
        ggplot2::theme(legend.position = "none")
    })
  })
}
