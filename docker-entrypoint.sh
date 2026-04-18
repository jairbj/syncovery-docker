#!/bin/bash

echo "Setting configuration setting for webserver"
/syncovery/SyncoveryCL SET /WEBSERVER=0.0.0.0

echo "Starting Server"
/syncovery/SyncoveryCL
