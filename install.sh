#!/bin/bash
#
source env.list
echo "Please enter mode. Expected Values are server or client"
read -r MODE_INPUT
export MODE=$MODE_INPUT

if [[ $MODE = client ]] ; then
#docker run -d -e $MODE --env-file env.list --name sdwan deviantlinux/sdwan:latest
# or
# docker run --network=host --privileged -d --name ovpn deviantlinux/ovpnclient
#not sure
#Need the priv stuff. brain all over the palce at the moment

else 
docker run -d -e $MODE --env-file --name -- someother stuff specific to server conf
#!Fuck sake
