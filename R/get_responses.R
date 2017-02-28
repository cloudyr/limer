#' Export data from a LimeSurvey survey
#'
#' This function exports and downloads data from a LimeSurvey survey.
#' @param iSurveyID \dots
#' @param sDocumentType \dots
#' @param sLanguageCode \dots
#' @param sCompletionStatus \dots
#' @param sHeadingType \dots
#' @param sResponseType \dots
#' @param \dots Further arguments to \code{\link{call_limer}}.
#' @export
#' @examples \dontrun{
#' get_responses(12345)
#' }

get_responses <- function(iSurveyID, sDocumentType = "csv", sLanguageCode = NULL,
                          sCompletionStatus = "complete", sHeadingType = "code",
                          sResponseType = "long", ...) {
  # Put all the function's arguments in a list to then be passed to call_limer()
  params <- as.list(environment())
  dots <- list(...)
  if(length(dots) > 0) params <- append(params,dots)
  # print(params) # uncomment to debug the params

  results <- call_limer(method = "export_responses", params = params)
  return(base64_to_df(unlist(results)))
}
