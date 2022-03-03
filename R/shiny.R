#' @title Shiny functions
#' @description Parse hash: parser to turn Shiny's session$clientData$url_hash input into a list of key/value pairs
#' @name parse_hash
#' @param hash_str A URL hash string passed to Shiny
#' @rdname parse_hash
#' @return A list of key/value pairs
#' @examples
#' observeEvent(session$clientData$url_hash, {
#'     hash = parse_hash(session$clientData$url_hash)
#'     ...
#' }
#' @export

parse_hash = function(hash_str) {
  if(hash_str == '') return(NULL)

  hash_args = stringr::str_remove(hash_str, '#') |>
    stringr::str_replace_all('%20', ' ') |> stringr::str_replace_all(' +', ' ') |>
    stringr::str_trim() |> stringr::str_split('&') |> unlist()

  `names<-`(as.list(stringr::str_extract(hash_args,'(?<==).*')),
            tolower(stringr::str_extract(hash_args,'.*(?==)')))
}
