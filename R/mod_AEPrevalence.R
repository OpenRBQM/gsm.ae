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
      chrFields = SwapNamesForValues(chrCategoricalFields)
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
    chrColors <- c(Study = "#1b9e77", Group = "#d95f02", Subject = "#7570b3")
    rctv_strCategory <- mod_AEChartsTitle_Server_Color(
      "title",
      chrColors = chrColors,
      rctv_strGroupID = rctv_strGroupID,
      rctv_strGroupLevel = rctv_strGroupLevel,
      rctv_strSubjectID = rctv_strSubjectID
    )
    rctv_chrTop5 <- reactive({
      req(rctv_dfAE_Study())
      req(rctv_strCategory())
      if (!NROW(rctv_dfAE_Study())) {
        return(character()) # nocov
      }
      strCategory <- rctv_strCategory()
      rctv_dfAE_Study() %>%
        dplyr::count(.data[[strCategory]], sort = TRUE) %>%
        dplyr::pull(strCategory) %>%
        utils::head(5) %>%
        as.character()
    })

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

    txt2pct <- scales::label_percent(1)

    output$plot <- renderPlot({
      req(rctv_dfAE_Study())
      req(rctv_strGroupLevel())
      req(rctv_strCategory())
      req(rctv_chrTop5())
      strCategory <- rctv_strCategory()
      strGroupLevel <- rctv_strGroupLevel()
      dfAE_Study <- rctv_dfAE_Study()
      dfAE_Group <- rctv_dfAE_Group()
      dfAE_Subject <- rctv_dfAE_Subject()
      chrTop5 <- rctv_chrTop5()
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
          category = forcats::fct_other(
            .data[[strCategory]],
            keep = chrTop5
          )
        ) %>%
        dplyr::summarize(
          n = dplyr::n(),
          .by = dplyr::all_of(c("level", "category"))
        ) %>%
        dplyr::mutate(
          pct = .data$n/sum(.data$n),
          .by = "level"
        ) %>%
        ggplot2::ggplot() +
        ggplot2::aes(
          x = .data$pct,
          y = .data$category,
          fill = .data$level,
          width = 0.9 * dplyr::case_match(
            as.character(.data$level),
            "Study" ~ 1,
            "Subject" ~ 0.25,
            .default = 0.5
          )
        ) +
        ggplot2::geom_col(
          position = "identity",
          color = "black"
        ) +
        ggplot2::geom_label(
          ggplot2::aes(
            label = txt2pct(.data$pct),
            y = as.numeric(.data$category) + dplyr::case_match(
              as.character(.data$level),
              "Study" ~ 0.3,
              "Subject" ~ -0.3,
              .default = 0
            )
          ),
          x = 1.1,
          color = "white",
          size = 14,
          size.unit = "pt",
          fontface = "bold"
        ) +
        ggplot2::scale_x_continuous(
          breaks = NULL,
          limits = c(0, 1.2)
        ) +
        scale_fill_StudyGroupSubject() +
        theme_AE() +
        ggplot2::labs(
          x = "% of AEs",
          y = chrCategoricalFields[[strCategory]]
        ) +
        ggplot2::theme(legend.position = "none")
    })
  })
}
