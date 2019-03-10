#!/bin/bash
# 
# Autor :       Inukaze ( Venezuela )
# Sitio         :       http://https://goo.gl/ij6WqW
# Correo-E      :       bloginukaze@gmail.com
# Licensia      :       GPL 2
#
# Acerca de este Script :       
#
# Es un simple selector , segun la opcion
# para probrar y/o establecer la cantidad de brillo
# que quieres que utilize el monitor 
# probado con 1 solo monitor , debido a que no tengo
# idea como trabajar con multi-monitores porque jamas
# los he tenido.
#
# Apartir de aqui comienza mi Script :

###################################################################################
###################################################################################
###										###
###			  Determine environment variables			###
###										###
###################################################################################
###################################################################################
Monitor=$(xrandr -q | grep " connected" | awk '{print $1}')

###################################################################################
###################################################################################
###										###
###				Determine Installed Tools			###
###										###
###################################################################################
###################################################################################

ZENITY=$(whereis -B "/usr/sbin" "/usr/local/sbin" "/sbin" "/usr/bin" "/usr/local/bin" "/bin" -b zenity | grep -i "zenity" | cut -d " " -f02)
ZENITY=$(echo $ZENITY | awk -F'/' '/^/ { print $4 }')
KDIALOG=$(whereis -B "/usr/sbin" "/usr/local/sbin" "/sbin" "/usr/bin" "/usr/local/bin" "/bin" -b kdialog | grep -i "kdialog" | cut -d " " -f02)
KDIALOG=$(echo $KDIALOG | awk -F'/' '/^/ { print $4 }')
MATEDIALOG=$(whereis -B "/usr/sbin" "/usr/local/sbin" "/sbin" "/usr/bin" "/usr/local/bin" "/bin" -b zenity | grep -i "matedialog" | cut -d " " -f02)
MATEDIALOG=$(echo $ZENITY | awk -F'/' '/^/ { print $4 }')
YAD=$(whereis -B "/usr/sbin" "/usr/local/sbin" "/sbin" "/usr/bin" "/usr/local/bin" "/bin" -b yad | grep -i "yad" | cut -d " " -f02)
YAD=$(echo $YAD | awk -F'/' '/^/ { print $4 }')

###################################################################################
###################################################################################
###										###
###			Define Graphical Toolkit Tool				###
###										###
###################################################################################
###################################################################################

function GTKTOOL(){
		if [ "$ZENITY" = "zenity" ]; then
			TOOL=$ZENITY
		elif [ "$MATEDIALOG" = "mate-dialog" ]; then
			TOOL=$MATEDIALOG
		elif [ "$YAD" = "yad" ] ; then
			TOOL=$YAD
		else
		echo	"
			You dont have grafical tool Like :
			kdialog , zenity , mate-dialog or yad
			
			You should install one of that Graphical Tool
			To make the installation in Graphical Mode
			"
		fi
}

function QTTOOL(){
		if [ "$KDIALOG" = "kdialog" ]; then
			TOOL=$KDIALOG
		elif [ "$ZENITY" = "zenity" ]; then
			TOOL=$ZENITY
		elif [ "$MATEDIALOG" = "mate-dialog" ]; then
			TOOL=$MATEDIALOG
		elif [ "$YAD" = "yad" ] ; then
			TOOL=$YAD
		else
		echo	"
			You dont have grafical tool Like :
			kdialog , zenity , mate-dialog or yad
			
			You should install one of that Graphical Tool
			To make the installation in Graphical Mode
			"
		fi
}

###################################################################################
###################################################################################
###										###
###			Detect desktop environment in use			###
###										###
###################################################################################
###################################################################################

