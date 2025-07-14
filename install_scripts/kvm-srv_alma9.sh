#!/bin/bash
# Hostkvm installation scripts for AlmaLinux 9
GIT="/home/git"
for f in $GIT/linux/functions/*; do source $f; done
if [ "$EUID" -ne 0 ]; then echo "This scritp shall be run by root."; exit 1; fi

### INITIAL LOGGING -----------------------------------------------------------
#Backup a fresh install logging
call_function "$GIT/linux/software/logging.sh"

### REPOS, SOFTWARES & SYSTEM UPDATE ------------------------------------------
#Enable additionnal repos (PowerTools/CRB and High Availability),
#update and install usefull cli tools
call_function "$GIT/linux/software/update_alma9.sh"
call_function "$GIT/linux/software/cli-tools_alma9.sh"

### HARDWARE CONFIGURATION ----------------------------------------------------
#Configure disks automounting (fstab), network interfaces and associated firewall zones
#call_function hardware/disks_hostkvm.sh
#call_function hardware/networks_hostkvm.sh
#call_function hardware/firewall_hostkvm.sh

### SHELL & SSH CONFIGURATION -------------------------------------------------
#Customize shell prompt and add usefull aliases, configure ssh
call_function "$GIT/linux/shell/custom_shell.sh"
#call_function ssh/ssh_hostkvm.sh
#call_function smb/smb_alma9.sh	|not enabled: errors when re-exec more than once (smb_users.sh)

### KERNEL CONFIGURATION FOR VIRTUALISATION -----------------------------------
#Enable intel-gvt module in kernel, create vgpu & configure hugepages
#call_function kernel/10_kernel-upgrade_alma9.sh
#call_function kernel/20_tuned_alma9.sh
#call_function kernel/30_intel-gvt.sh
#call_function kernel/40_hugepages.sh

### QEMU/KVM & LIBVIRT CONFIGURATION ------------------------------------------
#Install and configure virtualisation core tools
#call_function qemu/10_virt-tools-install_alma9.sh
#call_function qemu/20_libvirt-dirs.sh
#call_function qemu/30_libvirt-users.sh
#call_function qemu/40_libvirt-firewall.sh
#call_function qemu/50_libvirt-selinux.sh

### GRAPHICAL USER INTERFACE
#Install sway with foot, dmenu and mybar
#call_function "gui/i3_sway/sway_alma9.sh"
#call_function "gui/mybar/mybar_alma9.sh hostkvm"
#call_function "gui/dmenu/dmenu_alma9.sh"
#call_function "gui/foot/foot_alma9.sh"
#call_function "gui/gdm/gdm_alma9.sh"
#call_function "gui/gtheming.sh"
#call_function gui/gnome_alma9.sh
