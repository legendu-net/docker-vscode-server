#!/bin/bash
# su -m $DOCKER_USER -c /scripts/launch.sh

export PASSWORD="$DOCKER_PASSWORD" && su $DOCKER_USER -c /usr/bin/code-server \
    --port 8080 \
    --user-data-dir /config/data \
    --extensions-dir /config/extensions \
    --allow-https \
    --disable-telemetry \
    --disable-updates \
    --auth password \
    /workdir/workspace
