#!/bin/bash

# Este Script es para Instalar la ultima version Disponible
# del Escritorio E17 , a la fecha -> 09 de Septiembre del 2013
#
# Bueno Apartir de Ahora se empezara con comprobrar si existe
# el Archivo , Si en efecto Existe , Extraerlo , una vez extraido
# Ir a la carpeta de extraccion , y empezar la Compilacion
#
# Comienza :->

# Lo Primero es Comprobrar si el Usuario es "root"
# y seguidamente , que exista el directorio donde
# se pretender instalar el escritorio :


if [ ! -d /opt/e17 ]; then
sudo mkdir -p /opt/e17
sudo mkdir -p /opt/e17/bin
sudo mkdir -p /opt/e17/lib
fi

# Segundo las Librerias Principales
# Orden De Compilacion e Instalacion
# Recomendada por los creadores de E17 :
version=1.7.8

# Primero y Principal
eina=eina-$version.*?
eet=eet-$version.*?
evas=evas-$version.*?
evas_generic_loaders=evas_generic_loaders-$version.*?
ecore=ecore-$version.*?
eio=eio-$version.*?
embryo=embryo-$version.*?
edje=edje-$version.*?
efreet=efreet-$version.*?
e_dbus=e_dbus-$version.*?
eeze=eeze-$version.*?
emotion=emotion-$version.*?
ethumb=ethumb-$version.*?
elementary=elementary-$version.*?

# Segundo y Opcional
evil=evil-$version.*?
expedite=expedite-$version.?*

# Tercero Establecer Opciones
# y Configuraciones

if [ $(whoami) = "root" ]
        then
                echo ""
        else
                echo "Necesitas ejecutar este Script"
                echo "Con Permisos de Root"
        exit 1
fi

echo /opt/e17/lib > /etc/ld.so.conf.d/e17.conf

export PATH=/opt/e17/bin:$PATH
export LDFLAGS="-Wl,-rpath,/opt/e17/lib"
export PATH=/opt/e17/bin:/opt/e17/sbin:$PATH
export PKG_CONFIG_PATH=/opt/e17/lib/pkgconfig:$PKG_CONFIG_PATH
export XDG_CONFIG_DIRS=/etc/xdg:/opt/e17/etc/xdg:$XDG_CONFIG_DIRS
export XDG_DATA_DIRS=/usr/share/:/usr/local/share:$HOME/.local/share:/opt/e17/share:$XDG_DATA_DIRS


if [ -f $eina ]; then
        tar xfvz $eina
        eina=eina-$version
                cd $eina
                        ./autogen.sh --disable-dependency-tracking --prefix=/opt/e17
                        ./configure --disable-dependency-tracking --prefix=/opt/e17
                        make
                        sudo make install
                cd ..
        else
                wget http://download.enlightenment.org/releases/eina-$version.tar.gz
                tar xfvz $eina
                        eina=eina-$version
                        cd $eina
                                ./autogen.sh --disable-dependency-tracking --prefix=/opt/e17
                        ./configure --disable-dependency-tracking --prefix=/opt/e17
                                make
                                sudo make install
                cd ..
fi

if [ -f $eet ]; then
        tar xfvz $eet
        eet=eet-$version
                cd $eet
                        ./autogen.sh --disable-dependency-tracking --prefix=/opt/e17
                        ./configure --disable-dependency-tracking --prefix=/opt/e17
                        make
                        sudo make install
                cd ..
        else
                wget http://download.enlightenment.org/releases/eet-$version.tar.gz
                tar xfvz $eet
                        eet=eet-$version
                        cd $eet
                                ./autogen.sh --disable-dependency-tracking --prefix=/opt/e17
                        ./configure --disable-dependency-tracking --prefix=/opt/e17
                                make
                                sudo make install
                cd ..
fi

