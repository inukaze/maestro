Soporte de Idioma
=======================================================================================================

Depende de tu distrucion en uso deberas como instalar el <br>`Soporte de Idiomas : Japones`<br>


Configurar el Prefijo :
=======================================================================================================

<br>`PATH="$HOME/.PlayOnLinux/wine/linux-x86/2.17-staging/bin:$PATH" ; \`
<br>`export WINESERVER="$HOME/.PlayOnLinux/wine/linux-x86/2.17-staging/bin/wineserver" ; \` 
<br>`export WINELOADER="$HOME/.PlayOnLinux/wine/linux-x86/2.17-staging/bin/wine" ; \`
<br>`export WINEDLLPATH="$HOME/.PlayOnLinux/wine/linux-x86/2.17-staging/lib" ; \`
<br>`export WINEPREFIX="$HOME/.PlayOnLinux/wineprefix/Inukaze_SMRSP" ; \`
<br>`winetricks fakejapanese`



PlayOnLinux Lanzador :
=======================================================================================================
Luego de haber creado un Enlaces / Acceso Directo
en una unidad virtual de algun software que utilice
el idioma japones. 

Ingresa en la ruta "`~/.PlayOnLinux/shortcuts`" alli
busca el nombre del archivo que le asignaste a tu
Acceso Directo / Enlace , abrelo con un editor de
texto. y justo arriba de la linea que diga
<br>`POL_Wine <archivo> "$@"`

Ingresa la siguiente :
<br>`export LANG=ja_JP.UTF-8`

Guarda los cambios y cuando inicies
el programa que utiliza el idioma japones
podras notar que en lugar de verse caracteres
extraños como cuadros o rectagulos. ves el texto
en su idioma original de forma correcta.


Explicaciones :
=======================================================================================================

1) `PATH="$HOME/.PlayOnLinux/wine/linux-x86/2.17-staging/bin:$PATH`
<br>Esta linea es para indicarle al sistema que agregue esta ruta a la variable de entorno `PATH`
que es la utilizada para buscar los binarios ejecutables y/o scripts con permiso de ejecucion
para la inicializacion de programas

2) `export WINESERVER="$HOME/.PlayOnLinux/wine/linux-x86/2.17-staging/bin/wineserver"`
<br>Define que la variable de entorno "`WINESERVER`" utilize el binario ejecutable "`wineserver`" desde la
ruta (absoluta o relativa) que se le esta especificando

3) `export WINELOADER="$HOME/.PlayOnLinux/wine/linux-x86/2.17-staging/bin/wine"`
<br>Define cual sera el script de inicilizacion de la capa de compatibilidad "`Wine Is Not Emulator`" (wine)
que se utilizara.

4) `export WINEDLLPATH="$HOME/.PlayOnLinux/wine/linux-x86/2.17-staging/lib"`
<br>Esta linea es para indicarle al sistema desde que ruta (absoluta o relativa) el script de inicilizacion
de "wine" debe buscar SUS LIBRERIAS para un correcto funcionamiento de la capa de compatibilidad

5) `export WINEPREFIX="$HOME/.PlayOnLinux/wineprefix/Inukaze_SMRSP`
<br>Establece el prefijo de wine, o la ruta de trabajo de wine, en donde es almacenada y utilizada
la configuracion para la version de wine que se estara utilizando.

6) `winetricks fakejapanese` 
<br>Instala el soporte del idioma japones, dentro del prefijo de wine especificado, utilizando
la version de wine especificada con las variables de entorno que se han establecido con
anterioridad.

<br> `"$HOME"` o "`~`" => Es una variable de entorno del sistema, indica la carpeta principal del usuario en uso "`/home/<usuario>`"

<br> "`; \ `" => el " ; " es para ejecutar otro comando y el " \ " es un salto de linea es solo para hacerlo más comodo
visualmente.

<br> "`export LANG=ja_JP.UTF-8`" le indica al sistema que lo que cargues apartir ese momento sera en el idioma especificado
con el formato de caracteres especificados. para ver cuales tienes puedes usar comandos como :
<br>
<br>`locale -av`
<br>`cat /etc/locale.gen`
<br>

Puedes visitar mi tutorial de como ["Hacer Locales Permantes"](https://https://goo.gl/ij6WqW/tutoriales/hacer-locales-permanentes/)
aunque eso solo se puede aplicar a las distribuciones que funcionen con ese metodo.