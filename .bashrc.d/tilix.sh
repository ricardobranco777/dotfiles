if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
	for dir in /etc/profile.d /usr/local/etc/profile.d/vte.sh /usr/pkg/etc/profile.d/vte.sh ; do
		if [ -f "$dir/vte.sh" ] ; then
			source "$dir/vte.sh"
			break
		fi
	done
	unset dir
fi
