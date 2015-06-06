# limer: A LimeSurvey R client

**limer** provides access to [LimeSurvey](https://www.limesurvey.org)'s [RemoteControl 2 API](https://manual.limesurvey.org/RemoteControl_2_API), allowing you to collect and analyze survey data in a simple, reproducible workflow.


## Installation

**limer** isn't on CRAN (yet), but it's easy to install directly from GitHub using [devtools](http://cran.r-project.org/web/packages/devtools/index.html):

```R
if(!require("devtools")) {
  install.packages("devtools")
  library("devtools")
}
install_github("andrewheiss/limer")
library("limer")
```


## Setup

Make sure you have enabled LimeSurvey's RPC interface, found in the administration section: Global settings > Interfaces > RPC interface enabled = JSON-RPC (*not* XML-RPC). You don't need to publish the API on `admin/remotecontrol`—all those details are [available elsewhere](http://api.limesurvey.org/classes/remotecontrol_handle.html). The API URL should look something like http://example.com/limesurvey/admin/remotecontrol.

Load your API details and user credentials into R using `options()`:

```R
options(lime_api = 'http://example.com/limesurvey/admin/remotecontrol')
options(lime_username = 'put_username_here')
options(lime_password = 'put_password_here')
```

Before calling the API, you need to generate an access token with `get_session_key()` (examples of how to do this are shown below). Many services provide tokens that last indefinitely, but by default LimeSurvey's will only last for two hours. (this can be modified by editing `limesurvey/application/config/config-default.php` and changing `$config['iSessionExpirationTime'] = 7200;` to something else). 


## Code examples

Here's how easy it is to export the results from a survey:

```R
# Load library
library(limer)

# Setup API details
options(lime_api = 'http://example.com/limesurvey/admin/remotecontrol')
options(lime_username = 'put_username_here')
options(lime_password = 'put_password_here')

# Do stuff with LimeSurvey API
get_session_key()  # Log in
responses <- get_responses(12345)  # Get results from survey
```

You can also run [any arbitrary API call](https://manual.limesurvey.org/RemoteControl_2_API) using `call_limer()` (`get_responses()` and other functions are just convenient wrappers around `call_limer()`):

```R
# Get a list of all the surveys
call_limer(method = "list_surveys")

# Get the number of completed responses for a survey
call_limer(method = "get_summary", 
           params = list(iSurveyID = 12345,
                         sStatname = "completed_responses"))
```

At the end of your script or session, it's nice to release the session key. If you don't release the session key, LimeSurvey will eventually clean it up.

```R
release_session_key()
```
