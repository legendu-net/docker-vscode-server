#!/bin/bash

export PASSWORD="$DOCKER_PASSWORD" && /usr/bin/code-server \
    --bind-addr 0.0.0.0:8080 \
    --user-data-dir /config/data \
    --extensions-dir /root/.local/share/code-server/extensions \
    --disable-telemetry \
    --auth password \
    /workdir/workspace
