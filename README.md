# R Shiny apps - actions


Use this github action to deploy your [R shiny application](https://shiny.posit.co/) to [shinyapps.io](https://www.shinyapps.io/).

## Example usage:

Go check out the available [r-base dockerhub versions](https://hub.docker.com/_/r-base/tags) for the R version your shiny app will be running under.

Full exemple for a `.github/workflows/deploy.yml`:

```yml
name: Deploy Shiny App

on:
  push:
    branches:
      - main

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout code
        uses: actions/checkout@v4
        
      - name: Deploy app to ShinyApps.io
        id: deploy
        uses: odysseu/rshinyapps-actions@v1
        with:
          r_version: '4.4.3'  # Specify the desired R version
          shiny_username: ${{ secrets.shiny_username }}
          shiny_token: ${{ secrets.SHINYAPP_TOKEN }}
          shiny_secret: ${{ secrets.SHINYAPP_SECRET }}
          app_name: 'myApp'
          shiny_app_path: './path/to/shiny/app'

      - name: Print URL
        run: echo "The app is deployed at ${{ steps.deploy.outputs.url }}"
```

## Acknowledgement

- [Inspiration for this work](https://github.com/qwert666/shinyapps-actions)
