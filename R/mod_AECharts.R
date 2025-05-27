mod_AECharts_UI <- function(id) {
  ns <- NS(id)
  out_DashboardCard(
    id = id,
    title = "Charts",
    plotOutput(ns("plot"))
  )
}

mod_AECharts_Server <- function(
  id,
  rctv_dfAE_Study,
  rctv_strGroupID = rctv_strGroupID,
  rctv_strGroupLevel = rctv_strGroupLevel,
  rctv_strSubjectID
) {
  moduleServer(id, function(input, output, session) {
    rctv_dfAE_Counts_Study <- reactive({
      req(rctv_dfAE_Study())
      # req(rctv_strGroupLevel())
      CountField(rctv_dfAE_Study(), "aetoxgr")
    })

    rctv_dfAE_Counts_Group <- reactive({
      req(rctv_dfAE_Counts_Study())
      req(rctv_strGroupID())

      if (is.null(rctv_strGroupID())) {
        return(NULL)
      }

      dfAE_Counts_Group <- CountField(
        rctv_dfAE_Study(),
        "aetoxgr",
        by = c("GroupLevel", "GroupID")
      ) %>%
        dplyr::filter(
          .data$GroupLevel == rctv_strGroupLevel(),
          .data$GroupID == rctv_strGroupID()
        )
      rctv_dfAE_Counts_Study() %>%
        dplyr::left_join(
          dfAE_Counts_Group,
          by = "aetoxgr",
          suffix = c("_Study", "_Group")
        ) %>%
        dplyr::mutate(
          dplyr::across(
            dplyr::starts_with("pct"),
            ~ tidyr::replace_na(.x, 0)
          )
        ) %>%
        dplyr::mutate(
          y_min = as.numeric(factor(.data$aetoxgr)) - 0.5,
          y_max = as.numeric(factor(.data$aetoxgr)) + 0.5
        )
    })

    rctv_dfAE_Counts_Subject <- reactive({
      req(rctv_dfAE_Counts_Study())
      req(rctv_strGroupID())
      req(rctv_strSubjectID())

      if (is.null(rctv_strSubjectID())) {
        return(NULL)
      }

      dfAE_Counts_Subject <- CountField(
        rctv_dfAE_Study(),
        "aetoxgr",
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
          by = "aetoxgr",
          suffix = c("_Study", "_Subject")
        ) %>%
        dplyr::mutate(
          dplyr::across(
            dplyr::starts_with("pct"),
            ~ tidyr::replace_na(.x, 0)
          )
        )
    })


    # rctv_dfToPlot <- reactive({
    #   req(rctv_dfAE_Counts_Study())
    #   req(rctv_dfAE_Counts_Group())
    #   req(rctv_dfAE_Counts_Subject())
    #   if (NROW(rctv_dfAE_Counts_Study())) {
    #     rctv_dfAE_Counts_Study() %>%
    #       dplyr::left_join(
    #         rctv_dfAE_Counts_Group(),
    #         by = "aetoxgr",
    #         suffix = c("_Study", "_Group")
    #       ) %>%
    #       dplyr::left_join(
    #         rctv_dfAE_Counts_Subject(),
    #         by = "aetoxgr"
    #       ) %>%
    #       dplyr::mutate(
    #         dplyr::across(
    #           dplyr::starts_with("pct"),
    #           ~ tidyr::replace_na(.x, 0)
    #         )
    #       )
    #   }
    # })

    output$plot <- renderPlot({
      req(rctv_dfAE_Counts_Study())
      ggplot2::ggplot(rctv_dfAE_Counts_Study()) +
        ggplot2::aes(y = .data$aetoxgr) +
        ggplot2::geom_col(ggplot2::aes(x = pct)) +
        ggplot2::scale_x_continuous(
          limits = c(0, 1),
          labels = scales::label_percent()
        ) +
        ggplot2::theme_minimal() +
        ggplot2::labs(
          x = "% of AEs",
          y = "Toxicity Grade"
        ) +
        {if (length(rctv_strGroupID()) && NROW(rctv_dfAE_Counts_Group())) {
          ggplot2::geom_segment(
            ggplot2::aes(
              x = .data$pct_Group,
              xend = .data$pct_Group,
              y = y_min,
              yend = y_max
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
