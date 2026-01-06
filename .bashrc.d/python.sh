if [ -f /etc/ssl/certs/ca-certificates.crt ] ; then # Debian
	export REQUESTS_CA_BUNDLE=/etc/ssl/certs/ca-certificates.crt
elif [ -f /etc/ssl/certs/ca-bundle.crt ] ; then # Fedora
	export REQUESTS_CA_BUNDLE=/etc/ssl/certs/ca-bundle.crt
elif [ -f /etc/ssl/ca-bundle.pem ] ; then # openSUSE
	export REQUESTS_CA_BUNDLE=/etc/ssl/ca-bundle.pem
fi