function MYDESKTOP(){

AWESOME=$(		ps -A	|	grep awesome		|	awk '{print $4}' )

if [ "$AWESOME" = "awesome" ]; then
	DESKTOP="$AWESOME"
fi

BLACKBOX=$(		ps -A	|	grep blackbox		|	awk '{print $4}' )

if [ "$BLACKBOX" = "blackbox" ]; then
	DESKTOP="$BLACKBOX"
fi

ENLIGHTENMENT=$(	ps -A	|	grep enlightenment	|	awk '{print $4}' )

if [ "$ENLIGHTENMENT" = "enlightenment" ]; then
	DESKTOP="$ENLIGHTENMENT"
fi

FLUXBOX=$(		ps -A	|	grep fluxbox		|	awk '{print $4}' )

if [ "$FLUXBOX" = "fluxbox" ]; then
	DESKTOP="$FLUXBOX"
fi

GNOME=$(		ps -A	|	grep gnome-session	|	awk '{print $4}' )

if [ "$GNOME" = "gnome-session" ]; then
	DESKTOP="$GNOME"
fi

KDE=$(			ps -A	|	grep plasma-desktop	|	awk '{print $4}' )

if [ "$KDE" = "plasma-desktop" ]; then
	DESKTOP="$KDE"
fi

KDE3=$(		ps -A	|	grep kdesktop		|	awk '{print $4}' )

if [ "$KDE3" = "kdesktop" ]; then
	DESKTOP="$KDE3"
fi

LXDE=$(			ps -A	|	grep lxsession		|	awk '{print $4}' )

if [ "$LXDE" = "lxsession" ]; then
	DESKTOP="$LXDE"
fi

LXQT=$(			ps -A	|	grep lxqt-session	|	awk '{print $4}' )

if [ "$LXQT" = "lxqt-session" ]; then
	DESKTOP="$LXQT"
fi

MATE=$(			ps -A	|	grep mate-session	|	awk '{print $4}' )

if [ "$MATE" = "mate-session" ]; then
	DESKTOP="$MATE"
fi

RAZOR=$(		ps -A	|	grep razor-session	|	awk '{print $4}' )

if [ "$RAZOR" = "razor-session" ]; then
	DESKTOP="$RAZOR"
fi

TRINITY=$(		ps -A	|	grep kdesktop		|	awk '{print $4}' )

if [ "$TRINITY" = "kdesktop" ]; then
	DESKTOP="$TRINITY"
fi
XFCE=$(			ps -A	|	grep xfce-session	|	awk '{print $4}' )

if [ "$XFCE" = "xfce-session" ]; then
	DESKTOP="$XFCE"
fi

XFCE4=$(		ps -A	|	grep xfce4-session	|	awk '{print $4}' )

if [ "$XFCE4" = "xfce4-session" ]; then
	DESKTOP="$XFCE4"
fi

}

MYDESKTOP

	if [ "$DESKTOP" = "$AWESOME" ]; then
		DESKTOP=$AWESOME
		export DESKTOP=$AWESOME
		GTKTOOL
	fi

	if [ "$DESKTOP" = "$BLACKBOX" ]; then
		DESKTOP=$BLACKBOX
		export DESKTOP=$BLACKBOX

	fi

	if [ "$DESKTOP" = "$ENLIGHTMENT" ]; then
		DESKTOP=$ENLIGHTMENT
		export DESKTOP=$ENLIGHTMENT
		GTKTOOL
	fi
	
	if [ "$DESKTOP" = "$FLUXBOX" ]; then
		DESKTOP=$FLUXBOX
		export DESKTOP=$FLUXBOX
		GTKTOOL
	fi

	if [ "$DESKTOP" = "$GNOME" ]; then
		DESKTOP=$GNOME
		export DESKTOP=$GNOME
		GTKTOOL
	fi

	if [ "$DESKTOP" = "$KDE" ]; then
		DESKTOP=$KDE
		export DESKTOP=$KDE
		GTKTOOL
	fi

	if [ "$DESKTOP" = "$KDE3" ]; then
		DESKTOP=$KDE3
		export DESKTOP=$KDE3
		QTTOOL
	fi
	
	if [ "$DESKTOP" = "$LXDE" ]; then
		DESKTOP=$LXDE
		export DESKTOP=$LXDE
		GTKTOOL
	fi
	
	if [ "$DESKTOP" = "$LXQT" ]; then
		DESKTOP=$LXQT
		export DESKTOP=$LXQT
		QTTOOL
	fi
	
	if [ "$DESKTOP" = "$MATE" ];then
		DESKTOP="$MATE"
		export DESKTOP=$MATE
		GTKTOOL
	fi	

	if [ "$DESKTOP" = "$RAZOR" ]; then
		DESKTOP=$RAZOR
		export DESKTOP=$RAZOR
		QTTOOL
	fi
	
	if [ "$DESKTOP" = "$TRINITY" ]; then
		DESKTOP=$TRINITY
		export DESKTOP=$TRINITY
		QTTOOL
	fi 

	if [ "$DESKTOP" = "$XFCE" ]; then
		DESKTOP=$XFCE
		export DESKTOP=$XFCE
		GTKTOOL
	fi

	if [ "$DESKTOP" = "$XFCE4" ]; then
		DESKTOP=$XFCE4
		export DESKTOP=$XFCE4
		GTKTOOL
	fi

###################################################################################
###################################################################################
###										###
###					App Begin				###
###										###
###################################################################################
###################################################################################
if [ "$TOOL" = "zenity" ]; then
	SCALER=$($TOOL --list --text "Selecciona una opcion\nTemperatura del día: 5500K\nTemperatura de la noche: 3500K" --radiolist --column "Aplicar" --column "Esta temperatura" False "1000K" False "1500K" False "2000K" False "2500K" False "3000K" False "3500K" False "4000K" False "4500K" False "5000K" True  "5500K" False "6000K" False "6500K" False "7000K" False "7500K" False "8000K" False "8500K" False "9000K" False "9500K")
	echo "Opcion : $SCALER"
fi

redshift -O "$SCALER%"
