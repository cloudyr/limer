#' mail_registered_participants
#'
#' mail_registered_participants
#'
#' @param iSurveyID \dots
#' @param tid \dots
#' @param sleep Time between two mails
#' @export
#' @examples \dontrun{
#' }
mail_registered_participants <- function(iSurveyID, tid = NULL, sleep = 10) {

  if (is.null(tid)) {
    stop("At least one tid must be specified", call. = FALSE)

  } else if (length(tid) == 1) {
    call_limer(method = "mail_registered_participants", params = list("iSurveyID" = iSurveyID, "overrideAllConditions" = list("0" = paste0("tid = ", tid))))

  } else {

    pbapply::pblapply(tid, function(tid) {

      mail <- call_limer(method = "mail_registered_participants", params = list("iSurveyID" = iSurveyID, "overrideAllConditions" = list("0" = paste0("tid = ", tid))))
      Sys.sleep(sleep)

    })

  }

}
