expect_cleaned_html <- function(x, call = rlang::caller_env()) {
  rlang::inject(
    expect_snapshot(
      {{ x }},
      transform = scrub_html
    ),
    env = call
  )
}

scrub_html <- function(chrLines) {
  scrub_htmlwidget_ids(chrLines) %>%
    scrub_card_ids() %>%
    scrub_tab_ids() %>%
    scrub_tabset_ids() %>%
    scrub_collapse_ids() %>%
    scrub_gt_ids() %>%
    scrub_extra_black_style()
}

scrub_card_ids <- function(chrLines) {
  gsub("bslib-card-\\d+", "bslib-card-XXXX", chrLines)
}

scrub_htmlwidget_ids <- function(chrLines) {
  gsub("htmlwidget-[0-9a-f]+", "htmlwidget-XXXX", chrLines)
}

scrub_tab_ids <- function(chrLines) {
  gsub("tab-\\d{4}-", "tab-XXXX-", chrLines)
}

scrub_tabset_ids <- function(chrLines) {
  gsub('tabsetid="\\d{4}"', 'tabsetid="XXXX"', chrLines)
}

scrub_collapse_ids <- function(chrLines) {
  gsub("navbar-collapse-\\d+", "navbar-collapse-XXXX", chrLines)
}

scrub_gt_ids <- function(chrLines) {
  chrLines <- gsub('id="[a-z]{10}"', 'id="gtRandomID"', chrLines)
  gsub("#[a-z]{10} ", "#gtRandomID ", chrLines)
}

scrub_extra_black_style <- function(chrLines) {
  gsub('style="color: black; width: auto', 'style="width: auto', chrLines)
}
