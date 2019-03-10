#!/bin/bash
#
#
#
sudo echo 'Primero se intentara instalar "wget" en caso de que no este' ; \
sudo apt-get -y install wget

# Obtener Arquitectura del Sistema
Arquitectura=$(uname -m)
case "$Arquitectura" in
    x86)    Arquitectura="i386"                                            ;;
    ia64)   Arquitectura="ia64"                                            ;;
    i?86)   Arquitectura="i386"                                            ;;
    amd64)  Arquitectura="amd64"                                           ;;
    x86_64) Arquitectura="x86_64"                                          ;;
    sparc64)    Arquitectura="sparc64"                                     ;;
* ) echo    "Tu Arquitectura '$Arquitectura' -> NO ESTA SOPORTADA."        ;;
esac

DIRECCION="http://products.kaspersky-labs.com/products/multilanguage/workstations/keslinux/"
#UVDKPD=$(curl -s http://products.kaspersky-labs.com/products/multilanguage/workstations/keslinux/ | grep ".$Arquitectura.deb" | cut -d " " -f19 | sed 's/^[href="\t^<a\t]*//' | sed 's/\(deb\).*/\1/' | head -1)
UVDKPD=$(curl -s http://products.kaspersky-labs.com/products/multilanguage/workstations/keslinux/ | grep ".i386.deb" | cut -d " " -f19 | sed 's/^[href="\t^<a\t]*//' | sed 's/\(deb\).*/\1/' | head -1)

cd /tmp
wget $DIRECCION$UVDKPD
sudo dpkg -i $UVDKPD
sudo mkdir "/opt/kaspersky/keys"
sudo chmod 777 "/opt/kaspersky/keys"
echo '
Se establece el servicio de Kaspersky Endpoint Security
'
sudo systemctl enable kes4lwks-supervisor

echo '
Se inicia el servicio de Kaspersky Endpoint Security
'
sudo systemctl start kes4lwks-supervisor

echo '
Se iniciara la configuracion de Kaspersky Endpoint Security

Se te preguntara la ruta completa de tu archivo de liscensia valida con extension .key
Se recomienda colocar dichos archivos en el directorio "/opt/kaspersky/keys"
Ejemplo : /opt/kaspersky/keys/52D47185.key


Se recomineda no usar la proteccion Samba en caso de
Compartir archivos y/o Impresoras con redes de Microsoft Windows'
sudo /opt/kaspersky/kes4lwks/bin/kes4lwks-setup.pl
# En caso de haber habilitado la proteccion para Samba
# Y debido a ella , no puedas acceder a las redes Microsoft Windows
# Edita el archivo /etc/samba/smb.conf
# Y Elimina las siguientes lineas :
	# ADDED BY KASPERSKY ENDPOINT SECURITY 8 FOR LINUX VERSION 8.0.1.50/RELEASE
	# vfs object = kes4lwks-smb-vfs28


echo 'Estableciendo que haga las actualizaciones al medio dia , y que las haga a cada 12 horas'
sudo /opt/kaspersky/kes4lwks/bin/kes4lwks-control --set-schedule 6 StartTime='12:00:00;; 720'

#El 720 indica la cantidad de horas en minutos , de cuando se hara la proxima actualizacion
#Me hubiera gustado colocarle a cada 24 horas , pero no acepta 1440
#No acepta un valor mayor de 999 que son 17 Horas y 5 minutos