if [ -f $evas ]; then
        tar xfvz $evas
        evas=evas-$version
                cd $evas
                        ./autogen.sh --disable-dependency-tracking --prefix=/opt/e17
                        ./configure --disable-dependency-tracking --prefix=/opt/e17
                        make
                        sudo make install
                cd ..
        else
                wget http://download.enlightenment.org/releases/evas-$version.tar.gz
                tar xfvz $evas
                        evas=evas-$version
                        cd $evas
                                ./autogen.sh --disable-dependency-tracking --prefix=/opt/e17
                        ./configure --disable-dependency-tracking --prefix=/opt/e17
                                make
                                sudo make install
                cd ..
fi

if [ -f $evas_generic_loaders ]; then
        tar xfvz $evas_generic_loaders
        evas_generic_loaders=evas_generic_loaders-$version
                cd $evas_generic_loaders
                        ./autogen.sh --disable-dependency-tracking --prefix=/opt/e17
                        ./configure --disable-dependency-tracking --prefix=/opt/e17
                        make
                        sudo make install
                cd ..
        else
                wget http://download.enlightenment.org/releases/evas_generic_loaders-$version.tar.gz
                tar xfvz $evas_generic_loaders
                        evas_generic_loaders=evas_generic_loaders-$version
                        cd $evas_generic_loaders
                                ./autogen.sh --disable-dependency-tracking --prefix=/opt/e17
                        ./configure --disable-dependency-tracking --prefix=/opt/e17
                                make
                                sudo make install
                cd ..
fi

if [ -f $ecore ]; then
        tar xfvz $ecore
        ecore=ecore-$version
                cd $ecore
                        ./autogen.sh --disable-dependency-tracking --prefix=/opt/e17
                        ./configure --disable-dependency-tracking --prefix=/opt/e17
                        make
                        sudo make install
                cd ..
        else
                wget http://download.enlightenment.org/releases/ecore-$version.tar.gz
                tar xfvz $ecore
                        ecore=ecore-$version
                        cd $ecore
                                ./autogen.sh --disable-dependency-tracking --prefix=/opt/e17
                        ./configure --disable-dependency-tracking --prefix=/opt/e17
                                make
                                sudo make install
                cd ..
fi

if [ -f $eio ]; then
        tar xfvz $eio
        eio=eio-$version
                cd $eio
                        ./autogen.sh --disable-dependency-tracking --prefix=/opt/e17
                        ./configure --disable-dependency-tracking --prefix=/opt/e17
                        make
                        sudo make install
                cd ..
        else
                wget http://download.enlightenment.org/releases/eio-$version.tar.gz
                tar xfvz $eio
                        eio=eio-$version
                        cd $eio
                                ./autogen.sh --disable-dependency-tracking --prefix=/opt/e17
                        ./configure --disable-dependency-tracking --prefix=/opt/e17
                                make
                                sudo make install
                cd ..
fi

if [ -f $embryo ]; then
        tar xfvz $embryo
        embryo=embryo-$version
                cd $embryo
                        ./autogen.sh --disable-dependency-tracking --prefix=/opt/e17
                        ./configure --disable-dependency-tracking --prefix=/opt/e17
                        make
                        sudo make install
                cd ..
        else
                wget http://download.enlightenment.org/releases/embryo-$version.tar.gz
                tar xfvz $embryo
                        embryo=embryo-$version
                        cd $embryo
                                ./autogen.sh --disable-dependency-tracking --prefix=/opt/e17
                        ./configure --disable-dependency-tracking --prefix=/opt/e17
                                make
                                sudo make install
                cd ..
fi

if [ -f $edje ]; then
        tar xfvz $edje
        edje=edje-$version
                cd $edje
                        ./autogen.sh --disable-dependency-tracking --prefix=/opt/e17
                        ./configure --disable-dependency-tracking --prefix=/opt/e17  --enable-edje-program-cache --enable-edje-calc-cache --enable-fixed-point
                        make
                        sudo make install
                cd ..
        else
                wget http://download.enlightenment.org/releases/edje-$version.tar.gz
                tar xfvz $edje
                        edje=edje-$version
                        cd $edje
                                ./autogen.sh --disable-dependency-tracking --prefix=/opt/e17
                        ./configure --disable-dependency-tracking --prefix=/opt/e17  --enable-edje-program-cache --enable-edje-calc-cache --enable-fixed-point
                                make
                                sudo make install
                cd ..
