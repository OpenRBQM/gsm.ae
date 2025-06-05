#' Adverse Events Timeline Panel UI
#'
#' @inheritParams shared-params
#' @returns A [bslib::card()] for visualizing date variables in the AE data.
#' @keywords internal
mod_AETimeline_UI <- function(
  id,
  chrDateFields = c(
    mincreated_dts = "AE Created",
    aest_dt = "AE Start",
    aeen_dt = "AE End"
  )
) {
  ns <- NS(id)
  out_DashboardCard(
    id = id,
    title = "Timeline",
    mod_AEChartsTitle_UI(
      ns("title"),
      strDescriptor = "Timeline",
      chrFields = SwapNamesForValues(chrDateFields)
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
  rctv_strSubjectID,
  chrDateFields = c(
    mincreated_dts = "AE Created",
    aest_dt = "AE Start",
    aeen_dt = "AE End"
  )
) {
  moduleServer(id, function(input, output, session) {
    chrColors <- c("#1b9e77", "#d95f02", "#7570b3")
    rctv_strField <- mod_AEChartsTitle_Server_Color(
      "title",
      chrColors = chrColors,
      rctv_strGroupID = rctv_strGroupID,
      rctv_strGroupLevel = rctv_strGroupLevel,
      rctv_strSubjectID = rctv_strSubjectID
    )

    rctv_dfAE_Study_Prepared <- reactive({
      dplyr::mutate(
        rctv_dfAE_Study(),
        mincreated_dts = as.Date(.data$mincreated_dts),
        aest_dt = as.Date(.data$aest_dt),
        aeen_dt = as.Date(.data$aeen_dt)
      )
    })

    rctv_dfAE_Group <- reactive({
      req(rctv_dfAE_Study_Prepared())
      req(rctv_strGroupLevel())
      if (is.null(rctv_strGroupID())) {
        return(NULL)
      }
      dplyr::filter(
        rctv_dfAE_Study_Prepared(),
        .data$GroupLevel == rctv_strGroupLevel(),
        .data$GroupID == rctv_strGroupID()
      ) %>%
        dplyr::select(dplyr::where(lubridate::is.Date)) %>%
        dplyr::mutate(level = rctv_strGroupLevel())
    })

    rctv_dfAE_Subject <- reactive({
      req(rctv_dfAE_Study_Prepared())
      if (is.null(rctv_strSubjectID())) {
        return(NULL)
      }
      dplyr::filter(
        rctv_dfAE_Study_Prepared(),
        .data$SubjectID == rctv_strSubjectID()
      ) %>%
        dplyr::select(dplyr::where(lubridate::is.Date)) %>%
        dplyr::mutate(level = "Subject")
    })

    output$plot <- renderPlot({
      req(rctv_dfAE_Study_Prepared())
      req(rctv_strGroupLevel())
      req(rctv_strField())
      strField <- rctv_strField()
      rctv_dfAE_Study_Prepared() %>%
        dplyr::select(dplyr::where(lubridate::is.Date)) %>%
        dplyr::mutate(level = "Study") %>%
        dplyr::bind_rows(rctv_dfAE_Group(), rctv_dfAE_Subject()) %>%
        dplyr::mutate(
          level = factor(
            .data$level,
            levels = c("Study", rctv_strGroupLevel(), "Subject")
          ),
          date = lubridate::floor_date(.data[[strField]], unit = "months")
        ) %>%
        dplyr::filter(
          .data$date > max(.data$date) - lubridate::dmonths(6)
        ) %>%
        ggplot2::ggplot() +
        ggplot2::aes(x = .data$date, fill = .data$level) +
        ggplot2::geom_bar() +
        ggplot2::geom_label(
          ggplot2::aes(
            label = ggplot2::after_stat(.data$count),
            y = ggplot2::after_stat(.data$count)/2
          ),
          fill = "white",
          size = 14,
          size.unit = "pt",
          stat = "count"
        ) +
        ggplot2::scale_x_date(
          date_breaks = "month",
          date_labels = "%b %Y"
        ) +
        ggplot2::scale_y_continuous(
          breaks = NULL,
          # Ensure low-value labels don't get cut off.
          expand = ggplot2::expansion(mult = c(0.1, 0))
        ) +
        ggplot2::scale_fill_discrete(type = chrColors, guide = "none") +
        ggplot2::theme_minimal(base_size = 20) +
        ggplot2::theme(
          panel.spacing.y = ggplot2::unit(1.5, "lines"),
          strip.text.y.right = ggplot2::element_blank()
        ) +
        ggplot2::facet_grid(rows = "level", scales = "free_y") +
        ggplot2::labs(
          x = chrDateFields[[strField]],
          y = "# AEs"
        )
    })
  })
}
