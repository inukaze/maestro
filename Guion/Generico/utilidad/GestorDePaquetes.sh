#!/bin/bash

# Detectar gestor de paquetes
function GestorDePaquetes()
{
GestorDePaquetes=$(whereis -B "/usr/sbin" "/usr/local/sbin" "/sbin" "/usr/bin" "/usr/local/bin" "/bin" -b apt | grep -i "apt" | cut -d " " -f02)

	if [ "$GestorDePaquetes" == "/usr/bin/apt" ]
	then
		echo "Gestor De Paquetes Detectado : apt"
		GestorDePaquetes=apt
	fi

GestorDePaquetes=$(whereis -B "/usr/sbin" "/usr/local/sbin" "/sbin" "/usr/bin" "/usr/local/bin" "/bin" -b pacman | grep -i "pacman" | cut -d " " -f02)	
	if	[ "$GestorDePaquetes" == "/usr/bin/pacman" ]
	then
		echo "Gestor De Paquetes Detectado : pacman"
		GestorDePaquetes=pacman
	fi
	
}


function Instalar()
{

	GestorDePaquetes
	
	case "$GestorDePaquetes" in
	
	apt)	GestorDePaquetes=$(apt-get install -y );;
	pacman)	GestorDePaquetes=$(pacman -Sy );;
	*) echo "Gestor de Paquetes desconocido o no soportado" ;;
	
	esac

}

function Desinstalar()
{

	GestorDePaquetes
	
	case "$GestorDePaquetes" in
	
	apt)	GestorDePaquetes=$(apt-get remove -y );;
	pacman)	GestorDePaquetes=$(pacman -Rnd );;
	*) echo "Gestor de Paquetes desconocido o no soportado" ;;
	
	esac

}

function Verificar()
{

	GestorDePaquetes
	
	case "$GestorDePaquetes" in
	
	apt)	Verificar=$(exec apt-get ??? -y);;
	pacman)	Verificar=$(exec pacman -Qqen | grep "$@" );;
	*) echo "Gestor de Paquetes desconocido o no soportado" ;;
	
	esac
	
	

}

case "$1" in
        Instalar|instalar)
		Instalar="SI"
		if [[ "$Instalar" == "SI" ]]
			then
			Instalar "$@"
		else
			echo "Instalar : No se ha especificado ningun nombre de paquete"
		fi

            ;;    
        Desinstalar|desinstalar)
		Desinstalar="SI"
		if [[ "$Desinstalar" == "SI" ]]
			then
			Desinstalar "$@"
		else
			echo "Desinstalar : No se ha especificado ningun nombre de paquete"
		fi

            ;;
        Verificar|verificar)
		Verificar="SI"
		if [[ "$Verificar" == "SI" ]]
			then
			Verificar "grep | $@"
			echo "$@ = $Verificar"
		else
			echo "Verificar : No se ha especificado ningun nombre de paquete"
		fi
            ;;     
        *)
            echo
	    echo "Ejemplos de como usar este script :"
	    echo
	    echo "$0 [Instalar|instalar] <Paquete(s)>"
	    echo "$0 [Desinstalar|desinstalar] <Paquete(s)>"
	    echo "$0 [Verificar|verificar]"
	    echo
esac