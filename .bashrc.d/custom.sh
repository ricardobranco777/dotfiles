export HISTSIZE=-1
export HISTFILESIZE=-1
export HISTCONTROL=ignoreboth

export PAGER=less
export SYSTEMD_PAGER=

alias cp='cp -ip'
alias ln='ln -i'
alias mv='mv -i'
alias rm='rm -i'

umask 027

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
fi

# Ignore the rest of this file for root users

if [ "$USER" == "root" ] ; then
	return
fi

for dir in /sbin /usr/sbin /usr/local/sbin /usr/local/go/bin $HOME/bin $HOME/.local/bin $HOME/go/bin ; do
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
unset dir

if [ -z "$GIT_PROMPT_ONLY_IN_REPO" -a -f "$HOME/.bash-git-prompt/gitprompt.sh" ] ; then
	GIT_PROMPT_ONLY_IN_REPO=1
	GIT_PROMPT_END=" "
	source "$HOME/.bash-git-prompt/gitprompt.sh"
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
	export LIBVIRT_DEFAULT_URI=qemu+ssh://ricardo@ricardox/system
fi

if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
	source /etc/profile.d/vte.sh
fi