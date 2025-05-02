#!/bin/sh
set -e

# Use the environment variables defined in the Dockerfile
SHINY_USERNAME=${SHINY_USERNAME}
SHINY_TOKEN=${SHINY_TOKEN}
SHINY_SECRET=${SHINY_SECRET}
APP_NAME=${APP_NAME}
APP_DIR=${APP_DIR}
R_VERSION=${R_VERSION}

echo "Authorizing $SHINY_USERNAME"

Rscript -e "rsconnect::setAccountInfo(name='$SHINY_USERNAME', token='$SHINY_TOKEN', secret='$SHINY_SECRET')"

echo "Deploying $APP_NAME from $APP_DIR to shinyapps.io; it will be running under R $R_VERSION"

# Ensure the app_path is correctly set
app_path="$APP_DIR"

Rscript -e "rsconnect::deployApp(appDir='$app_path', appName='$APP_NAME', launch.browser=FALSE)"

url="https://$SHINY_USERNAME.shinyapps.io/$APP_NAME/"
echo "::set-output name=url::$url"
