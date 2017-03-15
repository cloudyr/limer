#' Get the summary of a LimeSurvey survey
#'
#' This function gives the summary of a LimeSurvey survey.
#' @param iSurveyID \dots
#' @param aTokenQueryProperties \dots
#' @param aTokenProperties \dots
#' @export
#' @examples \dontrun{
#' get_summary(iSurveyID = 12345, sStatName = "completed_responses")
#' }

get_summary <- function(iSurveyID, sStatName) {

  params <- as.list(environment())

  result <- call_limer(method = "get_summary", params = params)

  return(result)
}