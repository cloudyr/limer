#' Export LSA File from a LimeSurvey survey
#'
#' This function exports a survey archive (LSA).
#'
#' @param iSurveyID \dots
#' @param filename \dots
#' @export
#' @examples \dontrun{
#' export_survey_archive(12345)
#' }
#' @note This function requires that the patch has been implemented in the
#' remotecontrol_handle.php file of your Limesurvey installation.
#' application/helpers/remotecontrol/remotecontrol_handle.php
#' system.file("patch.php", package="limer")
#' See @references
#'
#' @references https://bugs.limesurvey.org/view.php?id=17747

export_survey_archive <- function(iSurveyID, filename = NULL) {

  x <- call_limer("export_survey_archive",
                                   params = list("iSurveyID_org" = iSurveyID))

  survey_data_raw <- rawToChar(base64enc::base64decode(x))

  if (is.null(filename))
    filename <- glue::glue("limesurvey_survey_{iSurveyID}.lsa")


    writeLines(survey_data_raw, filename)

 message(filename, " saved!")

}
