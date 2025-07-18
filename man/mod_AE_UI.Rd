% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/mod_AE.R
\name{mod_AE_UI}
\alias{mod_AE_UI}
\title{Adverse Events Plugin UI}
\usage{
mod_AE_UI(
  id,
  chrCategoricalFields = c(aeser = "Serious?", mdrpt_nsv = "Preferred Term", mdrsoc_nsv =
    "System Organ Class", aetoxgr = "Toxicity Grade", aeongo = "Ongoing?", aerel =
    "Related?"),
  chrDateFields = c(mincreated_dts = "AE Entry Date", aest_dt = "AE Start Date", aeen_dt
    = "AE End Date")
)
}
\arguments{
\item{id}{\code{character} The id for this element.}

\item{chrCategoricalFields}{\code{character} A named vector of fields in \code{dfAE} to
treat as categorical, where the names are the column names and the values
are what to display to users. Unnamed elements will be used as both the
field name and the display name. These fields are currently used in the
Prevalence panel.}

\item{chrDateFields}{\code{character} A named vector of fields in \code{dfAE} to treat
as dates, where the names are the column names and the values are what to
display to users. Unnamed elements will be used as both the field name and
the display name. These fields are currently used in the Timeline panel.}
}
\value{
A \code{\link[bslib:page_fillable]{bslib::page_fillable()}} with the AE plugin UI.
}
\description{
Adverse Events Plugin UI
}
