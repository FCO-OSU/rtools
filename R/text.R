
#' @title String in text (vectorised)
#' @description A Python-style String in Text operator that ignores case. Shorthand for str_detect(str, regex(q, ignore_case = TRUE)). Either q or str must be a single value. The return is a logical value or vector if vectorised input is provided.
#' @param q Regex pattern or vector of patterns to match against str
#' @param str Character value or vector to match q against
#' @return A logical value or vector
#' @examples
#' 'cat' %IN% "The Cat in a Hat"
#' c('cat', 'fox') %IN% "The Cat in a Hat"
#' 'cat' %IN% c('The Cat in a Hat', 'Fox in Socks')
#'
#' require(dplyr)
#' d = starwars %>% select(name) %>% as.data.frame()
#' d %>% filter('sky' %IN% name)
#' d %>% filter('[0-9]' %IN% name) # regex
#'
#' @aliases %IN%
#' @export

`%IN%` <- function(q, str) stringr::str_detect(str, stringr::regex(q, ignore_case = TRUE))


#' @title Detect the presence or absence of multiple patterns in a string/vector
#' @description A wrapper for stringr::str_detect to enable vectorised search against multiple terms, with regex and case_ignore applied by default.
#' @param strings A string or character vector of strings to query patterns against
#' @param patterns A string or character vector of patterns to query against strings
#' @inheritParams stringr::regex
#' @param regex Whether patterns are regex or fixed (activates stringr::regex or stringr::fixed)
#' @return A logical value or vector
#' @examples
#' x = rownames(mtcars)
#' x[str_detect_multi(x, c('merc','honda'))]
#'
#' require(dplyr)
#' starwars %>% filter(str_detect_multi(name, c('sky','darth')))
#' @aliases str_detect_multi
#' @export

str_detect_multi <- function(strings, patterns, ignore_case = TRUE, regex = TRUE){
  FUN <- ifelse(regex, stringr::regex, stringr::fixed)
  match_sets <- purrr::map(patterns, ~ stringr::str_detect(strings, FUN(.x, ignore_case = ignore_case)))
  purrr::pmap_lgl(match_sets, any)
}


#' @title Bundle case variants
#' @description Bundle all case variations into the most common variant (e.g. hashtags, social media profile names)
#' @name bundle_case
#' @param x A character vector
#' @rdname bundle_case
#' @return A character vector matching the length of the input
#' @examples
#' bundle_case(c('london','London','London','Paris','PARIS','paris','Paris'))
#' @export

bundle_case <- function (x)
{
  Mode <- function(v) { uv <- unique(v); uv[which.max(tabulate(match(v, uv)))] }
  data.frame(x = x) |> dplyr::mutate(lc = tolower(x)) |>
    dplyr::group_by(lc) |> dplyr::mutate(mode = Mode(x)) |>
    dplyr::ungroup() |> dplyr::select(mode) |> unlist(use.names = FALSE)
}
