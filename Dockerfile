FROM ubuntu:24.04

ARG SYNCOVERY_VERSION=11.14.0

ENV SYNCOVERY_HOME=/config

# Prepares
RUN mkdir /syncovery
WORKDIR /syncovery

# Download and install syncovery
RUN apt update \
    && apt install -y curl libsqlite3-0 libsmbclient0 \
    && rm -rf /var/lib/apt/lists/*

ADD ./syncovery.tar.gz /syncovery/
COPY ./docker-entrypoint.sh /syncovery/
RUN chmod +x SyncoveryCL \
    && chmod +x docker-entrypoint.sh

EXPOSE 8999

# Starts syncovery
ENTRYPOINT [ "/syncovery/docker-entrypoint.sh" ]