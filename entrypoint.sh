#!/bin/sh
set -e

echo "Authorizing $shiny_username"

Rscript -e "rsconnect::setAccountInfo(name='$shiny_username', token='$shiny_token', secret='$shiny_secret')"

echo "Deploying $app_name from $shiny_path to shinyapp.io"

app_path="$GITHUB_WORKSPACE/$app_dir"

Rscript -e "rsconnect::deployApp(appDir='$app_path', appName='$app_name', launch.browser=FALSE)"

url="https://$shiny_username.shinyapps.io/$app_name/"
echo "::set-output name=url::$url"
