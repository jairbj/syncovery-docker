FROM ubuntu:24.04

ARG SYNCOVERY_VERSION=11.14.0

ENV SYNCOVERY_HOME=/config

# Prepares
RUN mkdir /syncovery
WORKDIR /syncovery

# Download and install syncovery
RUN apt update \
    && apt install -y curl libsqlite3-0 libsmbclient0 gosu \
    && rm -rf /var/lib/apt/lists/*

# Create default syncovery user/group (will be remapped at runtime via PUID/PGID)
RUN groupadd -g 10000 syncovery \
    && useradd -u 10000 -g syncovery -s /bin/bash -d /syncovery syncovery \
    && mkdir -p /config \
    && chown -R syncovery:syncovery /syncovery /config

ADD ./syncovery.tar.gz /syncovery/
COPY ./docker-entrypoint.sh /syncovery/
RUN chmod +x SyncoveryCL \
    && chmod +x docker-entrypoint.sh \
    && chown -R syncovery:syncovery /syncovery

EXPOSE 8999

# Starts syncovery
ENTRYPOINT [ "/syncovery/docker-entrypoint.sh" ]