Oddworld Abes Oddysey - InuArreglo
==============================

Este es un arreglo que consegui en internet que sirve para diversos titulos incluido este.
[ddwrapper (Sitio Fuente)](http://www.bitpatch.com/ddwrapper.html)

La version de steam incluye archivos de msdos. Si eres liñuxerio entonces podras hacer
enlaces simbolicos dentro de la carpeta (Abre una terminal) con los siguientes comandos

Si usas Steam para Windows desde PlayOnLinux en su prefijo predeterminado :
```
cd "$HOME/.PlayOnLinux/wineprefix/Steam/drive_c/Program Files/Steam/steamapps/common/Oddworld Abes Oddysee/DOS"
```

Si usas Steam nativo para Liñux entonces usa :
```
cd "$HOME/.local/share/Steam/steamapps/common/Oddworld Abes Oddysee/DOS"
```

Ahora a crear los enlaces simbolicos:
```
ln -s ../AbeMorph.ddv
ln -s ../BadEnd.ddv
ln -s ../Barrels.ddv
ln -s ../Begin.ddv
ln -s ../c1.lvl
ln -s ../d1.lvl
ln -s ../d1p1p2.ddv
ln -s ../D1P2P1.ddv
ln -s ../d1p3p4.ddv
ln -s ../D1P4P3.ddv
ln -s ../d1p6p7.ddv
ln -s ../D1P7P6.ddv
ln -s ../d1p9d2.ddv
ln -s ../d2.lvl
ln -s ../d2p1p10.ddv
ln -s ../d2p2p10.ddv
ln -s ../d2p2p10b.ddv
ln -s ../d2p3p10.ddv
ln -s ../d2p3p10b.ddv
ln -s ../d2p4p10.ddv
ln -s ../d2p4p10b.ddv
ln -s ../d2p5p10.ddv
ln -s ../d2p5p10b.ddv
ln -s ../d2p6p10.ddv
ln -s ../d2p6p10b.ddv
ln -s ../d2p7p10.ddv
ln -s ../d2p7p10b.ddv
ln -s ../d2p8p10.ddv
ln -s ../d2p8p10b.ddv
ln -s ../d2p9p10.ddv
ln -s ../d2p9p10b.ddv
ln -s ../d2p10d7.ddv
ln -s ../d2p10p2.ddv
ln -s ../d2p10p3.ddv
ln -s ../d2p10p4.ddv
ln -s ../d2p10p5.ddv
ln -s ../d2p10p6.ddv
ln -s ../d2p10p7.ddv
ln -s ../d2p10p8.ddv
ln -s ../d2p10p9.ddv
ln -s ../d7.lvl
ln -s ../d7c11c12.ddv
ln -s ../d7c12c11.ddv
ln -s ../Drag.ddv
ln -s ../e1.lvl
ln -s ../E1P4C8.ddv
ln -s ../e2.lvl
ln -s ../E2P2R2.ddv
ln -s ../f1.lvl
ln -s ../F1p1p2.ddv
ln -s ../F1P2P1.ddv
ln -s ../F1P2P5.ddv
ln -s ../F1P5P2.ddv
ln -s ../F1P5P6.ddv
ln -s ../F1P6P5.ddv
ln -s ../F1P8P9.ddv
ln -s ../F1p9f2.ddv
ln -s ../F1P9P8.ddv
ln -s ../f2.lvl
ln -s ../F2P1P8.ddv
ln -s ../F2P2P8.ddv
ln -s ../F2P2P8B.ddv
ln -s ../F2p3p8.ddv
ln -s ../F2p3p8b.ddv
ln -s ../F2P4P8.ddv
ln -s ../F2P4P8B.ddv
ln -s ../F2P5P8.ddv
ln -s ../F2P5P8B.ddv
ln -s ../F2P6P8.ddv
ln -s ../F2P6P8B.ddv
ln -s ../F2P7P8.ddv
ln -s ../F2P7P8B.ddv
ln -s ../F2P8F4.ddv
ln -s ../F2P8P2.ddv
ln -s ../f2p8p3.ddv
ln -s ../F2P8P4.ddv
ln -s ../F2P8P5.ddv
ln -s ../F2P8P6.ddv
ln -s ../F2P8P7.ddv
ln -s ../f4.lvl
ln -s ../F4C11C13.ddv
ln -s ../F4C13C11.ddv
ln -s ../GAMEBGN.ddv
ln -s ../Goodend.ddv
ln -s ../gtddlogo.ddv
ln -s ../Halts.ddv
ln -s ../l1.lvl
ln -s ../L1P1C14.ddv
ln -s ../L1P1P2.ddv
ln -s ../L1P2P1.ddv
ln -s ../L1p2p3.ddv
ln -s ../L1P3P2.ddv
ln -s ../L1P5C4.ddv
ln -s ../L1P5P6.ddv
ln -s ../L1P6E2.ddv
ln -s ../L1P6P5.ddv
ln -s ../lang.dat
ln -s ../li1p6e2.ddv
ln -s ../logoint.ddv
ln -s ../lp1c3c15.ddv
ln -s ../LP1C3C16.ddv
ln -s ../LP1C15C3.ddv
ln -s ../lp1c16c3.ddv
ln -s ../LP5C3C4.ddv
ln -s ../LP5C4C3.ddv
ln -s ../Mollock.ddv
ln -s ../Moon.ddv
ln -s ../Paramite.ddv
ln -s ../ParScar.ddv
ln -s ../r1.lvl
ln -s ../R1P1P13.ddv
ln -s ../R1p1p18.ddv
ln -s ../R1P6P11.ddv
ln -s ../R1P11P6.ddv
ln -s ../R1p13p1.ddv
ln -s ../r1p13p14.ddv
ln -s ../r1p14p13.ddv
ln -s ../R1p18p1.ddv
ln -s ../R1P18P19.ddv
ln -s ../R1P19P18.ddv
ln -s ../r2.lvl
ln -s ../r6.lvl
ln -s ../s1.lvl
ln -s ../Scrab.ddv
ln -s ../ScrScar.ddv
ln -s ../XaosOpen.ddv
```

Ahora si vas a usar la version de dosbox, te sugiero que modifiques el archivo llamado
Abe.bat

y coloques lo siguiente :
```
core=auto
cputype=pentium_slow
cycles=65535
cycleup=1024
cycledown=1024
dos4gw abedos
```

Listo, nota con DOSBOX 0.74 Oficial de 64 Bits tiene unas lineas verticales. 
[![dosbox64-oao1.png](https://i.postimg.cc/50d5W7h3/dosbox64-oao1.png)](https://postimg.cc/XZLBw87G)

Cosa que no sucede con la de 32 Bits.
[![dosbox32-oao1.png](https://i.postimg.cc/GpsPNw5t/dosbox32-oao1.png)](https://postimg.cc/nspQj5Zf)

Puedes intentar compilar manualmente la version de 32 bits del DOSBox-0.74, yo lo hare con el codigo fuente y el
parche de Debian.

```
#Descargar archivos necesarios :
cd /tmp
wget -c http://deb.debian.org/debian/pool/main/d/dosbox/dosbox_0.74.orig.tar.gz
wget -c http://cdn-fastly.deb.debian.org/debian/pool/main/d/dosbox/dosbox_0.74-4.2+deb9u1.debian.tar.xz

#Extraer y ubicar archivos
tar xf dosbox_0.74-4.2+deb9u1.debian.tar.xz
tar xfvz dosbox_0.74.orig.tar.gz
cd debian/patches ; mv *.patch ../../dosbox-0.74/
cd ../../dosbox-0.74

#Aplicar los parches
patch -p0 < fix_manpage_errors.patch ./docs/dosbox.1
patch -p0 < ftbfs624976_upstream_svn3691.patch ./include/dos_inc.h
patch -p0 < fix-ftbfs-format-security.patch ./src/gui/sdlmain.cpp
patch -p0 < wine-move-z-mount-svn3736.patch ./src/dos/dos_programs.cpp
patch -p0 < wine-style-namemangling-svn3742.patch ./src/dos/drive_cache.cpp
patch -p0 < update-64bit-recompiler.patch ./src/cpu/core_dynrec/risc_x64.h

#Compilar :
mkdir -p /tmp/dosbox32
CC="cc -m32" CXX="c++ -m32" ./configure --host=i686-pc-linux-gnu --prefix=/tmp/dosbox32
make
make install
```

Si lo ejecutas con dosbox-x-sdl2 no estaran las lineas pero es más dificil conseguir que fluya correctamente.
en caso de usar dosbox-x-sdl2 sugiero usar la siguiente configuracion :

<br>

```
CPU Core = Simple
CPU Type = Pentium Pro
AutoCycles = Off
Cycles = 32768
```

<br>

Pueden encontrar mucho software util para emuladores o maquina virtuales en :
[VOGONS Vintage Driver Library](http://www.vogonsdrivers.com/index.php?catid=1&menustate=0,0)