#!/bin/bash

docker pull dclong/jupyterhub-more:next
docker build -t dclong/vscode-server:next .
#docker build --no-cache -t dclong/vscode-server:next .
