# .bash_profile

# Useful on non-Linux systems
SYSTEM=${SYSTEM:-$(uname -s)}
if [ "$SYSTEM" != "Linux" -a "$SYSTEM" != "Darwin" ] ; then
	. ~/.profile
fi

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

dirs=()
# SunOS grep sucks
dirs+=(/usr/gnu/bin)
# Give preference to /usr/local
dirs+=(/usr/local/bin /usr/local/sbin)
# pkgsrc
dirs+=(/usr/pkg/bin /usr/pkg/sbin)
# POSIX & system PATH
dirs+=(/bin /sbin /usr/bin /usr/sbin)
dirs+=(${PATH//:/ })
# Golang
dirs+=(/usr/local/go/bin)
# User-writable directories should come last
dirs+=($HOME/bin $HOME/.local/bin $HOME/go/bin)

PATH=

for dir in "${dirs[@]}" ; do
	if [ ! -d "$dir" ] ; then
		continue
	fi
	case ":$PATH:" in
	*:"$dir":*) ;; # seen
	*)
		if [ -z "$PATH" ] ; then
			PATH="$dir"
		# Put ccache first
		elif [[ "$dir" =~ /ccache$ ]] ; then
			PATH="$dir:$PATH"
		else
			PATH="$PATH:$dir"
		fi ;;
	esac
done

unset dir dirs

# User specific environment and startup programs
