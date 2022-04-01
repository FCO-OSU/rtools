#' @title AWS tools
#' @description Retrieve AWS secret
#' @name aws_get_param
#' @param secret_id Character string AWS parameter name
#' @param region Character string AWS region
#' @rdname aws_get_param
#' @return A character string
#' @examples
#' aws_get_param("param-name")
#' @export

aws_get_param = function(secret_id, region = 'eu-west-2'){
  ssm <- paws::ssm(config = list(region = region))
  api_parameter <- ssm$get_parameter(secret_id, WithDecryption = TRUE)
  api_parameter$Parameter$Value
}
