#' Export list of participants from a LimeSurvey survey
#'
#' This function exports and downloads the list of participants from a LimeSurvey survey.
#' @export
#' @examples \dontrun{
#' get_responses(12345)
#' }

get_participants <- function(iSurveyID, iStart, iLimit, bUnused, aAttributes){
  # Put all the function's arguments in a list to then be passed to call_limer()
  params <- as.list(environment())

  results <- call_limer(method = "list_participants", params = params)
  return(data.frame(results))
}
