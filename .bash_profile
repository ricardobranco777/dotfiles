# .bash_profile

# Useful on non-Linux systems
SYSTEM=$(uname -s)
if [ "$SYSTEM" != "Linux" ] ; then
	. ~/.profile
fi

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs
