#!/bin/bash
#
#
#
sudo echo -e '\nConfigurando noip2 con SystemD\n' ; \
sudo mkdir -p "/usr/local/src" ; cd "/usr/local/src/"  ; \
sudo wget http://www.noip.com/client/linux/noip-duc-linux.tar.gz ; sudo tar xfvz noip-duc-linux.tar.gz  ; \
cd noip-*  ; \
NOIP2=$(echo $PWD) ; sudo chmod 755 -R $NOIP2 ; cd $NOIP2  ; \
sudo make && sudo make install ; cd /usr/local/bin ; sudo ln -s noip2 /usr/bin/noip2  ; \
sudo noip2 -C -Y ; sudo mv /tmp/no-ip2.conf /usr/local/etc/no-ip2.conf ;  sudo chmod 755 /etc/no-ip2.conf ; \
sudo touch /etc/systemd/system/noip2.service ; \
sudo chmod 644 /etc/systemd/system/noip2.service ; \
sudo echo '[Unit]
Description=No-IP Dynamic DNS Update Client
After=network.target

[Service]
Type=forking
ExecStart=/usr/local/bin/noip2

[Install]
WantedBy=multi-user.target
' | sudo tee /etc/systemd/system/noip2.service ; \
sudo ln -s /usr/local/bin/noip2 /usr/bin/noip2 ; \
sudo systemctl enable noip2.service ; \
sudo systemctl start noip2.service
