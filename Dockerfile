ARG r_version="4.4.3"
FROM r-base:${r_version}

ARG shiny_username
ARG shiny_token
ARG shiny_secret
ARG app_name
ARG shiny_app_path

ENV r_version=${r_version}
ENV shiny_username=${shiny_username}
ENV shiny_token=${shiny_token}
ENV shiny_secret=${shiny_secret}
ENV app_name=${app_name}
ENV shiny_app_path=${shiny_app_path}

RUN apt-get update && apt-get install -y --no-install-recommends \
    libcurl4-openssl-dev \
    libssl-dev

RUN R -e 'install.packages(c("shiny", "rsconnect"))'

COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
