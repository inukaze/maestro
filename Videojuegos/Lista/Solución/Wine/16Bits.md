Solucion a la ejecucion de videojuegos mediante wine que requieren 16 Bits de profundiad en color

1 - Verificar que exista el archivo `/etc/X11/Xwrapper.config`

En caso de que exista verificar que contiene la siguiente linea `allowed_users=anybody`
En caso de que no exista el archivo, crearlo con dicha linea

2 - Crear un Script , por ejemplo con contenido similar al siguiente :

#Iniciarliazr una Session Grafica X / X11 / Xorg nueva :
#Iniciar PlayOnLinux
#PlayOnLinux inicia el Enlaze / Acceso Directo llmado "Microsoft Midtown Madness 1 Chicago Edition" en la tty6 a 16 bpp
`exec xinit /usr/share/playonlinux/playonlinux --run "Microsoft Midtown Madness 1 Chicago Edition" %F -- :1 vt6 -ac -depth 16 &`

# Esperar que "Midtown Madness" Inicie
`until pids=$(pidof midtown.exe)`
`do`
`    sleep 1`
`done`

# Cuando "midtown.exe" haya sido iniciado
# Cambiar la resolucion de la tty6 en 640x480
`for pid in $pids`
`do`
`    DISPLAY=:1 /usr/bin/xrandr -s 640x480`
`done`