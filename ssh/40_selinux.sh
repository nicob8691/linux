#!/bin/bash

TCP_PORT=$1
	
#--- Authorize non-default port in SELinux	
	semanage port -a \
		-t ssh_port_t \
		-p tcp $TCP_PORT

	setsebool -P \
		allow_ssh_keysign=0 \
		ssh_sysadm_login=0

