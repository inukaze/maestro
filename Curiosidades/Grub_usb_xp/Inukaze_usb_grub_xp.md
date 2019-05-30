# InuTutorial : USB + Grub + MiniOS 2018
-------------

Crear un USB de Instalacion de WindowsXP usando GRUB2 pre-requisitos para seguir este tutorial :

  - Pendrive de al menos 1GB
  - Pendrive Formateado en NTFS
  - Pendrive con la etiqueta : MiniXP
  - Sistema Operativo GNU/Linux
  - Descargar [**MiniOSXP**](https://shrtz.me/5BlOydr) del Sitio [**WindowsMiniOS**](https://www.windowsminios.org/descargas-minios/)

# Procedimiento : Abrir una terminal y utilizar los siguientes comandos 


> 01) Ingresar al modo SuperUsuario : 

<br> `su` <br>

> 02) Crear la carpeta /media/usb : 

`mkdir -p /media/usb` <br>

> 03) Identificar Pendrive, Su Particion y su UUID e instalarle el sector de arranque con ms-sys


`USBPART=$(blkid | grep "MiniXP" | awk '{print$01}' | sed 's/\/*:$//') ; echo "Particion USB=$USBPART"` <br>
`USB=$(echo "$USBPART" | sed 's/[0-9]*//g') ; echo "Dispositivo USB=$USB"` <br>
`UUID=$(blkid | grep "MiniXP" | awk '{print$03}' | sed -n 's/.*UUID=\"\([^\"]*\)\".*/\1/p')` <br>


> 04) Montar la particion en /media/usb, nota X sera el valor que corresponde a una letra (Dispositivo) y # a un numero (Particion), por ejemplo : **mount /dev/sdX# /media/usb -o umask=000** , para dejarlo mas claro seria algo asi : 

`mount "$USBPART" /media/usb -o umask=000` <br>


> 05) Extrae la ISO con este comando :

`7z x 'WinXP-MiniOS v2018.00 x86.iso'` <br>


> 06) Acomodar archivos

`echo "Transformar MAYUSCULAS en minusculas :"` <br>
`find . -depth -exec rename 's/(.*)\/([^\/]*)/$1\/\L$2/' {} \;` <br>

`echo "Borrar archivos innecesarios :"` <br>
`rm -rf '[boot]' "autorun.inf" "zwindowsxp minios.pdf" "bootfont.bin" zrufus-2.*.exe` <br>

`echo "Mover archivos :"` <br>
`mv winxp-minios v2018.00 x86.iso ../` <br>
`mkdir -p 'grub'` <br>
`mkdir -p '$win_nt$.~ls'` <br>
`mkdir -p '$win_nt$.~bt'` <br>
`wget -c https://github.com/inukaze/maestro/raw/master/Curiosidades/Grub_usb_xp/bootsect.dat -P ./'$win_nt$'.~bt/` <br>
`mv '$oem$' '$win_nt$.~ls'/` <br>
`mv win51 ./'$win_nt$.~ls'/` <br>
`mv win51ip ./'$win_nt$.~ls'/` <br>
`mv win51ip.sp3 ./'$win_nt$.~ls'/` <br>
`mv 'i386' ./'$win_nt$.~ls'/` <br>
`wget -c https://github.com/inukaze/maestro/raw/master/Curiosidades/Grub_usb_xp/ssa.ex_ -P ./'$win_nt$'.~ls/i386/` <br>

> 08) Crear o ajustar configuraciones faltantes :

`echo 'Primero el "boot".ini'`

