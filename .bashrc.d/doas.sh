if ! command -v sudo >/dev/null && command -v doas >/dev/null ; then
	alias sudo=doas
fi
