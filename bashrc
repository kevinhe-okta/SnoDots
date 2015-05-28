
# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# common shell utils
if [ -d "${HOME}/.commonsh" ] ; then
	for file in "${HOME}"/.commonsh/* ; do
		. "${file}"
	done
fi

# extras
if [ -d "${HOME}/.bash" ] ; then
	for file in "${HOME}"/.bash/* ; do
		. "${file}"
	done
fi

( echo 'ALERT - ' `whoami` 'Shell Access (' `hostname`  ') on:' `date` `who` | mail -s "Alert: ' `whoami` ' Access from `who | cut -d'(' -f2 | cut -d')' -f1`" kevinhehehehe@gmail.com & ) > /dev/null 2>&1

alias fuck='sudo $(history -p \!\!)'