```
echo '[Boot Loader]
Timeout=30
Default=multi(0)disk(0)rdisk(1)partition(1)\WINDOWS
[Operating Systems]
C:\$win_nt$.~bt\bootsect.dat = "1ro, Instalacion Textual (Iniciar desde el USB otra vez, luego de finalizar)"
multi(0)disk(0)rdisk(1)partition(1)\WINDOWS="2do, Instalacion Grafica, contiuar + 1er inicio de Windows" /fastdetect
C:\ = "---> DEPURAR, en caso de que HAL.DLL o NTOSKRNL.EXE no consigan errores <---"
multi(0)disk(0)rdisk(1)partition(2)\WINDOWS="Depurar Inicio rDisco 1 particion 2" /fastdetect
multi(0)disk(0)rdisk(1)partition(3)\WINDOWS="Depurar Inicio rDisco 1 particion 3" /fastdetect
multi(0)disk(0)rdisk(1)partition(4)\WINDOWS="Depurar Inicio rDisco 1 particion 4" /fastdetect
multi(0)disk(0)rdisk(2)partition(1)\WINDOWS="Depurar Inicio rDisco 2 particion 1" /fastdetect
multi(0)disk(0)rdisk(2)partition(2)\WINDOWS="Depurar Inicio rDisco 2 particion 2" /fastdetect
multi(0)disk(0)rdisk(2)partition(3)\WINDOWS="Depurar Inicio rDisco 2 particion 3" /fastdetect
multi(0)disk(0)rdisk(2)partition(4)\WINDOWS="Depurar Inicio rDisco 2 particion 4" /fastdetect
' | tee ./boot.ini
```

`echo 'Segundo el migrate.inf'`
```
echo '[Version]
Signature = "$Windows NT$"

[Addreg]
HKLM,"SYSTEM\MountedDevices",,0x00000010
HKLM,"SYSTEM\ControlSet001\Control\StorageDevicePolicies","WriteProtect",%REG_DWORD%,1
HKLM,"SYSTEM\MountedDevices","\DosDevices\W:",0x00030001,\
5F,00,3F,00,3F,00,5F,00,55,00,53,00,42,00,53,00,54,00,4F,00,52,00,23,00,44,00,69,00,73,00,6B,00,26,00,56,00,65,00,6E,00,5F,00,4B,00,69,00,6E,00,67,00,73,00,74,00,6F,00,6E,00,26,00,50,00,72,00,6F,00,64,00,5F,00,44,00,61,00,74,00,61,00,54,00,72,00,61,00,76,00,65,00,6C,00,65,00,72,00,5F,00,32,00,2E,00,30,00,26,00,52,00,65,00,76,00,5F,00,31,00,2E,00,30,00,30,00,23,00,30,00,30,00,31,00,39,00,45,00,30,00,36,00,42,00,30,00,37,00,42,00,33,00,35,00,43,00,38,00,38,00,30,00,38,00,30,00,39,00,32,00,44,00,33,00,41,00,26,00,30,00,23,00,7B,00,35,00,33,00,66,00,35,00,36,00,33,00,30,00,37,00,2D,00,62,00,36,00,62,00,66,00,2D,00,31,00,31,00,64,00,30,00,2D,00,39,00,34,00,66,00,32,00,2D,00,30,00,30,00,61,00,30,00,63,00,39,00,31,00,65,00,66,00,62,00,38,00,62,00,7D,00

[Strings]
;Handy macro substitutions non-localizable
REG_SZ = 0x00000000
REG_BINARY = 0x00000001
REG_DWORD = 0x00010001
REG_MULTI_SZ = 0x00010000
REG_SZ_APPEND = 0x00010008
REG_EXPAND_SZ = 0x00020000
' | tee './$win_nt$.~bt'/migrate.inf
```

`echo 'Tercero el winnt.sif'`
```
echo '[Data]
    floppyless = "1"
    msdosinitiated = "1"

[GuiRunOnce]
    "SSA /UnrenameFolders /PendingDelete"

[SetupParams]
    UserExecute = "SSA /RenameFolders /BootINIGenerate /Office2007ProblemFix"
' | tee ./'$win_nt$.~bt'/winnt.sif
```

`echo 'Cuarto y ultimo archivo txtsetup.sif'`
`rm ./'$win_nt$.~ls'/i386/txtsetup.sif ; wget -c https://github.com/inukaze/maestro/raw/master/Curiosidades/Grub_usb_xp/txtsetup.sif -P ./'$win_nt$.~ls'/i386`

Crear el archivo "./grub/grub.cfg" con el siguiente contenido : 

