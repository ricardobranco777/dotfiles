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

if [ -d /usr/gnu/bin ] ; then
	PATH=/usr/gnu/bin:$PATH
fi

# User specific environment and startup programs
