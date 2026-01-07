HISTSIZE=-1
HISTFILESIZE=$HISTSIZE
# ignoreboth = ignoredups & ignorespace
HISTCONTROL=ignoreboth
PS1='[\u@\h \w]\$ '

if [ -n "$PS1" -a -z "$PROMPT_COMMAND" ] ; then
	PROMPT_COMMAND='printf "\033]0;%s@%s:%s\007" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/\~}"'
fi

if [ -n "$PS1" ] ; then
	shopt -s checkhash
	shopt -s extglob
	shopt -s histappend
	shopt -s globstar 2>/dev/null
fi

if [ -n "$PS1" ] ; then
	if [ -f /usr/local/share/bash-completion/bash_completion.sh ] ; then
		. /usr/local/share/bash-completion/bash_completion.sh
	elif [ -f /usr/local/share/bash-completion/bash_completion ] ; then
		. /usr/local/share/bash-completion/bash_completion
	elif [ -f /usr/pkg/share/bash-completion/bash_completion ] ; then
		. /usr/pkg/share/bash-completion/bash_completion
	fi
fi
