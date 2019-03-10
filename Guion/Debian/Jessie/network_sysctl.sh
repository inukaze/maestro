#!/bin/bash

FECHA=$(date +"%Y-%m-%d")
HORA=$(date +"%r")
ADC="/etc/sysctl.conf"

sudo echo -e '\nInukaze , Configurador de : '"$ADC"'\n' ; \
echo -e "Si existe el archivo $ADC\nSe creara la copia : $ADC.$FECHA.$HORA\n" ; \
echo -e "Este Script Deshabilita del sistema las IPv6\nYa que no se usan en Venezuela"
if test -f $ADC
	then
		sudo cp "$ADC" "$ADC.$FECHA.$HORA"
	else
		echo "No existe $ADC , Se creara uno nuevo"
fi ; \
echo '
# Inukaze : Yo deshabilito las IPv6 , por que no se usan
# En Venezuela , y tornan la navegacion por internet
# Extremadamente lentas

net.ipv6.conf.all.disable_ipv6 = 1
net.ipv6.conf.default.disable_ipv6 = 1
net.ipv6.conf.lo.disable_ipv6 = 1
net.ipv6.conf.eth0.disable_ipv6 = 1' >> "$ADC"
