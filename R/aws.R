#' @title AWS tools
#' @description Retrieve an AWS parameter via SSM
#' @name aws_get_param
#' @param parameter Character string AWS parameter name
#' @param region Character string AWS region
#' @param profile Character string name of AWS CLI profile if required
#' @rdname aws_get_param
#' @return A character string
#' @examples
#' aws_get_param("param-name")
#' @export

aws_get_param = function(parameter, region = 'eu-west-2', profile = ''){
  if(profile != '') profile = paste(' --profile', profile)
  cli_call = glue::glue('aws{profile} ssm get-parameter --name {parameter} --region {region}')
  j = system(cli_call, intern = TRUE)
  if(!jsonlite::validate(j)){
    warning('failed with cli call:\n  ', cli_call)
    return()
  }
  jsonlite::fromJSON(j)$Parameter$Value
}
