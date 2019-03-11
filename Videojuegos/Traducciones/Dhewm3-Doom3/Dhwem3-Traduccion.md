Aplicar la traduccion para Doom3 con el motor Dhwem3

Metodo Rapido : 
=============

<br>es solo por salir del paso<br>

Colócalo en la ruta absoluta : 
`$HOME/.local/share/dhewm3/base/strings/spanish.lang`

O en su defecto la escribes así : 
`~/.local/share/dhewm3/base/strings/spanish.lang`

y debería tomarla. si no la toma cambia el nombre de spanish.lang por english.lang y entonces deberia funcionar. 
`~/.local/share/dhewm3/base/strings/english.lang`

[![dhewm3-1-5-0.png](https://i.postimg.cc/NMqwHNZz/dhewm3-1-5-0.png)](https://postimg.cc/nsk581F4)

<br>

Metodo Correcto :
===============

<br>Este es el que deberias aplicar de una vez<br>

0 - Mover o Eliminar "`~/.config/dhewm3`" y "`~/.local/share/dhewm3`"

1 - Descargar y extraer Dhewm3

2 - Crear las sub-carpetas puede ser con un comando : 
`mkdir -p "$HOME/.config/dhewm3/base/strings"`

3 - Descargar el archivo spanish.lang en el sub-directorio : 
`"~/.config/dhewm3/base/strings"`

[![dhewm3-1-5-0-spanish-lang.png](https://i.postimg.cc/pL6LrMxQ/dhewm3-1-5-0-spanish-lang.png)](https://postimg.cc/sM5rH8M1)

4 - Editar el archivo 
`"~/.config/dhewm3/base/dhewm.cfg"`

y buscar la linea 
`seta sys_lang "english"`
[![dhewm3-1-5-0-english.png](https://i.postimg.cc/YqP5mrGS/dhewm3-1-5-0-english.png)](https://postimg.cc/D8qj9KcV)

y sustituir "english" por spanish
`seta sys_lang "spanish"`
[![dhewm3-1-5-0-spanish.png](https://i.postimg.cc/rsKh849N/dhewm3-1-5-0-spanish.png)](https://postimg.cc/4HRvPmqY)

Guardar los cambios

En caso de que quieras que todo este en español
"[Descargar las voces en español](http://traducciones-videojuegos.clandlan.net/?page=academia%2Fsearch&search=doom+3)"

y asegurarte de que el archivo "zpak000.pk4" quede en el sub-directorio 
`~/.config/dhewm3/base`
[![dhewm3-1-5-0-zpak000-pk4.png](https://i.postimg.cc/JhMPsvqn/dhewm3-1-5-0-zpak000-pk4.png)](https://postimg.cc/Sn1W5ZHF)

5 - Una vez que esta todo listo, ya puedes jugar Doom 3 (+ Resurrection Of Evil) usando el motor Dhewm3. o en su defecto puedes intentar con 
[ioDoom3](https://www.iodoom3.org/)
[![dhewm3-1-5-0-traducido.png](https://i.postimg.cc/hjSD3D0B/dhewm3-1-5-0-traducido.png)](https://postimg.cc/4KSRYTML)


MODS
====

<br>Las carpetas de las Modificaciones (MODs) deben ir en : <br> :
`"~/.local/share/dhewm3"`

[![dhewm3-1-5-0-mods.png](https://i.postimg.cc/tJ6V9R8M/dhewm3-1-5-0-mods.png)](https://postimg.cc/K3ZYNbGP)

[![dhewm3-1-5-0-mods.png](https://i.postimg.cc/dVfvjRhG/dhewm3-1-5-0-mods.png)](https://postimg.cc/VJX3YCBN)