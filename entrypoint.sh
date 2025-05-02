#!/bin/sh
echo "Authorizing $shiny_username"

Rscript -e "rsconnect::setAccountInfo(name='$shiny_username', token='$shiny_token', secret='$shiny_secret')"

echo "Deploying $app_name from $shiny_app_path to shinyapps.io; it will be running under R $r_version"

# Ensure the app_path is correctly set
app_path="$shiny_app_path"

Rscript -e "rsconnect::deployApp(appDir='$app_path', appName='$app_name', launch.browser=FALSE)"

url="https://$shiny_username.shinyapps.io/$app_name/"
echo "url=$url" >> $GITHUB_OUTPUT