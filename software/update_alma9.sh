#!/bin/bash

#PowerTools/CRB
#The PowerTools repository contains additional packages for use by developers.
#This repository is also known as the "CodeReady Builder" repository used on RHEL.
dnf config-manager --set-enabled crb

#High Availability
#The High Availability add-on provides on-demand failover services between nodes within a cluster
dnf config-manager --set-enabled highavailability

#Update
dnf update -y
