% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/country_codes.R
\name{country_to_iso2}
\alias{country_to_iso2}
\title{Country code mapping}
\usage{
country_to_iso2(x)
}
\arguments{
\item{x}{A character vector}
}
\value{
A character vector matching the length of the input
}
\description{
Encode country names as iso2c. This uses
}
\examples{
country_to_iso2(c("UK", "U.K.", "United Kingdom", "Great Britain & N.I.", "Greattt Britainnn"))
}
