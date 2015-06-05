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

Make sure you have enabled LimeSurvey's RPC interface, found in the administration section: Global settings > Interfaces > RPC interface enabled = JSON-RPC (*not* XML-RPC). You don't need to publish the API on `admin/remotecontrol`—all those details are [available elsewhere](http://api.limesurvey.org). The API URL should look something like http://example.com/limesurvey/admin/remotecontrol.

Load your API details and user credentials into R using `options()`:

```R
options(lime_api = 'http://example.com/limesurvey/admin/remotecontrol')
options(lime_username = 'put_username_here')
options(lime_user_id = 'put_user_id_here')
options(lime_password = 'put_password_here')
```

Before calling the API, you need to generate an access token (examples of how to do this are shown below). Many services provide tokens that last indefinitely, but by default LimeSurvey's will only last for two hours (though this can be modified by editing `limesurvey/application/config/config-default.php` and changing `$config['iSessionExpirationTime'] = 7200;`). 


## Code examples

To come…
