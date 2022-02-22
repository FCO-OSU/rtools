#' @title Country code mapping
#' @description iso2c country code to country name
#' @name iso2_to_country
#' @param x A character vector
#' @rdname iso2_to_country
#' @return A character vector matching the length of the input
#' @examples
#' iso2_to_country(c("GB", "US", "FR"))
#' @export

iso2_to_country <- function(x)
{
  countrycode::countrycode(x, origin = 'iso2c', destination = 'country.name')
}

#' @title Country code mapping
#' @description iso3c country code to country name
#' @name iso3_to_country
#' @param x A character vector
#' @rdname iso3_to_country
#' @return A character vector matching the length of the input
#' @examples
#' iso3_to_country(c("GBR", "USA", "FRA"))
#' @export

iso3_to_country <- function(x)
{
  countrycode::countrycode(x, origin = 'iso3c', destination = 'country.name')
}

#' @title Country code mapping
#' @description Encode country names as iso2c. This uses
#' @name country_to_iso2
#' @param x A character vector
#' @rdname country_to_iso2
#' @return A character vector matching the length of the input
#' @examples
#' country_to_iso2(c("UK", "U.K.", "United Kingdom", "Great Britain & N.I.", "Greattt Britainnn"))
#' @export

country_to_iso2 <- function(x)
{
  countrycode::countrycode(x, origin = 'country.name', destination = 'iso2c')
}

#' @title Country code mapping
#' @description Re-code country codes from iso2c to iso3c
#' @name country_to_iso3
#' @param x A character vector
#' @rdname country_to_iso3
#' @return A character vector matching the length of the input
#' @examples
#' country_to_iso3(c("UK", "U.K.", "United Kingdom", "Great Britain & N.I.", "Greattt Britainnn"))
#' @export

country_to_iso3 <- function(x)
{
  countrycode::countrycode(x, origin = 'country.name', destination = 'iso3c')
}

#' @title Country code remapping
#' @description Re-code country codes from iso2c to iso3c
#' @name iso2_to_iso3
#' @param x A character vector
#' @rdname iso2_to_iso3
#' @return A character vector matching the length of the input
#' @examples
#' iso2_to_iso3(c("FR", "DE", "RU"))
#' @export

iso2_to_iso3 <- function (x)
{
  countrycode::countrycode(x, origin = 'iso2c', destination = 'iso3c')
}

#' @title Country code remapping
#' @description Re-code country codes from iso3c to iso2c
#' @name iso3_to_iso2
#' @param x A character vector
#' @rdname iso3_to_iso2
#' @return A character vector matching the length of the input
#' @examples
#' iso3_to_iso2(c("FRA", "DEU", "RUS"))
#' @export

iso3_to_iso2 <- function (x)
{
  countrycode::countrycode(x, origin = 'iso3c', destination = 'iso2c')
}
