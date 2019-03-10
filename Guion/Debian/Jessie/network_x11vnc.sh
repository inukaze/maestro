#!/bin/bash
#
# Puede ser una opcion utilizarlo junto con "noip2"
#
ippriv=$(ifconfig $1 | grep "inet addr" | awk -F: '{print $2}' | awk '{print $1}' | head -n 1)
ippub=$(dig +short myip.opendns.com @resolver1.opendns.com)
sudo echo "Instalacion de Servidor VNC" ; \
sudo apt-get install -y x11vnc
echo -e '\nIndicarle a iptables que permitala ENTRADA y las ACEPTE desde
El protocolo TCP a traves de los puertos : 5800,5900\n'
sudo iptables -A INPUT -p tcp --dport 5800 -j ACCEPT ; \
sudo iptables -A INPUT -p tcp --dport 5900 -j ACCEPT ; \
echo -e '\nIndicarle a iptables que permitala ENTRADA y las ACEPTE desde\nLa direccion publica de Internet : "inukaze.noip.net"\nA traves de los puertos : 5800,5900\n' ; \
sudo iptables -I INPUT -p tcp --dport 5800 -m string --algo bm  --string 'GET /inukaze.noip.net.' -j ACCEPT ; \
sudo iptables -I INPUT -p tcp --dport 5900 -m string --algo bm  --string 'GET /inukaze.noip.net.' -j ACCEPT ; \
echo '

Se te pedira que establezcas
Una Contraseña para tu Servidor VNC'
/usr/bin/x11vnc -storepasswd
/usr/bin/x11vnc -usepw -forever &


X11VNC=$(ps -A | grep x11vnc | awk '{print $4}')

if [ "$X11VNC" = "x11vnc" ]; then
echo '

Iniciado Servidor VNC

Si estas desde un Router en una Intranet
usa tu IP Privada ( '"$ippriv"' ) para conectarte.

Si estas desde fuera de la Intranet
Usa tu IP Publica ( '"$ippub"' ) para conectarte.

Se te pedira la contraseña que
estableciste anteriormente'
