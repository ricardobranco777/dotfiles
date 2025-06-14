HISTSIZE=10000000
HISTFILESIZE=$HISTSIZE
HISTCONTROL=ignoreboth
PS1='[\u@\h \w]\$ '

export MANWIDTH=tty
export PAGER=less
if [ -f /usr/local/bin/lesspipe.sh ] ; then
	export LESSOPEN="|/usr/local/bin/lesspipe.sh %s"
fi

# Fix idiotic Systemd behaviour breaking Unix philosophy
# by using a pager by default
if [ -d /etc/systemd ] ; then
	export SYSTEMD_PAGER=
fi

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

# Also alias better GNU commands if available
for cmd in awk find sed ; do
	if command -v g$cmd >/dev/null ; then
		alias $cmd=g$cmd
	fi
done
unset cmd

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

ulimit -c 0

if command -v vim >/dev/null ; then
	export EDITOR=vim
	alias vi='vim'
fi

if [ -n "$PS1" -a -z "$PROMPT_COMMAND" ] ; then
	PROMPT_COMMAND='printf "\033]0;%s@%s:%s\007" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/\~}"'
fi

if [ -n "$PS1" ] ; then
	shopt -s checkhash
	shopt -s extglob
	shopt -s histappend
	shopt -s globstar 2>/dev/null
fi

# Ignore the rest of this file for root users

if [ "$USER" == "root" ] ; then
	return
fi

for dir in /sbin /usr/sbin /usr/local/sbin /usr/local/bin /usr/local/go/bin /usr/pkg/bin /usr/pkg/sbin $HOME/bin $HOME/.local/bin $HOME/go/bin ; do
	if [ ! -d "$dir" ] ; then
		continue
	fi
	case ":$PATH:" in
	*:"$dir":*)
	    	;;
	*)
		PATH="$PATH:$dir"
		;;
    	esac
done

if [ -d /usr/gnu/bin ] ; then
	PATH=/usr/gnu/bin:$PATH
fi

if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
	for dir in /etc/profile.d /usr/local/etc/profile.d/vte.sh /usr/pkg/etc/profile.d/vte.sh ; do
		if [ -f "$dir/vte.sh" ] ; then
			source "$dir/vte.sh"
			break
		fi
	done
	unset dir
fi

if [ -z "$GIT_PROMPT_ONLY_IN_REPO" -a -f "$HOME/.bash-git-prompt/gitprompt.sh" ] ; then
	GIT_PROMPT_ONLY_IN_REPO=1
	GIT_PROMPT_START="[\u@\h \w]"
	GIT_PROMPT_END=" "
	. "$HOME/.bash-git-prompt/gitprompt.sh"
fi

if [[ $PS1 ]] ; then
	if [ -f /usr/local/share/bash-completion/bash_completion.sh ] ; then
		. /usr/local/share/bash-completion/bash_completion.sh
	elif [ -f /usr/local/share/bash-completion/bash_completion ] ; then
		. /usr/local/share/bash-completion/bash_completion
	elif [ -f /usr/pkg/share/bash-completion/bash_completion ] ; then
		. /usr/pkg/share/bash-completion/bash_completion
	fi
fi

# Fix for idiotic "go get"
export GOPROXY=direct

# Fix for idiotic Python Requests not using system certificates
if [ -f /etc/ssl/certs/ca-certificates.crt ] ; then # Debian
	export REQUESTS_CA_BUNDLE=/etc/ssl/certs/ca-certificates.crt
elif [ -f /etc/ssl/certs/ca-bundle.crt ] ; then # Fedora
	export REQUESTS_CA_BUNDLE=/etc/ssl/certs/ca-bundle.crt
elif [ -f /etc/ssl/ca-bundle.pem ] ; then # openSUSE
	export REQUESTS_CA_BUNDLE=/etc/ssl/ca-bundle.pem
fi

# Fix for idiotic Glibc checking /etc/localtime everytime
if [ -z "$TZ" -a -L /etc/localtime ] ; then
	export TZ=$(readlink -f /etc/localtime | sed -e 's/.*zoneinfo\///')
fi

if command -v virsh >/dev/null && [ "$HOSTNAME" != "ricardox" ] ; then
	export LIBVIRT_DEFAULT_URI=qemu+ssh://root@opensuse/system
fi
