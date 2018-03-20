#!/bin/bash
#
source env.list
echo "Please enter mode. Expected Values are server or client"
read -r MODE_INPUT
export MODE=$MODE_INPUT
if [ -z $MODE ]; then 
echo " Mode not declared. exiting!" ; exit
elif [[ $MODE = client ]] ; then
echo "place holder for client"
#docker run -d -e $MODE --env-file env.list --name sdwan deviantlinux/sdwan:latest
# or
# docker run --network=host --privileged -d --name ovpn deviantlinux/ovpnclient
#not sure
#Need the priv stuff. brain all over the palce at the moment
elif [[ $MODE = server ]] ; then  
echo "place holder for server"
#docker run -d -e $MODE --env-file env.list -p $SERVER_PORT:SERVER_PORT --name sdwan  #someother stuff specific to server conf
else echo " $MODE is Garbage! exit status : PEBCAK"; exit 
fi
