#!/bin/bash

call_function () {
#$1: called script

	### Set error option for bash -----------------------------------------
	set -euo pipefail

	### Initialise variables ----------------------------------------------
	local SCRIPT=$1
	local SCRIPT_NAME=${SCRIPT##*/}
	local CALLER_SCRIPT=${BASH_SOURCE[1]}
	local LOG_DIR="${CALLER_SCRIPT%/*}/.${CALLER_SCRIPT##*/}.log"
	local DATE="$(date +%Y.%m.%d-%H:%M:%S)"
	local LOG_FILE="$LOG_DIR/$SCRIPT_NAME-$DATE.log"

	### Make sure .log dir exists or create -------------------------------
	mkdir -p $LOG_DIR

	### Log all script commands & outputs ---------------------------------
	exec > >(tee -ia $LOG_FILE) 2>&1

	### Test if script have already been ran (log exists)
	if ! compgen -G "$LOG_DIR/$SCRIPT_NAME-*.log" > /dev/null; then

		### Print script header -----------------------------------------------
		TEXT="----- Script $SCRIPT_NAME run by $USER on $DATE -----"
		printf "\n\033[44m$TEXT\033[0m\n\n"

		### Run script --------------------------------------------------------
		bash -ex $1

		### Confirm script ran well -------------------------------------------
		TEXT="--- script $SCRIPT_NAME ended well ---"
		printf "\n\033[42m$TEXT\033[0m\n\n"

	else
		TEXT="--- script $SCRIPT_NAME has already been ran successfully ---"
		printf "\n\033[42m$TEXT\033[0m\n\n"
	fi

	#--- Ensure group ownership and mode
	chown -R $USER:gitusers $LOG_DIR
	chmod -R 770 $LOG_DIR

 }
