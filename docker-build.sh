#!/bin/bash

SYNCOVERY_VERSION=${1:-11.14.0}

curl -o syncovery.tar.gz https://www.syncovery.com/release/SyncoveryCL-x86_64-${SYNCOVERY_VERSION}-Web.tar.gz

docker build -t syncovery:latest -t syncovery:${SYNCOVERY_VERSION} .