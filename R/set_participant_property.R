#' Set a participant property from a LimeSurvey survey
#'
#' This function sets a participant property from a LimeSurvey survey.
#' @param iSurveyID \dots
#' @param aTokenQueryProperties \dots
#' @param aTokenData \dots
#' @export
#' @examples \dontrun{
#' set_participant_properties(iSurveyID = 12345, aTokenQueryProperties = 1, aTokenData = list("attribute_1" = "test"))
#' }

set_participant_property <- function(iSurveyID, aTokenQueryProperties, aTokenData) {

  params <- as.list(environment())

  call_limer(method = "set_participant_properties", params = params)
}