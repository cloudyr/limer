#' Get a LimeSurvey API session key
#'
#' This function logs into the LimeSurvey API and provides an access session key.
#' @param username LimeSurvey username. Defaults to value set in \code{options()}.
#' @param password LimeSurvey password Defaults to value set in \code{options()}.
#' @return API token
#' @import httr
#' @export
#' @examples \dontrun{
#' get_session_key()
#' }

get_session_key <- function(username = getOption('lime_username'),
                            password = getOption('lime_password')) {
  body.json = list(method = "get_session_key",
                   id = " ",
                   params = list(admin = username,
                                 password = password))

    # Need to use jsonlite::toJSON because single elements are boxed in httr, which
  # is goofy. toJSON can turn off the boxing automatically, though it's not
  # recommended. They say to use unbox on each element, like this:
  #   params = list(admin = unbox("username"), password = unbox("password"))
  # But that's a lot of extra work. So auto_unbox suffices here.
  # More details and debate: https://github.com/hadley/httr/issues/159
  r <- POST(getOption('lime_api'), content_type_json(),
            body = jsonlite::toJSON(body.json, auto_unbox = TRUE))

  session_key <- as.character(jsonlite::fromJSON(content(r, encoding="utf-8"))$result)
  session_cache$session_key <- session_key
  session_key
}

# Start a new environment to hold the session key so all other functions can access it
# See http://trestletech.com/2013/04/package-wide-variablescache-in-r-package/
session_cache <- new.env(parent = emptyenv())
