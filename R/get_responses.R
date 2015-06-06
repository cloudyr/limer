#' Export data from a LimeSurvey survey
#'
#' This function exports and downloads data from a LimeSurvey survey.
#' @export
#' @examples \dontrun{
#' get_responses(12345)
#' }

get_responses <- function(iSurveyID, sDocumentType = "csv", sLanguageCode = "en",
                          sCompletionStatus = "complete", sHeadingType = "code",
                          sResponseType = "long", ...) {
  # Put all the function's arguments in a list to then be passed to call_limer()
  params <- as.list(environment())

  results <- call_limer(method = "export_responses", params = params)
  return(base64_to_df(results))
}
