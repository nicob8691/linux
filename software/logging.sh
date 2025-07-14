#!/bin/bash

dmesg --level emerg && echo
dmesg --level alert && echo
dmesg --level crit && echo
dmesg --level err && echo
dmesg --level warn && echo
#dmesg --level notice && echo
#dmesg --level info && echo
#dmesg --level debug && echo

journalctl
