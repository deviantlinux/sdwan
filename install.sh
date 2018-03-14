#!/bin/bash
#
source env.list
echo "Please enter mode. Expected Values are server or client"
read -r MODE_INPUT
export MODE=$MODE_INPUT
if [ -z $MODE ] ; then echo "OpenVPN mode not declared. Exiting" ; exit ; fi
if [ $MODE = server ] ; then echo $MODE > $MODE.conf; elif [ $MODE = client ] ; then echo $MODE > $MODE.conf; else echo error $MODE is unexpected; exit; fi 
if [ -z $CN ] ; then echo "Client name not decalred. Please check env.list"; fi
if [[ $TUN_MODE != tun ]] ; then echo "Currently only tunnel mode is supported" ;fi
if [[ $MODE = client ]]; then
    echo "dev tun" >> $MODE.conf 
    echo "proto $PROTO" >> $MODE.conf
    echo "remote $SERVER_ADDRESS $SERVER_PORT" >> $MODE.conf 
    echo "resolv-retry infinite" >> $MODE.conf 
    echo "nobind" >> $MODE.conf 
    echo "persist-key" >> $MODE.conf 
    echo "persist-tun" >> $MODE.conf 
    echo "ca ca.crt" >> $MODE.conf 
    echo "cert $CN.crt" >> $MODE.conf  
    echo "key $CN.key" >> $MODE.conf 
    echo "cipher AES-256-CBC" >> $MODE.conf 
    echo 'comp-lzo' >> $MODE.conf 
    echo "verb 3" >> $MODE.conf 
    elif [[ $MODE = server ]]; then
    echo "1" >> $MODE.conf 
    echo "2" >> $MODE.conf
fi
