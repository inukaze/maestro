error: XDG_RUNTIME_DIR not set in the environment.

Solucion :

```
sudo mkdir -p /run/user/$UID
export XDG_RUNTIME_DIR=/run/user/$UID
sudo chmod 777 -R /run/user/$UID
sudo chown -R $USER:users /run/user/$UID

#Verificar las aplicaciones que esten usando los dispositivos de sonido para cerrarlas
fuser -v /dev/snd/*
killall -9 fluidsynth pulseaudio pnmixer

#Reiniciar Jack & Pulseaudio:
pulseaudio --kill
jack_control start
jack_control exit
pulseaudio --start
```