``` 
echo '#
# DO NOT EDIT THIS FILE
#
# It is automatically generated by grub2-mkconfig using templates
# from /etc/grub.d and settings from /etc/default/grub
#

### BEGIN /etc/grub.d/00_header ###
if [ -s $prefix/grubenv ]; then
  load_env
fi
if [ "${next_entry}" ] ; then
   set default="${next_entry}"
   set next_entry=
   save_env next_entry
   set boot_once=true
else
   set default="0"
fi

if [ x"${feature_menuentry_id}" = xy ]; then
  menuentry_id_option="--id"
else
  menuentry_id_option=""
fi

export menuentry_id_option

if [ "${prev_saved_entry}" ]; then
  set saved_entry="${prev_saved_entry}"
  save_env saved_entry
  set prev_saved_entry=
  save_env prev_saved_entry
  set boot_once=true
fi

function savedefault {
  if [ -z "${boot_once}" ]; then
    saved_entry="${chosen}"
    save_env saved_entry
  fi
}

function load_video {
  if [ x$feature_all_video_module = xy ]; then
    insmod all_video
  else
    insmod efi_gop
    insmod efi_uga
    insmod ieee1275_fb
    insmod vbe
    insmod vga
    insmod video_bochs
    insmod video_cirrus
  fi
}

if [ x$feature_default_font_path = xy ] ; then
   font=unicode
else
	font="${prefix}/fonts/unicode.pf2"
fi

if loadfont $font ; then
	#set gfxmode=1024x768x32,1024x768x24,1024x768x16,1024x768,auto
	#set gfxpayload=keep
	load_video
	insmod gfxterm
	#insmod png
	terminal_output gfxterm
	#background_image -m stretch $prefix/themes/splash.png
fi
if [ x$feature_timeout_style = xy ] ; then
  set timeout_style=menu
  set timeout=60
# Fallback normal timeout code in case the timeout_style feature is
# unavailable.
else
  set timeout=60
fi

menuentry "Reiniciar" {
	reboot
}

menuentry "Apagar" {
	halt
}

menuentry "Instalacion de MiniOS (Windows XP)" {
    insmod part_msdos
    insmod ntldr
    search --no-floppy --fs-uuid --set=root '"$UUID"'
    ntldr /bootmgr
}' | tee ./grub/grub.cfg
```

> 10) Copiar los archivos, Crear enlaces simbolicos, Instalar GRUB en el dispositivo USB y probarlo usando QEMU + KVM:


