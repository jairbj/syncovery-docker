#!/bin/bash

PUID=${PUID:-10000}
PGID=${PGID:-10000}

echo "Running as UID: ${PUID} / GID: ${PGID}"

groupmod -o -g "${PGID}" syncovery
usermod -o -u "${PUID}" syncovery

chown -R syncovery:syncovery /syncovery /config 2>/dev/null || true

echo "Setting configuration setting for webserver"
gosu syncovery /syncovery/SyncoveryCL SET /WEBSERVER=0.0.0.0

echo "Starting Server"
exec gosu syncovery /syncovery/SyncoveryCL
