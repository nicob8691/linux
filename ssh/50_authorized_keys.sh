#!/bin/bash

KEYS=$1

#--- Add prior-knowledge pubkeys from authorized clients
	mkdir -p /home/remote/.ssh/ 
	cp $KEYS /home/remote/.ssh/authorized_keys
