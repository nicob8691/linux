#!/bin/bash

TCP_PORT=$1
FW_ZONE=$2

#--- Authorize non-default port in firewall
	firewall-cmd --permanent --zone=$FW_ZONE --add-port $TCP_PORT/tcp
	firewall-cmd --reload
