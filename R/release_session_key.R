#' Release a LimeSurvey API session key
#'
#' This function clears the LimeSurvey API session key currently in use, effectively logging out.
#' @export
#' @examples \dontrun{
#' release_session_key()
#' }

release_session_key <- function() {
  call_limer(method = "release_session_key")
}
