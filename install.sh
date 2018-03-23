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
#docker run -d --privileged -e $MODE --env-file env.list --name sdwan$MODE deviantlinux/sdwan:latest
elif [[ $MODE = server ]] ; then  
#echo "place holder for server"
 
	#Inline testing command
		docker run -i --rm --privileged -e MODE=$MODE --env-file env.list -p $SERVER_PORT:$SERVER_PORT/udp --name sdwan$MODE deviantlinux/sdwan:latest

#docker run -d --privileged --restart always -e MODE=$MODE --env-file env.list -p $SERVER_PORT:$SERVER_PORT/udp --name sdwan$MODE deviantlinux/sdwan:latest
else echo " $MODE is Garbage! exit status : PEBCAK"; exit 
fi
