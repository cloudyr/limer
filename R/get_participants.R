#' Export list of participants from a LimeSurvey survey
#'
#' This function exports and downloads the list of participants from a LimeSurvey survey.
#' @param iSurveyID \dots
#' @param iStart \dots
#' @param iLimit \dots
#' @param bUnused \dots
#' @param aAttributes \dots
#' @export
#' @examples \dontrun{
#' get_participants(12345, iStart=1, iLimit=10, bUnused=FALSE,
#'                                    aAttributes=c('attribute_1','attribute_2'))
#' get_participants(12345, iStart=1, iLimit=10, bUnused=FALSE, aAttributes=FALSE)
#' }

get_participants <- function(iSurveyID, iStart = 0, iLimit = NULL, bUnused = FALSE, aAttributes = list(), aConditions = list()){

  if (is.null(iLimit)) {
    iLimit <- limer::call_limer("get_summary", list("iSurveyID" = iSurveyID, "sStatName" = "token_count"))
    iLimit <- as.integer(iLimit)
  }

  # Put all the function's arguments in a list to then be passed to call_limer()
  params <- as.list(environment())

  results <- limer::call_limer(method = "list_participants", params = params)
  results <- jsonlite::flatten(results)
  names(results) <- sub("^participant_info\\.(firstname|lastname|email)$", "\\1", names(results))

  return(results)
}
