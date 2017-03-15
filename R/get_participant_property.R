#' Get a participant property from a LimeSurvey survey
#'
#' This function exports and downloads a participant property from a LimeSurvey survey.
#' @param iSurveyID \dots
#' @param aTokenQueryProperties \dots
#' @param aTokenProperties \dots
#' @export
#' @examples \dontrun{
#' get_participant_property(iSurveyID = 12345, aTokenQueryProperties = 1, aTokenProperties = list("attribute_1"))
#' }

get_participant_property <- function(iSurveyID, aTokenQueryProperties, aTokenProperties) {

  params <- as.list(environment())

  result <- call_limer(method = "get_participant_properties", params = params)

  return(result)
}