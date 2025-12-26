#!/bin/bash

#--- Create & Configure /etc/bashrc.d
if ! grep -qF "# >>> bashrc.d support >>>" "/etc/bashrc"; then
	mkdir -p "/etc/bashrc.d" && chmod 755 "/etc/bashrc.d"
	cp -a "/etc/bashrc" "/etc/bashrc.bak.$(date +%Y%m%d%H%M%S)"
	cat <<'EOF' >> "/etc/bashrc"

# >>> bashrc.d support >>>
# Source additional interactive shell configuration fragments
if [[ $- == *i* ]]; then
    if [ -d /etc/bashrc.d ]; then
	for f in /etc/bashrc.d/*.sh; do
	    [ -r "$f" ] && . "$f"
	done
    fi
fi
# <<< bashrc.d support <<<
EOF

fi

#--- Configure bash custom prompt (PS1)
cp -v /home/git/linux/shell/resources/custom_prompt.sh /etc/bashrc.d/custom_prompt.sh

#--- Configure bash aliases
cp -rv /home/git/linux/shell/resources/alias_*.sh /etc/bashrc.d/

#--- Make sure bash is default shell for root & default user
usermod -s /bin/bash root
usermod -s /bin/bash $(id -nu 1000)
