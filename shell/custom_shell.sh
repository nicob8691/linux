#!/bin/bash

#--- Configure bash aliases ans custom prompt
cp -rv /home/git/linux/shell/resources/* /etc/profile.d/

#--- Make sure bash is default shell for root & default user
usermod -s /bin/bash root
usermod -s /bin/bash $(id -nu 1000)
