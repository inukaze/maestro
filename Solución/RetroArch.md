#RetroArch #Mupen64Plus #Texturas #Externas : 

1) Crear directorios para las texturas en formato "htc"
mkdir -p $HOME/.config/retroarch/{cache,system}

2) Edita el archivo de configuracion de retroarch :
~/.config/retroarch/retroarch.cfg

busca la linea "cache_directory" y dejala asi :
cache_directory = "~/.config/retroarch/cache"

busca la linea "system_directory" y dejala asi :
system_directory = "~/.config/retroarch/system"

Si no estas usando Mupen64Plus entonces simplemente crea los subdirectorios que necesitas para las texturas usando el nucleo de Mupen64Plus de RetroArch : 
mkdir -p $HOME/.config/retroarch/system/Mupen64plus/{cache,hires_texture}

En la carpeta 
~/.config/retroarch/system/Mupen64plus/cache 
Van los archivos "htc"


En la carpeta 
~/.config/retroarch/system/Mupen64plus/hires_texture 
Van los archivos "png"

———————————————————————————————

En caso de tener Mupen64Plus instalado y ya estar usando texturas de paquetes, tienes 2 opciones :
1) Vincular simbolicamente el directorio de datos locales de mupen64plus : 
ln -s "$HOME/.local/share/mupen64plus/" "$HOME/.config/retroarch/system/Mupen64plus"

2) Vincular simbolicamente los sub-directorios que quieres usar, principalmente se usan cache y hires_texture
ln -s "$HOME/.local/share/mupen64plus/hires_texture/" "$HOME/.config/retroarch/system/Mupen64plus/hires_texture"

ln -s "$HOME/.local/share/mupen64plus/cache/" "$HOME/.config/retroarch/system/Mupen64plus/cache"

MSG2 :
Si necesitan BIOS para RetroArch,Descarguen -> Este Archivo (https://ia800600.us.archive.org/28/items/retroarch_bios_pack/extract_to_sytem_folder.zip) <- y simplemente extraiganlo en 
~/.config/retroarch/system

Asi tendran las BIOS para la mayoria de los nucleos que los pueden llegar a necesitar