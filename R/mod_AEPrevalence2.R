#' Adverse Events Prevalence Panel Server
#'
#' @inheritParams shared-params
#' @returns A module server function.
#' @keywords internal
mod_AEPrevalence_Server2 <- function(
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
    chrColors <- c("#1b9e77", "#d95f02", "#7570b3")
    rctv_strCategory <- mod_AEChartsTitle_Server_Color(
      "title",
      chrColors = chrColors,
      rctv_strGroupID = rctv_strGroupID,
      rctv_strGroupLevel = rctv_strGroupLevel,
      rctv_strSubjectID = rctv_strSubjectID
    )

    rctv_dfAE_Group <- reactive({
      req(rctv_dfAE_Study())
      strGroupID <- rctv_strGroupID()
      if (is.null(strGroupID)) {
        return(NULL)
      }

      dfAE_Study <- rctv_dfAE_Study()
      strGroupLevel <- rctv_strGroupLevel()
      strCategory <- rctv_strCategory()

      dplyr::filter(
        dfAE_Study,
        .data$GroupLevel == strGroupLevel,
        .data$GroupID == strGroupID
      ) %>%
        dplyr::mutate(level = strGroupLevel) %>%
        dplyr::select(dplyr::all_of(c("level", strCategory)))
    })

    rctv_dfAE_Subject <- reactive({
      req(rctv_dfAE_Study())
      strSubjectID <- rctv_strSubjectID()
      if (is.null(strSubjectID)) {
        return(NULL)
      }

      dfAE_Study <- rctv_dfAE_Study()
      strCategory <- rctv_strCategory()
      dfAE_Study %>%
        dplyr::filter(.data$SubjectID == strSubjectID) %>%
        dplyr::mutate(level = "Subject") %>%
        dplyr::select(dplyr::all_of(c("level", strCategory)))
    })

    output$plot <- renderPlot({
      req(rctv_dfAE_Study())
      req(rctv_strGroupLevel())
      req(rctv_strCategory())
      strCategory <- rctv_strCategory()
      strGroupLevel <- rctv_strGroupLevel()
      dfAE_Study <- rctv_dfAE_Study()
      dfAE_Group <- rctv_dfAE_Group()
      dfAE_Subject <- rctv_dfAE_Subject()
      dfAE_Study %>%
        dplyr::select(dplyr::all_of(strCategory)) %>%
        dplyr::mutate(level = "Study") %>%
        dplyr::bind_rows(
          dfAE_Group,
          dfAE_Subject
        ) %>%
        dplyr::mutate(
          level = factor(
            .data$level,
            levels = c("Study", strGroupLevel, "Subject")
          ),
          category = factor(.data[[strCategory]])
        ) %>%
        ggplot2::ggplot() +
        ggplot2::aes(x = .data$category, fill = .data$level) +
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
          x = chrCategoricalFields[[strCategory]],
          y = "# AEs"
        )
    })
  })
}
