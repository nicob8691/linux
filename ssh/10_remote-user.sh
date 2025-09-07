#!/bin/bash

#--- Create remote user for ssh login -----------------------------------------

	#--- Check if user 1001 already exists and delete if so
	if getent passwd 1001 > /dev/null; then
		userdel $(id -nu 1001)
	fi
	
	#--- Add user remote
	useradd -m -u 1001 -G wheel -s /bin/bash remote
	
	#--- Configure user password
	passwd remote
