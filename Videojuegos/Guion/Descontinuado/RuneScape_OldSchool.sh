#RuneScape #OldSchool #Liñux : 
#Establecer la variable de entorno para la ruta, esta ruta debe ser adaptada a donde tu quieras instalar el juego.
RUTAROS="/media/Compartido/Videojuegos/Linux/Rol_Masivo_EnLinea/RuneScapeOldSchool"

#Borrar cualquier cosa anterior
rm -Rf ~/'runescape/oldschool' '/tmp/oldschool'

#Crear el directorio
mkdir -p "$RUTAROS"

#Descargar el archivo necesario del juego
wget -O "$RUTAROS/jagexappletviewer.jar" 'http://oldschool.runescape.com/downloads/jagexappletviewer.jar'

#Crear Enlace para Escritorio :
echo '[Desktop Entry]
Name=Old School RuneScape
Comment=Relive the challenging levelling system and risk-it-all PvP of the biggest retro styled MMO. Play with millions of other players in this piece of online gaming heritage where the community controls the development so the game is truly what you want it to be!
Categories=Game;Java;AdventureGame;RolePlaying
Exec=java -Duser.home='"'$RUTAROS'"' -Djava.class.path='"'$RUTAROS/jagexappletviewer.jar'"' -Dcom.jagex.config='"'http://oldschool.runescape.com/jav_config.ws'"' -Dawt.useSystemAAFontSettings='"'on'"' -Dswing.aatext='"'true'"' -Dhttps.protocols='"'TLSv1.2'"' -Dsun.java2d.opengl='"'false'"' -Dsun.java2d.uiScale='"'1'"' '"'jagexappletviewer'"' '"'oldschool'"'
Type=Application
Name[es]=RuneScape Vieja Escuela
StartupNotify=true
Path='$RUTAROS'
Icon='$RUTAROS'/jagexappletviewer.png
Actions=Screen;Update;Cache;

[Desktop Action Screen]
StartupNotify=false
Exec='"'/usr/bin/wmctrl'"' -r '"'Old School RuneScape'"' -b toggle,fullscreen -F
Name=Toggle Fullscreen/Windowed
Name[es]=Alternar entre Ventana y Pantalla Completa

[Desktop Action Update]
StartupNotify=false
Exec='"'/bin/bash'"' -c "notify-send '"'Updating the Old School RuneScape client, please wait...'"' && rm -Rf '"'/tmp/oldschool'"' && mkdir -p '"'"$RUTAROS"'"' '"'/tmp/oldschool'"' && wget -q -O '"'/tmp/oldschool/OldSchool.msi'"' '"'http://www.runescape.com/downloads/oldschool.msi'"' && 7z e -o'"'/tmp/oldschool/OldSchool-msi'"' -y '"'/tmp/oldschool/OldSchool.msi'"' && 7z e -o'"'/tmp/oldschool/rslauncher-cab'"' -y '"'/tmp/oldschool/OldSchool-msi/rslauncher.cab'"' && cp '"'/tmp/oldschool/rslauncher-cab/JagexAppletViewerJarFile'"'* '"'/jagexappletviewer.jar'"' && rm -Rf '"'/tmp/oldschool'"' && sync && notify-send '"'The Old School RuneScape client has been updated!'"'
Name=Update Client
Name[es]=Actualizar Cliente

[Desktop Action Cache]
StartupNotify=false
Exec='"'/bin/bash'"' -c "rm -Rf '"'$RUTAROS/jagexcache'"' '"'$RUTAROS/jagexappletviewer.preferences'"' '"'$RUTAROS/jagex_cl_oldschool_LIVE.dat'"' '"'$RUTAROS/random.dat'"' '"'/tmp/oldschool'"' && sync && notify-send '"'The Old School RuneScape cache has been cleaned.'"'
Name=Cache Cleanup
Name=Limpiar Cache'| tee RuneScapeOldSchool.desktop

#Condeder permiso de ejecucion
chmod a+o+x RuneScapeOldSchool.desktop

#Copiar a los datos del usuario para que aparezca en el menu :
cp "$PWD/RuneScapeOldSchool.desktop" "$HOME/.local/share/applications/RuneScapeOldSchool.desktop"

echo 'Si llego a jugar, usara el "World 497"'