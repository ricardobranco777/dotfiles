export MANWIDTH=tty
export PAGER=less
if [ -f /usr/local/bin/lesspipe.sh ] ; then
	export LESSOPEN="|/usr/local/bin/lesspipe.sh %s"
fi 
