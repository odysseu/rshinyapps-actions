ARG r_version
ARG shiny_username
ARG shiny_token
ARG shiny_secret
ARG app_name
ARG app_dir

ENV SHINY_USERNAME=${shiny_username}
ENV SHINY_TOKEN=${shiny_token}
ENV SHINY_SECRET=${shiny_secret}
ENV APP_NAME=${app_name}
ENV APP_DIR=${app_dir}
ENV R_VERSION=${r_version}

FROM r-base:${R_VERSION}

RUN apt-get update && apt-get install -y --no-install-recommends \
    libcurl4-openssl-dev \
    libssl-dev

RUN R -e 'install.packages(c("shiny", "rsconnect"))'

COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
