#!/usr/bin/env bash

su -m $DOCKER_USER -c "xinstall ipython -c"
export PATH=$PATH:/usr/local/go/bin:/usr/lib/jvm/java-8-openjdk-amd64/bin
