#!/bin/bash

TCP_PORT=$1
IPv4_ADDRESS=$2

#--- Copy config file ---------------------------------------------------------

	#--- Back-up initial sshd_config
	cp /etc/ssh/sshd_config /etc/ssh/sshd_config.bak

	#--- Copy config file and resources
	cp /home/git/linux/ssh/resources/sshd_config /etc/ssh/sshd_config
	cp /home/git/linux/ssh/resources/sshd_banner /etc/ssh/sshd_banner

	#--- Change default port and address
	sed -i "s/TCP_PORT/$SSH_PORT/g" /etc/ssh/sshd_config
	sed -i "s/IPv4_ADDRESS/$ADDRESS/g" /etc/ssh/sshd_config