`cp './$win_nt$.~ls'/i386/ntldr ./ntldr` <br>
`cp './$win_nt$.~ls'/i386/setupldr.bin ./'$ldr$'` <br>
`cp './$win_nt$.~ls'/i386/setupldr.bin ./bootmgr` <br>
`cp './$win_nt$.~ls'/i386/bootfont.bin ./bootfont.bin` <br>
`cp './$win_nt$.~ls'/i386/ntdetect.com ./ntdetect.com` <br>
`cp './$win_nt$.~ls'/i386/txtsetup.sif ./txtsetup.sif` <br>
`cp './$win_nt$.~ls'/i386/system32 '$win_nt$.~bt'/system32` <br>
`cp './$win_nt$.~ls'/i386/bootfont.bin ./'$win_nt$.~bt'/bootfont.bin` <br>
`cp './$win_nt$.~ls'/i386/ssa.ex_ ./'$win_nt$.~bt'/ssa.ex_` <br>
`cp './$win_nt$.~ls'/i386/setupldr.bin ./'$win_nt$.~bt'/setupldr.bin` <br>
`cp './$win_nt$.~ls'/i386/ntdetect.com './$win_nt$.~bt'/ntdetect.com` <br>
`cp './$win_nt$.~ls'/i386/symc8xx.sy_ ./'$win_nt$.~bt'/symc8xx.sy_` <br>
`cp './$win_nt$.~ls'/i386/halaacpi.dl_ ./'$win_nt$.~bt'/halaacpi.dl_` <br>
`cp './$win_nt$.~ls'/i386/perc2.sy_ ./'$win_nt$.~bt'/perc2.sy_` <br>
`cp './$win_nt$.~ls'/i386/nvatabus.sy_ ./'$win_nt$.~bt'/nvatabus.sy_` <br>
`cp './$win_nt$.~ls'/i386/hidusb.sy_ ./'$win_nt$.~bt'/hidusb.sy_` <br>
`cp './$win_nt$.~ls'/i386/ini910u.sy_ ./'$win_nt$.~bt'/ini910u.sy_` <br>
`cp './$win_nt$.~ls'/i386/intelide.sy_ ./'$win_nt$.~bt'/intelide.sy_` <br>
`cp './$win_nt$.~ls'/i386/usetup.exe ./'$win_nt$.~bt'/system32/smss.exe` <br>
`cp './$win_nt$.~ls'/i386/dac960nt.sy_ ./'$win_nt$.~bt'/dac960nt.sy_` <br>
`cp './$win_nt$.~ls'/i386/fastfat.sy_ ./'$win_nt$.~bt'/fastfat.sy_` <br>
`cp './$win_nt$.~ls'/i386/usbohci.sy_ ./'$win_nt$.~bt'/usbohci.sy_` <br>
`cp './$win_nt$.~ls'/i386/usbport.sy_ ./'$win_nt$.~bt'/usbport.sy_` <br>
`cp './$win_nt$.~ls'/i386/videoprt.sy_ ./'$win_nt$.~bt'/videoprt.sy_` <br>
`cp './$win_nt$.~ls'/i386/txtsetup.sif ./'$win_nt$.~bt'/txtsetup.sif` <br>
`cp './$win_nt$.~ls'/i386/halacpi.dl_ ./'$win_nt$.~bt'/halacpi.dl_` <br>
`cp './$win_nt$.~ls'/i386/hidparse.sy_ ./'$win_nt$.~bt'/hidparse.sy_` <br>
`cp './$win_nt$.~ls'/i386/ksecdd.sys ./'$win_nt$.~bt'/ksecdd.sys` <br>
`cp './$win_nt$.~ls'/i386/iastor.sy_ ./'$win_nt$.~bt'/iastor.sy_` <br>
`cp './$win_nt$.~ls'/i386/isapnp.sy_ ./'$win_nt$.~bt'/isapnp.sy_` <br>
`cp './$win_nt$.~ls'/i386/abp480n5.sy_ ./'$win_nt$.~bt'/abp480n5.sy_` <br>
`cp './$win_nt$.~ls'/i386/asc3350p.sy_ ./'$win_nt$.~bt'/asc3350p.sy_` <br>
`cp './$win_nt$.~ls'/i386/usbuhci.sy_ ./'$win_nt$.~bt'/usbuhci.sy_` <br>
`cp './$win_nt$.~ls'/i386/cdrom.sy_ ./'$win_nt$.~bt'/cdrom.sy_` <br>
`cp './$win_nt$.~ls'/i386/c_1252.nl_ ./'$win_nt$.~bt'/c_1252.nl_` <br>
`cp './$win_nt$.~ls'/i386/viaide.sy_ ./'$win_nt$.~bt'/viaide.sy_` <br>
`cp './$win_nt$.~ls'/i386/si3112r.sy_ ./'$win_nt$.~bt'/si3112r.sy_` <br>
`cp './$win_nt$.~ls'/i386/symc810.sy_ ./'$win_nt$.~bt'/symc810.sy_` <br>
`cp './$win_nt$.~ls'/i386/wmilib.sy_ ./'$win_nt$.~bt'/wmilib.sy_` <br>
`cp './$win_nt$.~ls'/i386/spcmdcon.sys ./'$win_nt$.~bt'/spcmdcon.sys` <br>
`cp './$win_nt$.~ls'/i386/cd20xrnt.sy_ ./'$win_nt$.~bt'/cd20xrnt.sy_` <br>
`cp './$win_nt$.~ls'/i386/scsiport.sy_ ./'$win_nt$.~bt'/scsiport.sy_` <br>
`cp './$win_nt$.~ls'/i386/adpu160m.sy_ ./'$win_nt$.~bt'/adpu160m.sy_` <br>
`cp './$win_nt$.~ls'/i386/dpti2o.sy_ ./'$win_nt$.~bt'/dpti2o.sy_` <br>
`cp './$win_nt$.~ls'/i386/si3114r5.sy_ ./'$win_nt$.~bt'/si3114r5.sy_` <br>
`cp './$win_nt$.~ls'/i386/aha154x.sy_ ./'$win_nt$.~bt'/aha154x.sy_` <br>
`cp './$win_nt$.~ls'/i386/ohci1394.sy_ ./'$win_nt$.~bt'/ohci1394.sy_` <br>
`cp './$win_nt$.~ls'/i386/tffsport.sy_ ./'$win_nt$.~bt'/tffsport.sy_` <br>
`cp './$win_nt$.~ls'/i386/pcmcia.sy_ ./'$win_nt$.~bt'/pcmcia.sy_` <br>
`cp './$win_nt$.~ls'/i386/pcmcia.sy_ ./'$win_nt$.~bt'/spddlang.sy_` <br>
`cp './$win_nt$.~ls'/i386/cpqarray.sy_ ./'$win_nt$.~bt'/cpqarray.sy_` <br>
`cp './$win_nt$.~ls'/i386/kbdes.dll ./'$win_nt$.~bt'/kbdes.dll` <br>
`cp './$win_nt$.~ls'/i386/hal.dl_ ./'$win_nt$.~bt'/hal.dl_` <br>
`cp './$win_nt$.~ls'/i386/pciidex.sy_ ./'$win_nt$.~bt'/pciidex.sy_` <br>
`cp './$win_nt$.~ls'/i386/aliide.sy_ ./'$win_nt$.~bt'/aliide.sy_` <br>
`cp './$win_nt$.~ls'/i386/setupdd.sy_ ./'$win_nt$.~bt'/setupdd.sy_` <br>
`cp './$win_nt$.~ls'/i386/amsint.sy_ ./'$win_nt$.~bt'/amsint.sy_` <br>
`cp './$win_nt$.~ls'/i386/dac2w2k.sy_ ./'$win_nt$.~bt'/dac2w2k.sy_` <br>
`cp './$win_nt$.~ls'/i386/ahcix86.sy_ ./'$win_nt$.~bt'/ahcix86.sy_` <br>
`cp './$win_nt$.~ls'/i386/asc3550.sy_ ./'$win_nt$.~bt'/asc3550.sy_` <br>
`cp './$win_nt$.~ls'/i386/disk.sy_ ./'$win_nt$.~bt'/disk.sy_` <br>
`cp './$win_nt$.~ls'/i386/vga850.fo_ ./'$win_nt$.~bt'/vga850.fo_` <br>
`cp './$win_nt$.~ls'/i386/si3531.sy_ ./'$win_nt$.~bt'/si3531.sy_` <br>
`cp './$win_nt$.~ls'/i386/hpn.sy_ ./'$win_nt$.~bt'/hpn.sy_` <br>
`cp './$win_nt$.~ls'/i386/usbd.sy_ ./'$win_nt$.~bt'/usbd.sy_` <br>
`cp './$win_nt$.~ls'/i386/sfloppy.sy_ ./'$win_nt$.~bt'/sfloppy.sy_` <br>
`cp './$win_nt$.~ls'/i386/ultra.sy_ ./'$win_nt$.~bt'/ultra.sy_` <br>
`cp './$win_nt$.~ls'/i386/halapic.dl_ ./'$win_nt$.~bt'/halapic.dl_` <br>
`cp './$win_nt$.~ls'/i386/ntfs.sys ./'$win_nt$.~bt'/ntfs.sys` <br>
`cp './$win_nt$.~ls'/i386/fdc.sy_ ./'$win_nt$.~bt'/fdc.sy_` <br>
`cp './$win_nt$.~ls'/i386/setupreg.hiv ./'$win_nt$.~bt'/setupreg.hiv` <br>
`cp './$win_nt$.~ls'/i386/partmgr.sy_ ./'$win_nt$.~bt'/partmgr.sy_` <br>
`cp './$win_nt$.~ls'/i386/ramdisk.sy_ ./'$win_nt$.~bt'/ramdisk.sy_` <br>
`cp './$win_nt$.~ls'/i386/usbccgp.sy_ ./'$win_nt$.~bt'/usbccgp.sy_` <br>
`cp './$win_nt$.~ls'/i386/si3124r5.sy_ ./'$win_nt$.~bt'/si3124r5.sy_` <br>
`cp './$win_nt$.~ls'/i386/sym_u3.sy_ ./'$win_nt$.~bt'/sym_u3.sy_` <br>
`cp './$win_nt$.~ls'/i386/biosinfo.inf ./'$win_nt$.~bt'/biosinfo.inf` <br>
`cp './$win_nt$.~ls'/i386/system32/ntdll.dll ./'$win_nt$.~bt'/system32/ntdll.dll` <br>
`cp './$win_nt$.~ls'/i386/pciide.sy_ ./'$win_nt$.~bt'/pciide.sy_` <br>
`cp './$win_nt$.~ls'/i386/usbstor.sy_ ./'$win_nt$.~bt'/usbstor.sy_` <br>
`cp './$win_nt$.~ls'/i386/ql1240.sy_ ./'$win_nt$.~bt'/ql1240.sy_` <br>
`cp './$win_nt$.~ls'/i386/drvmain.sdb ./'$win_nt$.~bt'/drvmain.sdb` <br>
`cp './$win_nt$.~ls'/i386/acpiec.sy_ ./'$win_nt$.~bt'/acpiec.sy_` <br>
`cp './$win_nt$.~ls'/i386/dmload.sy_ ./'$win_nt$.~bt'/dmload.sy_` <br>
`cp './$win_nt$.~ls'/i386/si3132r5.sy_ ./'$win_nt$.~bt'/si3132r5.sy_` <br>
`cp './$win_nt$.~ls'/i386/c_850.nl_ ./'$win_nt$.~bt'/c_850.nl_` <br>
`cp './$win_nt$.~ls'/i386/acpi.sy_ ./'$win_nt$.~bt'/acpi.sy_` <br>
`cp './$win_nt$.~ls'/i386/sbp2port.sy_ ./'$win_nt$.~bt'/sbp2port.sy_` <br>
`cp './$win_nt$.~ls'/i386/i8042prt.sy_ ./'$win_nt$.~bt'/i8042prt.sy_` <br>
`cp './$win_nt$.~ls'/i386/dmio.sy_ ./'$win_nt$.~bt'/dmio.sy_` <br>
`cp './$win_nt$.~ls'/i386/perc2hib.sy_ ./'$win_nt$.~bt'/perc2hib.sy_` <br>
`cp './$win_nt$.~ls'/i386/ftdisk.sy_ ./'$win_nt$.~bt'/ftdisk.sy_` <br>
`cp './$win_nt$.~ls'/i386/lbrtfdc.sy_ ./'$win_nt$.~bt'/lbrtfdc.sy_` <br>
`cp './$win_nt$.~ls'/i386/cdfs.sy_ ./'$win_nt$.~bt'/cdfs.sy_` <br>
`cp './$win_nt$.~ls'/i386/aic78u2.sy_ ./'$win_nt$.~bt'/aic78u2.sy_` <br>
`cp './$win_nt$.~ls'/i386/cbidf2k.sy_ ./'$win_nt$.~bt'/cbidf2k.sy_` <br>
`cp './$win_nt$.~ls'/i386/ntkrnlmp.ex_ ./'$win_nt$.~bt'/ntkrnlmp.ex_` <br>
`cp './$win_nt$.~ls'/i386/i2omgmt.sy_ ./'$win_nt$.~bt'/i2omgmt.sy_` <br>
`cp './$win_nt$.~ls'/i386/disk1 ./'$win_nt$.~bt'/disk101` <br>
`cp './$win_nt$.~ls'/i386/disk1 ./'$win_nt$.~bt'/disk102` <br>
`cp './$win_nt$.~ls'/i386/disk1 ./'$win_nt$.~bt'/disk103` <br>
`cp './$win_nt$.~ls'/i386/disk1 ./'$win_nt$.~bt'/disk104` <br>
`cp './$win_nt$.~ls'/i386/bootvid.dl_ ./'$win_nt$.~bt'/bootvid.dl_` <br>
`cp './$win_nt$.~ls'/i386/atapi.sy_ ./'$win_nt$.~bt'/atapi.sy_` <br>
`cp './$win_nt$.~ls'/i386/oprghdlr.sy_ ./'$win_nt$.~bt'/oprghdlr.sy_` <br>
`cp './$win_nt$.~ls'/i386/ql12160.sy_ ./'$win_nt$.~bt'/ql12160.sy_` <br>
`cp './$win_nt$.~ls'/i386/sparrow.sy_ ./'$win_nt$.~bt'/sparrow.sy_` <br>
`cp './$win_nt$.~ls'/i386/kbdhid.sy_ ./'$win_nt$.~bt'/kbdhid.sy_` <br>
`cp './$win_nt$.~ls'/i386/hidclass.sy_ ./'$win_nt$.~bt'/hidclass.sy_` <br>
`cp './$win_nt$.~ls'/i386/i2omp.sy_ ./'$win_nt$.~bt'/i2omp.sy_` <br>
`cp './$win_nt$.~ls'/i386/mountmgr.sy_ ./'$win_nt$.~bt'/mountmgr.sy_` <br>
`cp './$win_nt$.~ls'/i386/kdcom.dl_ ./'$win_nt$.~bt'/kdcom.dl_` <br>
`cp './$win_nt$.~ls'/i386/dmboot.sy_ ./'$win_nt$.~bt'/dmboot.sy_` <br>
`cp './$win_nt$.~ls'/i386/serenum.sy_ ./'$win_nt$.~bt'/serenum.sy_` <br>
`cp './$win_nt$.~ls'/i386/ql1280.sy_ ./'$win_nt$.~bt'/ql1280.sy_` <br>
`cp './$win_nt$.~ls'/i386/classpnp.sy_ ./'$win_nt$.~bt'/classpnp.sy_` <br>
`cp './$win_nt$.~ls'/i386/ql1080.sy_ ./'$win_nt$.~bt'/ql1080.sy_` <br>
`cp './$win_nt$.~ls'/i386/l_intl.nl_ ./'$win_nt$.~bt'/l_intl.nl_` <br>
`cp './$win_nt$.~ls'/i386/kbdclass.sy_ ./'$win_nt$.~bt'/kbdclass.sy_` <br>
`cp './$win_nt$.~ls'/i386/serial.sy_ ./'$win_nt$.~bt'/serial.sy_` <br>
`cp './$win_nt$.~ls'/i386/toside.sy_ ./'$win_nt$.~bt'/toside.sy_` <br>
`cp './$win_nt$.~ls'/i386/vga.sy_ ./'$win_nt$.~bt'/vga.sy_` <br>
`cp './$win_nt$.~ls'/i386/ql10wnt.sy_ ./'$win_nt$.~bt'/ql10wnt.sy_` <br>
`cp './$win_nt$.~ls'/i386/siremfil.sy_ ./'$win_nt$.~bt'/siremfil.sy_` <br>
`cp './$win_nt$.~ls'/i386/asc.sy_ ./'$win_nt$.~bt'/asc.sy_` <br>
`cp './$win_nt$.~ls'/i386/mraid35x.sy_ ./'$win_nt$.~bt'/mraid35x.sy_` <br>
`cp './$win_nt$.~ls'/i386/aic78xx.sy_ ./'$win_nt$.~bt'/aic78xx.sy_` <br>
`cp './$win_nt$.~ls'/i386/kd1394.dl_ ./'$win_nt$.~bt'/kd1394.dl_` <br>
`cp './$win_nt$.~ls'/i386/pci.sy_ ./'$win_nt$.~bt'/pci.sy_` <br>
`cp './$win_nt$.~ls'/i386/1394bus.sy_ ./'$win_nt$.~bt'/1394bus.sy_` <br>
`cp './$win_nt$.~ls'/i386/flpydisk.sy_ ./'$win_nt$.~bt'/flpydisk.sy_` <br>
`cp './$win_nt$.~ls'/i386/sym_hi.sy_ ./'$win_nt$.~bt'/sym_hi.sy_` <br>
`cp './$win_nt$.~ls'/i386/cmdide.sy_ ./'$win_nt$.~bt'/cmdide.sy_` <br>
`cp './$win_nt$.~ls'/i386/usbhub.sy_ ./'$win_nt$.~bt'/usbhub.sy_` <br>
`cp './$win_nt$.~ls'/i386/nvraid.sy_ ./'$win_nt$.~bt'/nvraid.sy_` <br>
`cp './$win_nt$.~ls'/i386/usbehci.sy_ ./'$win_nt$.~bt'/usbehci.sy_` <br>
`cp -av * /media/usb/` <br>

`echo "Instalar GRUB en el Pendrive (En mi caso tarda alrededor de 10 minutos en hacerlo):"` <br>
`grub-install $USB --boot-directory=/media/usb --removable --target=i386-pc` <br>

`echo "Desmontar pendrive sin expulsarlo"` <br>
`su -c "umount /media/usb" root` <br>

`echo "Probar usando QEMU + KVM ( NOTA -> me da el error 4 con setupdd.sy_ ):"` <br>
`qemu-img create -f qcow2 "$HOME/miniosxp.qcow2" 5G` <br>
`kvm -hda $USB -hdb $HOME/miniosxp.qcow2 -m 512 -vga std -usbdevice tablet -net none` <br>
<br>