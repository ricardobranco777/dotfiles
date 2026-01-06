# Fix idiotic Systemd behaviour breaking Unix philosophy
# by using a pager by default
if [ -d /etc/systemd ] ; then
	export SYSTEMD_PAGER=
fi 
