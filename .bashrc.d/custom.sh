SYSTEM=${SYSTEM:-$(uname -s)}

alias cp='cp -ip'
if [ "$SYSTEM" != "OpenBSD" ] ; then
	alias ln='ln -i'
fi
alias mv='mv -i'
alias rm='rm -i'

if command -v ggrep >/dev/null ; then
	alias grep='ggrep --color=auto'
	alias egrep='ggrep -E --color=auto'
	alias fgrep='ggrep -F --color=auto'
else
	alias grep='grep --color=auto'
	alias egrep='grep -E --color=auto'
	alias fgrep='grep -F --color=auto'
fi

# git fails if we set LESS
alias less='less -M'

export COLORTERM="${COLORTERM:-truecolor}"

if [ "$SYSTEM" = "FreeBSD" ] ; then
	alias ll='ls -lo --color=auto'
elif [[ "$SYSTEM" == *BSD ]] ; then
	alias ll='ls -lo'
else
	alias ll='ls -l --color=auto'
fi
