# Some version of these will be exported by gsm.app:
# https://github.com/Gilead-BioStats/gsm.app/issues/454

FilterByInputs <- function(
  df,
  dSnapshotDate = NULL,
  strGroupID = NULL,
  strGroupLevel = NULL,
  strMetricID = NULL,
  strSubjectID = NULL
) {
  df %>%
    FilterByScalar("SnapshotDate", dSnapshotDate) %>%
    FilterByScalar("GroupID", strGroupID) %>%
    FilterByScalar("GroupLevel", strGroupLevel) %>%
    FilterByScalar("MetricID", strMetricID) %>%
    FilterByScalar("SubjectID", strSubjectID)
}

FilterByScalar <- function(df, strField, vecValue) {
  if (strField %in% colnames(df) && length(vecValue) == 1) {
    return(
      df[df[[strField]] == vecValue,]
    )
  }
  return(df)
}
