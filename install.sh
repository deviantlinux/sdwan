#!/bin/bash
#
echo "Please enter mode. Expected Values are server or client"
read -r MODE_INPUT
export MODE=$MODE_INPUT
if [ -z $MODE ] ; then echo "OpenVPN mode not declared. Exiting" ; exit ; fi
if [ $MODE = server ] ; then echo $MODE > $MODE.conf; elif [ $MODE = client ] ; then echo $MODE > $MODE.conf; else echo error $SITE is unexpected; exit; fi 
