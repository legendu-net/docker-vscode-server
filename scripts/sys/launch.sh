#!/bin/bash

export PASSWORD="$DOCKER_PASSWORD" && /usr/bin/code-server \
    --port 8080 \
    --user-data-dir /config/data \
    --extensions-dir /root/.local/share/code-server/extensions \
    --disable-telemetry \
    --disable-updates \
    --auth password \
    /workdir/workspace
