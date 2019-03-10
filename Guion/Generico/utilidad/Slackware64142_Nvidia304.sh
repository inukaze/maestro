#!/usr/bin/env bash
# Autor	     :	Inukaze ( Venezuela )
# SitioWeb   :	http://https://goo.gl/ij6WqW
# Corre-E    :	bloginukaze@gmail.com
# Licencia   :	GPL 2
#
# Contribuidor(es) : 
# @petrohs (Usuario de Telegram) -> Me ayudo con el "sed" y el "patron exacto"
#
#
# Acerca de este Script :   
# Es simplemente para reinstalar los controladores Privativos Legados de NVIDIA version 304
# En Slackware64 14.2, (Es para sirve tambien cuando se actualizan desde los repositorios)
#
#

if [ "$(whoami)" != root ]; then

	echo
	echo
	echo 'Por favor ejecuta este script como root'
	echo 'ó en su defecto usando :'  
	echo 'su -c "./este_script" root'
	echo 'antes del script'
	echo
	echo 'Utilize este Script bajo su Propio Riesgro'
	echo 'El Autor , o sea yo , no me hago responsable'
	echo 'de las consecuencias imprevistas que puedan'
	echo 'acontecer en tu sistema operativo'
	echo
	echo
else

# Variables :
Arquitectura=$(uname -m)
case "$Arquitectura" in x86) Arquitectura="x86";; i?86) Arquitectura="x86";; amd64) Arquitectura="x86_64";; x86_64) Arquitectura="x86_64";; * ) echo "Tu Arquitectura '$Arquitectura' -> NO ESTA SOPORTADA.";; esac
Version=$(curl -s https://download.nvidia.com/XFree86/nvidia-installer/ | grep -Po "nvidia-installer-304.[0-9][0-9][0-9].tar.bz2" | sort -Vr | head -1 | sed 's/^[nvidia-installer-]*//'| sed 's/[*]*.tar.bz2//')
Rinst=(https://download.nvidia.com/XFree86/Linux-"$Arquitectura"/"$Version"/NVIDIA-Linux-"$Arquitectura"-"$Version".run)


# Comprobar que existe "slpkg", en donde se encuentra y si es ejecutable
slpkg=$(whereis -B "/usr/sbin" "/usr/local/sbin" "/sbin" "/usr/bin" "/usr/local/bin" "/bin" -b slpkg | grep -i "slpkg" | cut -d " " -f02)
    if [[ -x "$slpkg" ]]; then
		echo "Localizado Ejecutable '$slpkg'" 
    else
		echo "'$slpkg' no es ejecutable o no existe"
		exit 1
    fi

# Crear Directorios :
mkdir -p /tmp/slpkg/build/_SOURCES ; mkdir -p /usr/local/multilib/14.2

# Ir al directorio /tmp/slpkg/build/_SOURCES
cd /tmp/slpkg/build/_SOURCES

# Descargar archivos Necesarios
wget -c $Rinst
wget -c https://slackbuilds.org/slackbuilds/14.2/system/nvidia-legacy304-driver.tar.gz
wget -c https://download.nvidia.com/XFree86/nvidia-installer/nvidia-installer-$Version.tar.bz2
wget -c https://download.nvidia.com/XFree86/nvidia-settings/nvidia-settings-$Version.tar.bz2
wget -c https://download.nvidia.com/XFree86/nvidia-xconfig/nvidia-xconfig-$Version.tar.bz2

# Extraer contenido del archivo "nvidia-legacy304-driver.tar.gz"
tar xfvz nvidia-legacy304-driver.tar.gz

# Copiar archivos
cp nvidia-*.tar.bz2 ./nvidia-legacy304-driver
cp NVIDIA-Linux-x86_64-$Version.run ./nvidia-legacy304-driver

# Ingresar al directorio "nvidia-legacy304-driver"
cd nvidia-legacy304-driver

# Editar el archivo "nvidia-legacy304-driver.SlackBuild" para activar "Compat32"
sed -i -e 's/COMPAT32=${COMPAT32:-no}/COMPAT32=${COMPAT32:-yes}/g' nvidia-legacy304-driver.SlackBuild

# Ejecutar el script "nvidia-legacy304-driver.SlackBuild"
./nvidia-legacy304-driver.SlackBuild

# Eliminar archivos conflictivos :
rm -rf /usr/lib64/xorg/modules/extensions/libglx.la
rm -rf /usr/lib/libGL.so
rm -rf /usr/lib/libGL.so.304.*
rm -rf /usr/lib64/libGL.so.304.*
rm -rf /usr/lib64/xorg/modules/extensions/libglx.so
rm -rf /usr/lib64/xorg/modules/extensions/libglx.so-xorg
rm -rf /usr/lib64/xorg/modules/extensions/libglx.so.304.*

# Verificar que los repositorios necesarios de slpkg esten activos, en caso de no estarlos activarlos
if [ -f /etc/slpkg/repositories.conf ]; then
	REPOSITORIOS=/etc/slpkg/repositories.conf
	SLACK=$(cat $REPOSITORIOS | grep '^# slack$')
	SBO=$(cat $REPOSITORIOS | grep '^# sbo$')
	MULTI=$(cat $REPOSITORIOS | grep '^# multi$')
	mkdir -p /tmp/.inuslpkgrep
	
	if [ "$SLACK" = "# slack" ]; then
		# Crear archivo para saber si se encontro con "# slack"
	      	touch /tmp/.inuslpkgrep/slack ; echo '# slack' >> /tmp/.inuslpkgrep/slack
	      	# Activar el repositorio slack :
		sed -i -e "s/# slack$/ slack/" "$REPOSITORIOS"
	fi

	if [ "$SBO" = "# sbo" ]; then
		# Crear archivo para saber si se encontro con "# sbo"
	      	touch /tmp/.inuslpkgrep/sbo ; echo '# multi' >> /tmp/.inuslpkgrep/sbo
	      	# Activar el repositorio sbo :
		sed -i -e "s/# sbo$/ sbo/" "$REPOSITORIOS"
	fi

	if [ "$MULTI" = "# multi" ]; then
		# Crear archivo para saber si se encontro con "# multi"
	      	touch /tmp/.inuslpkgrep/multi ; echo '# multi' >> /tmp/.inuslpkgrep/multi
		# Activar el repositorio multi :
		sed -i -e "s/# multi$/ multi/" "$REPOSITORIOS"
	fi
else
	echo 'Repositorio(s) no encontrado(s)'
	exit 1
fi

# Actualizar paquetes disponibles con slpkg
$slpkg update

# Reinstalar paquetes : glu glew mesa desde el repositorio "Slack" y los mismos versiones "Compat32" desde el repositorio "Multi"
echo -ne 'y\n' | $slpkg -s slack --reinstall glu glew mesa ; echo -ne 'y\n' | slpkg -s multi --reinstall glu-compat32 glew-compat32 mesa-compat32
echo -ne 'y\n' | $slpkg -s sbo --rebuild --reinstall nvidia-legacy304-kernel

# Instalar paquete generado por el script SlackBuild "nvidia-legacy304-driver.SlackBuild"
installpkg /tmp/nvidia-legacy304-driver-$Version-x86_64-1_SBo.tgz

# Corregir Enlaces simbolicos para un correcto funcionamiento de los controladores privativos de nvidia
cd "/usr/lib64/xorg/modules/extensions"
ln -sf "libglx.so.$Version-nvidia" "libglx.so.$Version"
ln -sf "libglx.so.$Version" "libglx.so-xorg"
ln -sf "libglx.so.$Version" "libglx.so"
cd /usr/lib/
ln -sf libGL.so.$Version libGL.so
ldconfig

# Instalar GLIBC Compat32 : Esto es para que las aplicaciones no den error con que no encuentrar librerias de 32 Bits
unset Version
Version=$(curl -s http://bear.alienbase.nl/mirrors/people/alien/multilib/14.2/ | grep -Po "glibc-2.23_multilib-x86_64-[0-9]alien.txz" | sort -Vr | head -1 | sed 's/^[*glibc]*-[0-9].[0-9][0-9]_multilib-'"$Arquitectura"'-//' | sed 's/[*]*.txz//')
cd /usr/local/multilib/14.2/
wget -c http://bear.alienbase.nl/mirrors/people/alien/multilib/14.2/glibc-2.23_multilib-$Arquitectura-$Version.txz
installpkg /usr/local/multilib/14.2/glibc-2.23_multilib-x86_64-1alien.txz
ldconfig

# Regresar los repositorios a desactivados :
if test -f /tmp/.inuslpkgrep/slack
then 
    sed -i -e "s/ slack$/# slack/" "$REPOSITORIOS"
fi

if test -f /tmp/.inuslpkgrep/sbo
then 
    sed -i -e "s/ sbo$/# sbo/" "$REPOSITORIOS"
fi

if test -f /tmp/.inuslpkgrep/multi
then 
    sed -i -e "s/ multi$/# multi/" "$REPOSITORIOS"
fi

rm -rf /tmp/.inuslpkgrep

# Actualizar paquetes disponibles con slpkg
$slpkg update

fi