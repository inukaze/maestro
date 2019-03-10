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
	SCALER=$($TOOL --scale --value=0 --min-value=-10 --max-value=10)
	echo "Seleccionado : $SCALER"
fi

case "$SCALER" in
-10)	SCALER="1000K"		;;
-9)	SCALER="1250K"		;;
-8)	SCALER="1500K"		;;
-7)	SCALER="1750K"		;;
-6)	SCALER="2000K"		;;
-5)	SCALER="2250K"		;;
-4)	SCALER="2500K"		;;
-3)	SCALER="2750K"		;;
-2)	SCALER="3000K"		;;
-1)	SCALER="3500K"		;;
0)	SCALER="5500K"		;;
1)	SCALER="5750K"		;;
2)	SCALER="6000K"		;;
3)	SCALER="6500K"		;;
4)	SCALER="7000K"		;;
5)	SCALER="7500K"		;;
6)	SCALER="8000K"		;;
7)	SCALER="8500K"		;;
8)	SCALER="9000K"		;;
9)	SCALER="9500K"		;;
10)	SCALER="10000K"		;;
esac

redshift -O "$SCALER%"



