FROM        python:alpine

LABEL       org.opencontainers.image.source="https://github.com/ksurl/docker-redbot"

LABEL       maintainer="ksurl"

WORKDIR     /config

VOLUME      /config

ENV         PUID=1000 \
            PGID=1000 \
            INSTANCE="docker"

COPY        init /init

RUN         chmod +x /init && \
            apk add --no-cache --virtual .build-deps \
                gcc \
                make \
                libffi-dev \
                musl-dev && \
            apk add --no-cache --virtual .run-deps \
                dumb-init \
                git \
                openjdk11-jre-headless \
                su-exec && \
            pip install --no-cache-dir \
                Red-DiscordBot && \
            apk del --purge --no-cache .build-deps && \
            rm -rf /tmp/* /var/cache/apk/* /root/.cache

ENTRYPOINT  [ "/usr/bin/dumb-init", "--" ]
CMD         [ "/init" ]
