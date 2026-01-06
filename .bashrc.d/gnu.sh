# Also alias better GNU commands if available
for cmd in awk find sed ; do
	if command -v g$cmd >/dev/null ; then
		alias $cmd=g$cmd
	fi
done
unset cmd
