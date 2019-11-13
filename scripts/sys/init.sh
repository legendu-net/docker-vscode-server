#!/usr/bin/env bash

# create a user
DOCKER_USER=${DOCKER_USER:-dclong} 
DOCKER_USER_ID=${DOCKER_USER_ID:-9001} 
DOCKER_PASSWORD=${DOCKER_PASSWORD:-$DOCKER_USER} 
DOCKER_GROUP=${DOCKER_GROUP:-docker} 
DOCKER_GROUP_ID=${DOCKER_GROUP_ID:-9001}
/scripts/sys/create_user.sh $DOCKER_USER $DOCKER_USER_ID $DOCKER_PASSWORD $DOCKER_GROUP $DOCKER_GROUP_ID
gpasswd -a $DOCKER_USER sudo

# source in scripts
for f in $(ls /scripts/config/[0-9][0-9][0-9]-*.sh); do
    source $f
done

su -m $DOCKER_USER -c /scripts/sys/launch.sh
#source /scripts/sys/launch.sh
