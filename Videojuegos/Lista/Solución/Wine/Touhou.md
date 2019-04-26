Touhou
======

En esta lista ire agregando cada videojuego de Touhou ya sea oficial o de cuarto (fanatico) que me vaya consiguiendo.

Wine :
======
|                                                               |                   |                                    |
|:---:|:---:|:---:|
|**Titulo**|**Version**|**Wine Recomendado:**|
|Koumajou Densetsu - Scarlet Symphony | 1.4 | 1.8.6 (32 Bits) |
|New Super Marisa Land | 1.10 | 1.5.15 (32 Bits) |

**NOTAS**
**Koumajou Densetsu - Scarlet Symphony** :
scrrun.dll	->	Sin este no inicia, dara un error que tiene un numero 314-14
usp10.dll	->	Sin este ciertos caracteres japoneses no son mostrados correctamente, son reemplazados por cuadros con una X interna. [No deshabilitar o winecfg tampoco inicia]
vbscript.dll	->	Sin este inicia hasta la partida, pero al iniciarla, te dara un error que tiene un numero 314-14

Jamas reemplazar en c:\windows\system32 los archivos :
dmloader.dll	->  Dara "Error - 1"
dsound.dll	->  Por motivos desconocido, el contenido de la ventana/pantalla deja de dibujarse desde antes de iniciar el videojuego.

**New Super Marisa Land** -> Solo funciona bien con Wine 1.5.15 (32 Bits) con versiones superiores las graficas son inestables.
Necesita los archivos :
d3dx9_33.dll