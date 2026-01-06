# Fix for idiotic Glibc checking /etc/localtime everytime
if [ -z "$TZ" -a -L /etc/localtime ] ; then
	export TZ=$(readlink -f /etc/localtime | sed -e 's/.*zoneinfo\///')
fi
