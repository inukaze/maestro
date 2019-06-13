scripts-wine
=============

Aqui colocare los scripts que haga en relacion a wine

Para instalar Wine mediante este Script
Primero necesitaras tener "git" instalado
en tu sistema GNU/Linux Instalado.
y luego utilizar los siguientes
comandos en una terminal

Instalacion de la version Pura
-------------------------------

Version Pura :

    $ git clone https://github.com/inukaze/scripts-wine Winukaze ; cd Winukaze ; chmod a+o+x ./Instalador-Wine
    $ sudo ./Instalador-Wine
    $ ConfigurarWine=$(2>/dev/null 1>/dev/null wineboot >/dev/null)

Y alli eliges la version de Wine que quieres
Instalar , esperas que el Script Finalize y listo

No deberia haber problemas para instalarlo.

Instalacion de la version Arreglada
-----------------------------------

Version con Arreglos : Esta en estado muy experimental 
preferiblemente , pruebenlo en una distro en modo Live 
preferiblemente las que pueden iniciar controladores privativos
durante el inicio de la distro live , como por ejemplo 
"Manjaro Linux" en su modo "non-free"

Y luego instarle git y usar los siguientes comandos :  

    $ git clone https://github.com/inukaze/scripts-wine Winukaze ; cd Winukaze ; chmod a+o+x ./Instalador-Wine-con-arreglos
    $ ./Instalador-Wine-con-arreglos


Juegos de Prueba
----------------

Preferiblemente recomiendo probrar 2 tipos de videojuegos me refiero a que es mejor pruebes por
ti mismo , un juego 2D y un juego 3D respectivamente.


Juegos 2D :
-----------
* [Zuma Deluxe](http://www.gamehouse.com/download-games/zuma-deluxe)
* [TumbleBugs 1](http://www.gamehouse.com/download-games/tumblebugs)
* [TumbleBugs 2](http://www.gamehouse.com/download-games/tumblebugs-2)
* [Peggle Deluxe](http://www.gamehouse.com/download-games/peggle-deluxe)
* [Chuzzle Deluxe](http://www.gamehouse.com/download-games/chuzzle-deluxe)
* [Dynomite Deluxe](http://www.gamehouse.com/download-games/dynomite)
* [Big City Adventure](http://www.bigfishgames.com/download-games/1530/bigcityadventuresa/index.html)
* [Bejewled 2 Deluxe](http://www.gamehouse.com/download-games/bejeweled-2-deluxe)
* [Plants Vs Zombies GameHouse Hacked](http://www.gamehouse.com/download-games/plants-vs-zombies)
*  Plants Vs Zombies GOTY -> Game Of The Year

    P.D : El Plants Vs Zombies de GameHouse , tiene sus diferencias con la version oficial GOTY
    por ejemplo la de GameHouse , no tiene lo del Zomvatar , tampoco los trofeos que puedes ganar
    en GOTY , y si pasas tu partida de la version de GameHouse a la de GOTY , jamas podras obtener
    todos los premios , como por ejemplo "Completar todos los minijuegos".

Juegos 3D :
-----------

Cualquiera , preferiblemente de un solo jugador. por ejemplo :

* [MDK2](http://www.fileplanet.com/44219/40000/fileinfo/MDK2---Demo)
* [MotoGP2](http://www.fileplanet.com/126987/120000/fileinfo/MotoGP-2-PC-Demo)
* [NeverWinterNights](http://www.fileplanet.com/117661/110000/fileinfo/Neverwinter-Nights-Demo)
* [Warcraft 3 - Reing Of Chaos](http://www.fileplanet.com/117491/download/Warcraft-3:-Reign-of-Chaos-Demo)
* [Need For Speed 6 : Hot Pursuit 2](http://www.nfsplanet.de/nfs6_demo.php?lang=eng)
* [Need For Speed 9 : Most Wanted](http://www.nfsplanet.de/nfsmw_demo.php?lang=eng)
* [Need For Speed 5 : Porsche Unleashed 2000](http://www.nfsplanet.de/demo.php?lang=eng)


Aunque si quieres mejor ve la lista de juegos probados
que se encuentra abajo y elige uno a ver si tambien te funciona.

Solo una cosa , no recomiendo hacer la prueba con juegos 
EnLinea / OnLine , me refiero a aquellos que dependan de internet
Primero prueba con un juego para un solo jugador 

Y luego si te funciona el juego de un solo jugador 
Prueba tu juego enlinea a ver si te funciona

Listas
------------------------

Ver [Lista de Juegos Probados](JUEGOSPROBADOS.md)


Ver [Lista de Juegos Que Necesitan Configuracion](JQNUACA.md)


Ver [Lista de Juegos con Problemas Teclado/Raton](JCPDDDE.md)


Ver [Lista de Juegos Incompatibles con Controles](JICOCDC.md)

=================================================================================================

					
Equipos de Pruebas
------------------

|	Equipo / Maquina : Canaimita MG101A3	|		Hardware
|    -------------------------------------------|       --------------------------------------------------
|	Procesador - Tipo		:	|	Dual Core
|	Procesador - Marca		:	|	Intel
|	Procesador - Reloj		:	|	1.66 GHz
|	Procesador - Modelo		:	|	Atom N455
|	Memoria RAM - Tipo		:	|	DDR3
|	Memoria RAM - Reloj		:	|	667 Mhz
|	Memoria RAM - Total		:	|	1 GB
|	Tarjeta de Video - Marca	:	|	Intel
|	Tarjeta de Video - Memoria	:	|	128 MB
|	Tarjeta de Video - Modelo usado	:	|	IGD D4xx/D5xx/N4xx/N5xx


|	Equipo / Maquina : Inukaze usa estos	|		Hardware
|    -------------------------------------------|       --------------------------------------------------
|	Procesador - Tipo		:	|	Dual Core
|	Procesador - Marca		:	|	AMD
|	Procesador - Reloj		:	|	3.00 GHz
|	Procesador - Modelo		:	|	Athlon X2 6000
|	Memoria RAM - Tipo		:	|	DDR2
|	Memoria RAM - Reloj		:	|	667 Mhz
|	Memoria RAM - Total		:	|	1,5 GB
|	Tarjeta de Video - Marca	:	|	NVIDIA
|	Tarjeta de Video - Memoria	:	|	128 MB
|	Tarjeta de Video - Modelo usado	:	|	GeForce 6200 TurboCache(TM)					

