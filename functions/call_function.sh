#!/bin/bash

call_function () {
#$1: called script

	### Set error option for bash -----------------------------------------
	set -euo pipefail

	### Initialise variables ----------------------------------------------
	local SCRIPT_NAME=${1##*/}
	#------------------------------------------------
	local CALLER_SCRIPT="${BASH_SOURCE[1]}"
	local CALLER_DIR="${CALLER_SCRIPT%/*}"
	local CALLER_BASE="${CALLER_SCRIPT##*/}"
	local CALLER_NAME="${CALLER_BASE%.*}"
	#------------------------------------------------
	local LOG_DIR="$CALLER_DIR/.logs/${CALLER_NAME}"
	local DATE="$(date +%Y.%m.%d-%H:%M:%S)"
	local LOG_FILE="$LOG_DIR/$SCRIPT_NAME-$DATE.log"
	local MARKER_FILE="$LOG_DIR/$SCRIPT_NAME.done"
	### Make sure .log dir exists or create -------------------------------
	mkdir -p "$LOG_DIR"

	### Test if script have already been succesfully ran
	if [ ! -f "$MARKER_FILE" ]; then

		### Print script header -----------------------------------------------
		TEXT="----- Script $SCRIPT_NAME run by $USER on $DATE -----"
		printf "\n\033[44m$TEXT\033[0m\n\n"

		### Run script --------------------------------------------------------
		(
		bash -ex "$1" && touch "$MARKER_FILE"
		) 2>&1 | tee -ia "$LOG_FILE"

		### Confirm script ran well -------------------------------------------
		TEXT="--- script $SCRIPT_NAME ended well ---"
		printf "\n\033[42m$TEXT\033[0m\n\n"

	else
		TEXT="--- script $SCRIPT_NAME has already been ran successfully ---"
		printf "\n\033[42m$TEXT\033[0m\n\n"
	fi

	#--- Ensure group ownership and mode
	chown -R "$USER:gitusers" "$LOG_DIR"
	chmod -R 770 "$LOG_DIR"

 }
