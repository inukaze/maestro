Raspberry Pi en QEMU
--------------------

PreRequisitos :
1 - Debes instalar Qemu / kvm / extras principalmente

    Opcionalmente : bridge-utils uml-utilities openvpn. Esto unicamente en caso de querer hacer una conexion puente
    Para poder acceder a internet o intranet desde Raspbian dentro de QEmu
    
    En caso de instalar los opcionales deberas configurarlo en internet hay bastante extensos y complejos tutoriales
    de como hacer el puente entre la maquina virtual y el equipo anfitrion para permitirle compartir la conexion a internet.
   
D) Otorgarle permision de ejecucion y usarlo
`sudo chmod +x /etc/qemu-ifup`
``
2 - Descarga : 
    * [Nucleo para QEMU](https://github.com/dhruvvyas90/qemu-rpi-kernel)
    * Una imagen de [Raspbian](http://www.raspberrypi.org/downloads)

Ahora lo hare a mi manera lo que hare sera
A) Creare un subdirectorio para trabajar, lo hare con este comando :
`mkdir -p "$HOME/raspbian/raiz" ; cd "$HOME/raspbian"`
    
B) Descargo la version "Lite" de Raspbian
`wget https://downloads.raspberrypi.org/raspbian_lite_latest`
    
C) Extraigo la imagen del archivo comprimido que descargue
`unzip raspbian_lite_latest.zip`

D) Descargo un nucleo para QEmu compatible con Raspberry Pi :
`wget https://github.com/dhruvvyas90/qemu-rpi-kernel/raw/master/kernel-qemu-4.14.79-stretch`
`wget https://github.com/dhruvvyas90/qemu-rpi-kernel/raw/master/versatile-pb.dtb`
`git clone https://github.com/nachoparker/qemu-raspbian-network.git`
`cd qemu-raspbian-network ; cp qemu-pi.sh ../ ; cd ..` 

Tambien aprovechare para meter unas variables de entorno :
`export NUCLEO="$HOME/raspbian/kernel-qemu-4.14.79-stretch"`
`export RASPBIAN="$HOME/raspbian/latest-raspbian-stretch-lite.img"`
    
E) Examino con fdisk cual es el sector de inicio de la particion Linux dentro de la imagen de Raspberry

```
fdisk -l latest-raspbian-stretch-lite.img
    
Disco 2019-06-20-raspbian-buster-lite.img: 2 GiB, 2197815296 bytes, 4292608 sectores
Unidades: sectores de 1 * 512 = 512 bytes
Tamaño de sector (lógico/físico): 512 bytes / 512 bytes
Tamaño de E/S (mínimo/óptimo): 512 bytes / 512 bytes
Tipo de etiqueta de disco: dos
Identificador del disco: 0x0634f60c

Disposit.                            Inicio Comienzo   Final Sectores Tamaño Id Tipo
2019-06-20-raspbian-buster-lite.img1            8192  532480   524289   256M  c W95 FAT32 (LBA)
2019-06-20-raspbian-buster-lite.img2          540672 4292607  3751936   1,8G 83 Linux
```

Bien aqui lo importarte en donde indica "Comienzo" de la segunda particion la que tiene el valor "**540672**"
Este valor debo multiplicarlo por "512" para encontrar donde inicia realmente el resultado es "**276824064**"

F)  Para simplicar la obtencion de datos relevantes usare los siguientes comandos para obtener lo que busco :
y luego monto la imagen en el directorio "$HOME/raspbian/raiz"
```
SECTOR1=$( fdisk -l $RASPBIAN | grep FAT32 | awk '{ print $2 }' )
SECTOR2=$( fdisk -l $RASPBIAN | grep Linux | awk '{ print $2 }' )
SECTOR1=$(( SECTOR1 * 512 ))
SECTOR2=$(( SECTOR2 * 512 ))

echo 'Activar SSH:'
sudo mount "$RASPBIAN" -o offset=$SECTOR1 "$HOME/raspbian/raiz"
sudo touch "$HOME/raspbian/raiz/ssh"	
sudo umount "$RASPBIAN"

echo 'Acomodar el montaje de particiones:'
sudo mount "$RASPBIAN" -o offset=$SECTOR2 "$HOME/raspbian/raiz"
echo 'KERNEL=="sda", SYMLINK+="mmcblk0"
KERNEL=="sda?", SYMLINK+="mmcblk0p%n"
KERNEL=="sda2", SYMLINK+="root"' | sudo tee "$HOME/raspbian/raiz/etc/udev/rules.d/90-qemu.rules"
````

G)  Una vez montada debo editar sus archivos problematicos y comentar todas las lineas, para poder iniciar desde QEmu
`sudo sed -i -e 's/^/#/' "$HOME/raspbian/raiz/etc/ld.so.preload"`
`sudo sed -i -e 's/^/#/' "$HOME/raspbian/raiz/etc/ld.so.conf"`
`sudo sed -i -e 's/^/#/' "$HOME/raspbian/raiz/etc/fstab"`

H)  Desmonto la imagen montada
`sudo umount "$RASPBIAN"`
    
I)  Iniciar Raspbian :

```
echo 'Variables de Entorno :'
export NUCLEO="$HOME/raspbian/kernel-qemu-4.14.79-stretch"
export RASPBIAN="$HOME/raspbian/latest-raspbian-stretch-lite.img"
export PTB=$HOME/raspbian/versatile-pb.dtb
SECTOR1=$( fdisk -l $RASPBIAN | grep FAT32 | awk '{ print $2 }' )
SECTOR2=$( fdisk -l $RASPBIAN | grep Linux | awk '{ print $2 }' )
SECTOR1=$(( SECTOR1 * 512 ))
SECTOR2=$(( SECTOR2 * 512 ))

echo 'Iniciar QEmu:'
qemu-system-arm \
-kernel "$NUCLEO" \
-cpu arm1176 \
-m 256M \
-M versatilepb \
-dtb "$PTB" \
-no-reboot \
-serial stdio \
-append "root=/dev/sda2 panic=1 rootfstype=ext4 rw" \
-drive file="$RASPBIAN",index=0,media=disk,format=raw \
-net user,hostfwd=tcp::5022-:22,vlan=0 # \
 # -net nic -net tap,ifname=tap0
```

El Usuario es "pi" y la contraseña es "raspberry"