fi

if [ -f $efreet ]; then
        tar xfvz $efreet
        efreet=efreet-$version
                cd $efreet
                        ./autogen.sh --disable-dependency-tracking --prefix=/opt/e17
                        ./configure --disable-dependency-tracking --prefix=/opt/e17
                        make
                        sudo make install
                cd ..
        else
                wget http://download.enlightenment.org/releases/efreet-$version.tar.gz
                tar xfvz $efreet
                        efreet=efreet-$version
                        cd $efreet
                                ./autogen.sh --disable-dependency-tracking --prefix=/opt/e17
                        ./configure --disable-dependency-tracking --prefix=/opt/e17
                                make
                                sudo make install
                cd ..
fi

if [ -f $e_dbus ]; then
        tar xfvz $e_dbus
        e_dbus=e_dbus-$version
                cd $e_dbus
                        ./autogen.sh --disable-dependency-tracking --prefix=/opt/e17
                        ./configure --disable-dependency-tracking --prefix=/opt/e17
                        make
                        sudo make install
                cd ..
        else
                wget http://download.enlightenment.org/releases/e_dbus-$version.tar.gz
                tar xfvz $e_dbus
                        e_dbus=e_dbus-$version
                        cd $e_dbus
                                ./autogen.sh --disable-dependency-tracking --prefix=/opt/e17
                        ./configure --disable-dependency-tracking --prefix=/opt/e17
                                make
                                sudo make install
                cd ..
fi

if [ -f $eeze ]; then
        tar xfvz $eeze
        eeze=eeze-$version
                cd $eeze
                        ./autogen.sh --disable-dependency-tracking --prefix=/opt/e17
                        ./configure --disable-dependency-tracking --prefix=/opt/e17
                        make
                        sudo make install
                cd ..
        else
                wget http://download.enlightenment.org/releases/eeze-$version.tar.gz
                tar xfvz $eeze
                        eeze=eeze-$version
                        cd $eeze
                                ./autogen.sh --disable-dependency-tracking --prefix=/opt/e17
                        ./configure --disable-dependency-tracking --prefix=/opt/e17
                                make
                                sudo make install
                cd ..
fi

if [ -f $emotion ]; then
        tar xfvz $emotion
        emotion=emotion-$version
                cd $emotion
                        sed -i '31s:AM_CONFIG_HEADER:AC_CONFIG_HEADERS:' configure.ac
                        ./autogen.sh --disable-dependency-tracking --prefix=/opt/e17
                        ./configure --disable-dependency-tracking --prefix=/opt/e17
                        make
                        sudo make install
                cd ..
        else
                wget http://download.enlightenment.org/releases/emotion-$version.tar.gz
                tar xfvz $emotion
                        emotion=emotion-$version
                        cd $emotion
                                ./autogen.sh --disable-dependency-tracking --prefix=/opt/e17
                        ./configure --disable-dependency-tracking --prefix=/opt/e17
                                make
                                sudo make install
                cd ..
fi

if [ -f $ethumb ]; then
        tar xfvz $ethumb
        ethumb=ethumb-$version
                cd $ethumb
                        ./autogen.sh --disable-dependency-tracking --prefix=/opt/e17
                        ./configure --disable-dependency-tracking --prefix=/opt/e17
                        make
                        sudo make install
                cd ..
        else
                wget http://download.enlightenment.org/releases/ethumb-$version.tar.gz
                tar xfvz $ethumb
                        ethumb=ethumb-$version
                        cd $ethumb
                                ./autogen.sh --disable-dependency-tracking --prefix=/opt/e17
                        ./configure --disable-dependency-tracking --prefix=/opt/e17
                                make
                                sudo make install
                cd ..
fi

