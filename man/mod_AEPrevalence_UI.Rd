% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/mod_AEPrevalence.R
\name{mod_AEPrevalence_UI}
\alias{mod_AEPrevalence_UI}
\title{Adverse Events Prevalence Panel UI}
\usage{
mod_AEPrevalence_UI(
  id,
  chrCategoricalFields = c(aeser = "Serious?", mdrpt_nsv = "Preferred Term", mdrsoc_nsv =
    "System Organ Class", aetoxgr = "Toxicity Grade", aeongo = "Ongoing?", aerel =
    "Related?")
)
}
\arguments{
\item{id}{\code{character} The id for this element.}

\item{chrCategoricalFields}{\code{character} A named vector of fields in \code{dfAE} to
treat as categorical, where the names are the column names and the values
are what to display to users. Unnamed elements will be used as both the
field name and the display name. These fields are currently used in the
Prevalence panel.}
}
\value{
A \code{\link[bslib:card]{bslib::card()}} for visualizing categorical variables in the AE
data.
}
\description{
Adverse Events Prevalence Panel UI
}
\keyword{internal}
