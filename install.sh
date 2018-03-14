#!/bin/bash
#
source env.list
echo "Please enter mode. Expected Values are server or client"
read -r MODE_INPUT
export MODE=$MODE_INPUT

docker run -d -e $MODE --env-file env.list --name sdwan deviantlinux/sdwan:latest
