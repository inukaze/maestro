#!/bin/bash
#
#
#
FECHA=$(date +"%Y-%m-%d")
HORA=$(date +"%r")
ADC="/etc/network/interfaces"

sudo echo -e '\nInukaze , Configurador de : '"$ADC"'\n' ; \
echo -e "Si existe el archivo $ADC\nSe creara la copia : $ADC.$FECHA.$HORA\n" ; \
if test -f $ADC
	then
		sudo cp "$ADC" "$ADC.$FECHA.$HORA"
	else
		echo "No existe $ADC , Se creara uno nuevo"
fi ; \
echo '# '"$ADC"'
# This file describes the network interfaces available on your system
# and how to activate them. For more information, see interfaces(5).

# The loopback network interface
auto lo
iface lo inet loopback

# The primary network interface
# allow-hotplug eth0
# iface eth0 inet dhcp' | sudo tee "$ADC"
