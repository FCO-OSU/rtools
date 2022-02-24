#' @title Interactive tools
#' @description Report all explicit R dependencies in current directory (recursive)
#' @name report_dependencies
#' @param path Character string of directory to report
#' @param print Logical whether to print output to console
#' @param simple Logical whether to return simple vector or pre-loaded/invoked breakdown
#' @rdname report_dependencies
#' @return A vector (simple=TRUE) or list (simple=FALSE)
#' @examples
#' report_dependencies()
#' report_dependencies('~/Downloads/')
#' report_dependencies() |> tools::package_dependencies(reverse = FALSE)
#' @export

report_dependencies = function(path = './', print = FALSE, simple = TRUE){
  files = list.files(path = path, pattern = '.R$', recursive = TRUE, full.names = TRUE)
  scripts = lapply(files, readLines, warn = FALSE) |> unlist() |> paste(collapse = '\n')
  loaded = scripts |> stringr::str_extract_all('(?<=(library)|(require)[(])[a-zA-Z0-9_.]+') |>
    unlist() |> stringr::str_remove_all('["\']') |> stringr::str_remove(',.*') |> unique() |> sort()
  invoked = scripts |> stringr::str_extract_all('[a-zA-Z0-9_.]+(?=::)') |> unlist() |> unique() |> sort()
  dependencies = loaded |> c(invoked) |> unique() |> sort()
  if(print) { message('Dependencies:\n', paste(dependencies, collapse=', ')); return() }
  if(simple) return(dependencies)
  return(list(all_dependencies = dependencies, pre_loaded = loaded, invoked_in_line = invoked))
}

