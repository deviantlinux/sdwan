#!/bin/bash
#
source env.list
echo "Please enter mode. Expected Values are server or client"
read -r MODE_INPUT
export MODE=$MODE_INPUT
if [ -z $MODE ] ; then echo "OpenVPN mode not declared. Exiting" ; exit ; fi
if [ $MODE = server ] ; then echo $MODE > $MODE.conf; elif [ $MODE = client ] ; then echo $MODE > $MODE.conf; else echo error $MODE is unexpected; exit; fi 
if [ -z $CN ] ; then echo "Client name not decalred. Please check env.list"; fi
