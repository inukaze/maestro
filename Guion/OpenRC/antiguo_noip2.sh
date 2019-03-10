#!/bin/bash

sudo echo 'Configurando noip2 con OpenRC' ; \
sudo mkdir -p /usr/local/src ; cd /usr/local/src/
sudo wget http://www.noip.com/client/linux/noip-duc-linux.tar.gz ; sudo tar xfvz noip-duc-linux.tar.gz
cd noip-*
NOIP2=$(echo $PWD) ; sudo chmod 755 -R $NOIP2 ; cd $NOIP2
sudo make && sudo make install ; cd /usr/local/bin ; sudo ln -s noip2 /usr/bin/noip2
sudo touch /etc/init.d/noip2
sudo chmod a+o+x /etc/init.d/noip2
echo '#! /bin/sh
# /etc/init.d/noip2.sh

# Supplied by no-ip.com
# Modified for Debian GNU/Linux by Florian Moesch

#. /lib/lsb/init-functions # modify for your init-functions

PROG=/usr/bin/noip2
NAME=noip2

test -x $PROG || exit 0

case "$1" in
        start)
	        echo -n "Starting dynamic address update: "
	        $PROG
	        echo "$NAME."
        ;;
        stop)
	        echo -n "Shutting down dynamic address update:"
	        killall $NAME
	        echo "$NAME."
;;
	restart)
	        echo -n "Restarting dynamic address update: "
	        killall $NAME
	        $PROG
	        echo "$NAME."
;;
        *)
	        echo "Usage: $0 {start|stop|restart}"
	        exit 1
	        esac
exit 0
' | sudo tee /etc/init.d/noip2
sudo chmod a+x /etc/init.d/noip2 ; \
sudo rc-update add noip2 default ; \
sudo rc-service noip2 restart
