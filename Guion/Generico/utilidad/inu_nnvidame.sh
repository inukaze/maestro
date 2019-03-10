#!/bin/bash

# Archivo : /usr/bin/nnvidiame
# 
# Autor         :       Inukaze ( Venezuela )
# Sitio         :       http://https://goo.gl/ij6WqW
# Correo-E      :       bloginukaze@gmail.com
# Licensia      :       GPL 2
#
# Acerca de este Script :
#
# Este un "REBUSQUE" para Solucionar que el sistema
# No inicia la aceleracion de video con el controlador privativo "nvidia"
# al iniciar el sistema.
        
nvidia_version=$(cd /var/lib/dkms ; ls | grep nvidia* | sed 's/[nvidia ]*.//' | sed 's!/*$!!')
nvidia_ejecucion=$(lsmod | grep nvidia)

if [[ -z "$nvidia_ejecucion" ]]
then
     modprobe nvidia-"$nvidia_version"
fi

echo
echo "Version del Controlador nvidia : $nvidia_version"
echo

gestor_de_session=$(ps -A | grep [q,k,light,lx,m,sd,w,x]dm | head -n 1| awk '{print $4}' \
; ps -A | grep slim | head -n 1| awk '{print $4}' \
; ps -A | grep qingy | head -n 1| awk '{print $4}' \
; ps -A | grep deepin | head -n 1| awk '{print $4}' \
; ps -A | grep entrance | head -n 1| awk '{print $4}' )

case "$gestor_de_session" in
  qdm)     echo "Gestor de Session : qdm"     ; sudo service gdm        stop ; sudo service gdm         start ;;
  kdm)     echo "Gestor de Session : kdm"     ; sudo service kdm        stop ; sudo service kdm         start ;;
  lightdm) echo "Gestor de Session : lightdm" ; sudo service lightdm    stop ; sudo service lightdm     start ;;
  lxdm)    echo "Gestor de Session : lxdm"    ; sudo service lxdm       stop ; sudo service lxdm        start ;;
  mdm)     echo "Gestor de Session : mdm"     ; sudo service mdm        stop ; sudo service mdm         start ;;
  sddm)    echo "Gestor de Session : sddm"    ; sudo service sddm       stop ; sudo service sddm        start ;;
  wdm)     echo "Gestor de Session : wdm"     ; sudo service wdm        stop ; sudo service wdm         start ;;
  xdm)     echo "Gestor de Session : xdm"     ; sudo service xdm        stop ; sudo service xdm         start ;;
  * )      echo "Gestor de Session : Desconocido" ;;
esac

