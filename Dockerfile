FROM python:alpine

LABEL maintainer="ksurl"

WORKDIR /config

VOLUME /config

RUN apk add --no-cache --virtual .build-deps gcc make libffi-dev musl-dev && \
    apk add --no-cache --virtual .run-deps git openjdk11-jre-headless  && \
    pip install --no-cache-dir Red-DiscordBot && \
    apk del --purge --no-cache .build-deps && \
    rm -rf /tmp/* /root/.cache

ARG UID=1000
ARG GID=1000
ARG INSTANCE="docker"

USER ${UID}:${GID}

CMD ["/bin/sh","-c","/usr/local/bin/redbot ${INSTANCE}"]
