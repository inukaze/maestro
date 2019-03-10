==========================================================================================================

Juegos que necesitan configuracion Adicional				
--------------------------------------------

En esta seccion , colocare los juegos que puede que no te funcionen a la primera por lo cual
tendras que añadir manualmente algunas configuraciones para que este funcione correctamente
o por lo menos descentemente y puedas iniciarlo para jugarlo y luego configurarlo segun el
equipo del que dispongas.

TumbleBugs 1
------------

Se agrego Tumblebugs.exe a AppDefaults 
y las claves de registro de como debe usar Direct3D


Aparte de ello , el juego TumblBugs1 
necesita que exista la carpeta 



    $HOME/.wine/drive_c/users/$USERNAME/Application/Data/Wildfire


y dentro debe contener lo siguiente el archivo TBConfig.xml


TBConfig.xml
------------


    <tbconfig>
     <gamerunning value="0"/>
     <video>
      <renderer value="opengl"/>
      <fullscreen value="1"/>
      <vsync value="0"/>
      <width value="800"/>
      <height value="600"/>
      <bpp value="32"/>
      <zbpp value="16"/>
      <usevertexarrays value="0"/>
      <usedisplaylists value="1"/>
      <texturequality value="dontcare"/>
      <maxtexturesize value="256"/>
     </video>
    </tbconfig>


==========================================================================================================

TumbleBugs 2
------------

Se agrego Tumblebugs2.exe a AppDefaults
y las claves de registro de como debe usar Direct3D


Aparte de ello , el juego TumblBugs 2 , necesita que exista la carpeta 
    
    $HOME/.wine/drive_c/users/$USERNAME/Application Data/Wildfire/Tumblebugs2/C0FE1B018E39562657E56BA482272412


y dentro debe contener lo siguiente el archivo TBConfig.xml


TBConfig.xml
------------


    <tbconfig>
     <versionnumber value="9"/>
     <updater>
       <autoupdate value="1"/>
       <lastupdate value="0"/>
     </updater>
     <gamerunning value="0"/>
     <video>
      <renderer value="opengl"/>
      <fullscreen value="1"/>
      <vsync value="0"/>
      <visualfxsaved value="0"/>
      <width value="800"/>
      <height value="600"/>
      <bpp value="32"/>
      <zbpp value="16"/>
      <usevertexarrays value="0"/>
      <usedisplaylists value="1"/>
      <texturequality value="dontcare"/>
      <maxtexturesize value="512"/>
     </video>
    </tbconfig>

==========================================================================================================


Chuzzle Deluxe
--------------

Se agrego Chuzzle.exe a AppDefaults
y las claves de registro de como debe usar Direct3D


Aparte de ello , el juego chuzzle , necesita tener la carpeta "Profiles"
y dentro debe contener lo siguiente el archivo config.cfg

config.cfg
----------


    DX::ScreenWidth=640
    DX::ScreenHeight=480
    DX::ColorDepth=16
    DX::Fullscreen=true
    DX::UseCustomCursors=false
    DX::SafeMode=true
    Audio::SoundVolume=1.000000
    Audio::MusicVolume=0.750000
    App::LastUpdate=1413056759
    ShowTips=true
    ColorBlind=false
    Profiles=
    CurrentProfile=
    AllowTrophies=true
    SkipTutorial=false


==========================================================================================================


[Half-Life](http://adf.ly/urlfK)
------------------------------------
* [Rebusque en "Modo Ventana"](http://adf.ly/urlfK#Half-LifeMV1)
* [Rebusque en "Modo Pantalla Completa"](http://adf.ly/urlfK#Half-LifePC1)


=======================================================================================




* [Aviso : Video Mode Change Failured](http://adf.ly/urlfK#Half-LifeVMCF)
* [Rebusque "SIN AVISO" en "Modo Ventana"](http://adf.ly/urlfK#Half-LifeMV2)
* [Rebusque "SIN AVISO" en "Modo Pantalla Completa"](http://adf.ly/urlfK#Half-LifePC2)


=======================================================================================
* [Linea de Comandos](http://adf.ly/urlfK#Half-LifeLDC)
* [Linea de Comandos - MODS](http://adf.ly/urlfK#Half-LifeLDCMODS)
* [Linea de Comandos - CONTROLES](http://adf.ly/urlfK#Half-LifeLDCCONTROLES)
* [Linea de Comandos - VIDEO](http://adf.ly/urlfK#Half-LifeLDCVIDEO)
* [Linea de Comandos - SONIDO](http://adf.ly/urlfK#Half-LifeLDCSONIDO)
* [Linea de Comandos - RED](http://adf.ly/urlfK#Half-LifeLDCRED)
* [Linea de Comandos - MOTOR](http://adf.ly/urlfK#Half-LifeLDCMOTOR)
* [Linea de Comandos - Variables de Consola](http://adf.ly/urlfK#Half-LifeLDCVDC)


==========================================================================================================

Eso es todo por ahora