======================================================================================================
					
Juegos que dan Problemas con Teclado / Raton				
--------------------------------------------


Segun la version de Wine y ciertos juegos
El teclado puede NO Responder. 
depende de los archivos 


    dinput.dll
    dinput8.dll


Muchas veces con agregar estos 2 archivos a donde se encuentra
el ejecutable del juego , y agregar la clave de registro
"$PC\HKEY_CURRENT_USER\Software\Wine\AppDefaults\DllOverride\$Juego.exe"
y agregarles dinput.dll y/o dinput8.dll , dependiendo del caso , en la mayoria
de las veces suele ser suficiente para funcionar correctamente.

* MotoGP2
* Constantine
* Tom Clancy's Rainbow Six 3 : Raven Shield


Eso es todo por ahora