if [ -f $elementary ]; then
        tar xfvz $elementary
        elementary=elementary-$version
                cd $elementary
                        ./autogen.sh --disable-dependency-tracking --prefix=/opt/e17
                        ./configure --disable-dependency-tracking --prefix=/opt/e17
                        make
                        sudo make install
                cd ..
        else
                wget http://download.enlightenment.org/releases/elementary-$version.tar.gz
                tar xfvz $elementary
                        elementary=elementary-$version
                        cd $elementary
                        ./autogen.sh --disable-dependency-tracking --prefix=/opt/e17
                        ./configure --disable-dependency-tracking --prefix=/opt/e17
                                make
                                sudo make install
                                cd ..
fi


if [ -f enlightenment-0.17.4.tar.gz ]; then
        tar xfvz enlightenment-0.17.4.tar.gz
                cd enlightenment-0.17.4
                ./configure --disable-dependency-tracking --prefix=/opt/e17
                make
                sudo make install
                cd ..
                        else
                        wget http://download.enlightenment.org/releases/enlightenment-0.17.4.tar.gz
                        tar xfvz enlightenment-0.17.4.tar.gz
                                cd enlightenment-0.17.4
                        ./configure --disable-dependency-tracking --prefix=/opt/e17
                                make
                                sudo make install
                        cd ..
fi


# -Paquetes Opcionales- #
if [ -f exquisite-1.0.0.tar.gz ]; then
        tar xfvz exquisite-1.0.0.tar.gz
                cd exquisite-1.0.0
                ./configure --disable-dependency-tracking --prefix=/opt/e17
                make
                sudo make install
                cd ..
else
        wget http://download.enlightenment.org/releases/exquisite-1.0.0.tar.gz
        tar xfvz exquisite-1.0.0.tar.gz
                cd exquisite-1.0.0
                ./autogen.sh --disable-dependency-tracking --prefix=/opt/e17
                ./configure --disable-dependency-tracking --prefix=/opt/e17
                make
                sudo make install
                cd ..
fi

# Español : Esta Cosa No funciona / No Compila ->
# English : This thing dont work / Dont Compile ->
#EVIL#if [ -f $evil ]; then
#EVIL#  tar xfvz $evil
#EVIL#  evil=evil-$version
#EVIL#          cd $evil
#EVIL#                  ./autogen.sh --disable-dependency-tracking --prefix=/opt/e17
#EVIL#                  ./configure --disable-dependency-tracking --prefix=/opt/e17
#EVIL#                          make
#EVIL#                          sudo make install
#EVIL#                  cd ..
#EVIL#  else
#EVIL#          wget http://download.enlightenment.org/releases/evil-$version.tar.gz
#EVIL#          tar xfvz $evil
#EVIL#                  evil=evil-$version
#EVIL#                  cd $evil
#EVIL#                  ./autogen.sh --disable-dependency-tracking --prefix=/opt/e17
#EVIL#                  ./configure --disable-dependency-tracking --prefix=/opt/e17
#EVIL#                          make
#EVIL#                          sudo make install
#EVIL#                  cd ..
#EVIL#fi

# Español : Esta Cosa No funciona / No Compila ->
# English : This thing dont work / Dont Compile ->
#EXPEDITE#if [ -f $expedite ]; then
#EXPEDITE#      tar xfvz $expedite
#EXPEDITE#      expedite=expedite-$version
#EXPEDITE#              cd $expedite
#EXPEDITE#              ./configure --disable-dependency-tracking --prefix=/opt/e17
#EXPEDITE#                      make
#EXPEDITE#                      sudo make install
#EXPEDITE#              cd ..
#EXPEDITE#      else
#EXPEDITE#              wget http://download.enlightenment.org/releases/expedite-$version.tar.gz
#EXPEDITE#              tar xfvz $expedite
#EXPEDITE#                      expedite=expedite-$version
#EXPEDITE#                      cd $expedite
#EXPEDITE#                              ./autogen.sh --disable-dependency-tracking --prefix=/opt/e17
#EXPEDITE#                      ./configure --disable-dependency-tracking --prefix=/opt/e17
#EXPEDITE#                              make
#EXPEDITE#                              sudo make install
#EXPEDITE#                              cd ..
#EXPEDITE#fi

