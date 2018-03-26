#!/bin/bash
#
source env.list

echo "Please enter mode. Expected Values are server or client"
	read -r MODE_INPUT
	export MODE=$MODE_INPUT

if [[ $MODE = server ]] 
then 

	echo "Would you like to enable Web Upload for Client CSRs (no)?"
	read -r WEBF_INPUT
	export WEBF=$WEBF_INPUT
		if [[ $WEBF = no ]] ; then echo WebDisabled
		if [ -z $WEBF ] ; then export WEBF=no ; fi
		elif [[ $WEBF = yes ]] ; then 
			if [ -z $token ] 
			then 
				echo "Token not declared . Exiting! " 
			exit 
			fi
 docker run  -d --rm --name sdwanhttp -p 80:25478 -v /var/tmp/test:/var/root mayth/simple-upload-server app -token $token /var/root	
	
	else echo "$WEBF is unexpected" ; exit
        fi	







elif [[ $MODE = client ]] ; then  
    echo ""
fi

if [ -z $MODE ] 
then 
	echo " Mode not declared. exiting!" ; exit
elif [[ $MODE = client ]] 
then

	#echo "place holder for client"
	docker run -i --rm --privileged -e MODE=$MODE --env-file env.list --name sdwan$MODE deviantlinux/sdwan:latest
	#docker run -d --privileged -e MODE=$MODE --env-file env.list --name sdwan$MODE deviantlinux/sdwan:latest



elif [[ $MODE = server ]] 
then  
	#echo "place holder for server"
	#Inline testing command
	#docker run -i --rm --privileged -e MODE=$MODE --env-file env.list -p $SERVER_PORT:$SERVER_PORT/udp --name sdwan$MODE deviantlinux/sdwan:latest
	docker run -i --rm --privileged -e MODE=$MODE --env-file env.list -p $SERVER_PORT:$SERVER_PORT/udp --name sdwan$MODE -v /var/tmp/test:/sdwan/test  deviantlinux/sdwan:latest
	#docker run -d --privileged --restart always -e MODE=$MODE --env-file env.list -p $SERVER_PORT:$SERVER_PORT/udp --name sdwan$MODE deviantlinux/sdwan:latest
else 
	echo " $MODE is Garbage! exit status : PEBCAK"
	exit 
fi
