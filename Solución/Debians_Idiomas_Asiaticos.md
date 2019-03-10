#Debians #Instalar soporte para idiomas asiaticos : 

#Japones :
sudo apt-get install -y fonts-ipafont-mincho

#Koreano :
sudo apt-get install -y ttf-baekmuk

#Chino : Tradicional y Simplificado :
sudo apt-get install -y fonts-arphic-bkai00mp  ttf-arphic-gbsn00lp

#Activar a nivel de "locales" :
sudo editor /etc/locale.gen

Dentro del archivo locale.gen hay que buscar y descomentar [Para Japones]:
# ja_JP.EUC-JP EUC-JP
# ja_JP.UTF-8 UTF-8

Dentro del archivo locale.gen hay que buscar y descomentar [Para Koreano]:
# ko_KR.EUC-KR EUC-KR
# ko_KR.UTF-8 UTF-8

Dentro del archivo locale.gen hay que buscar y descomentar [Para Chino Simplificado]:
# zh_CN.UTF-8

Para Chino Tradicional :
# zh_TW BIG5
# zh_TW.EUC-TW EUC-TW
# zh_TW.UTF-8 UTF-8

# Generar los archivos y configuraciones necesarias para el sistema :
sudo locale-gen

# Establecer el idioma en las variables necesarias :
locale

LANG=es_VE.UTF-8
LANGUAGE=es_VE:es
LC_CTYPE="es_VE.UTF-8"
LC_NUMERIC="es_VE.UTF-8"
LC_TIME="es_VE.UTF-8"
LC_COLLATE="es_VE.UTF-8"
LC_MONETARY="es_VE.UTF-8"
LC_MESSAGES="es_VE.UTF-8"
LC_PAPER="es_VE.UTF-8"
LC_NAME="es_VE.UTF-8"
LC_ADDRESS="es_VE.UTF-8"
LC_TELEPHONE="es_VE.UTF-8"
LC_MEASUREMENT="es_VE.UTF-8"
LC_IDENTIFICATION="es_VE.UTF-8"
LC_ALL=

Copia la salida del comando locale y ahora usa este comando para editar un archivo :
sudo editor /etc/environment

Dentro del archivo pega la salida de locale y por ejemplo en mi caso solo debo agregarle el valor a la variable final
LANG=es_VE.UTF-8
LANGUAGE=es_VE:es
LC_CTYPE="es_VE.UTF-8"
LC_NUMERIC="es_VE.UTF-8"
LC_TIME="es_VE.UTF-8"
LC_COLLATE="es_VE.UTF-8"
LC_MONETARY="es_VE.UTF-8"
LC_MESSAGES="es_VE.UTF-8"
LC_PAPER="es_VE.UTF-8"
LC_NAME="es_VE.UTF-8"
LC_ADDRESS="es_VE.UTF-8"
LC_TELEPHONE="es_VE.UTF-8"
LC_MEASUREMENT="es_VE.UTF-8"
LC_IDENTIFICATION="es_VE.UTF-8"
LC_ALL=es_VE.UTF-8

Finalmente debes usar el comando :
sudo dpkg-reconfigure locales

Solo presiona la tecla espacio en los idiomas que quieras activar. si no tienes idea de cuales son los idiomas correspondientes, puedes visitar "Esta Tabla (https://docs.moodle.org/dev/Table_of_locales)" para saber cual es el idioma. luego presiona el "Tabulador" y colocarte sobre "Aceptar" y presiona la tecla entrar para empezar el procedimiento. primero te preguntara cual es le idioma que quieres dejar predeterminado en mi caso como soy de venezuela dejo "es_VE.UTF-8". nuevamente aceptar y listo

Ahora solo debes reiniciar tu equipo para que todo quede correctamente establecido.

#Para usar un videojuego por ejemplo en japones con wine :
cd "/ruta/absoluta/hacia/el_videojuego"
export LANG="ja_JP"
LANG=ja_JP.UTF-8 wine videojuego.exe