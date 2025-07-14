#!/bin/bash
# custom_prompt.sh

#--- Foreground / Background colors ---------------------------------
BLA_FG="\[\033[30m\]";	BLA_BG="\[\033[40m\]"	# black
RED_FG="\[\033[31m\]";	RED_BG="\[\033[41m\]"	# red
GRE_FG="\[\033[32m\]";	GRE_BG="\[\033[42m\]"	# green
YEL_FG="\[\033[33m\]";	YEL_BG="\[\033[43m\]"	# yellow
BLU_FG="\[\033[34m\]";	BLU_BG="\[\033[44m\]"	# blue
MAG_FG="\[\033[35m\]";	MAG_BG="\[\033[45m\]"	# magenta
CYA_FG="\[\033[36m\]";	CYA_BG="\[\033[46m\]"	# cyan
GRA_FG="\[\033[37m\]";	GRA_BG="\[\033[47m\]"	# gray
NORMAL="\[\033[0m\]"				# default
#--------------------------------------------------------------------

#--- PS1 command prompt ---------------------------------------------
case "$EUID" in
0)
	PS1="$RED_FG [\u@\h \W]\\$ $NORMAL" ;;
1000)
	PS1="$GRE_FG [\u@\h \W]\\$ $NORMAL" ;;
*)
	PS1="$YEL_FG [\u@\h \W]\\$ $NORMAL" ;;
esac

#--- Bash prompts ---------------------------------------------------
#PS0 is displayed after each command, before any output.
#PS1 is the primary prompt which is displayed before each command
#PS2 is the secondary prompt displayed when a command needs more input
#PS3 is the prompt displayed for Bash's select built-in
#PS4 is displayed when debugging bash scripts to indicate levels of indirection

#--- Escape characters ----------------------------------------------
#\h    the hostname up to the first `.'
#\u    the username of the current user
#\w    the value of the PWD shell variable
#\d    the date in "Weekday Month Date" format (e.g., "Tue May 26")
#\t    the current time in 24-hour HH:MM:SS format
#\r    carriage return
#\[    begin a sequence of non-printing characters
#\]    end a sequence of non-printing characters
