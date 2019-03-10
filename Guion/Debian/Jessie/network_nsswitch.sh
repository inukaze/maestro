#!/bin/bash
#
#
#
FECHA=$(date +"%Y-%m-%d")
HORA=$(date +"%r")
ADC="/etc/nsswitch.conf"

sudo echo -e '\nInukaze , Configurador de : '"$ADC"'\n' ; \
echo -e "Si existe el archivo $ADC\nSe creara la copia : $ADC.$FECHA.$HORA\n" ; \
if test -f $ADC
	then
		sudo cp $ADC $ADC.$FECHA.$HORA
	else
		echo "No existe $ADC , Se creara uno nuevo"
fi ; \
echo '# '"$ADC"'
#
# Example configuration of GNU Name Service Switch functionality.
# If you have the '"'"'glibc-doc-reference'"'"' and '"'"'info'"'"' packages installed, try:
# '"'"'info libc "Name Service Switch"'"'"' for information about this file.

passwd:         files
group:          files
shadow:         files
gshadow:        files

hosts:          files mdns4_minimal [NOTFOUND=return] wins dns mdns4
networks:       files

protocols:      files
services:       files
ethers:         files
rpc:            files

netgroup:       files' | sudo tee "$ADC"
