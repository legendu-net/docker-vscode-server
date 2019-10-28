#!/bin/bash

/usr/bin/code-server \
    --port 8080 \
    --user-data-dir /workdir/data \
    --extensions-dir /workdir/extensions \
    --disable-telemetry \
    --disable-updates \
    --auth "${DOCKER_PASSWORD}" \
    /workdir/workspace
