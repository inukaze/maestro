#
# ~/.bashrc
#

# Archivo ~/.bashrc
# Hecho por "Inukaze" (De Venezuela
# Sitio Web de Inukaze-> http://inukaze.wordpress.com

# Ajustado y Adaptado segun varios sitios de Internet
# Para facilitar , la personalizacion del "prompt" de las terminales que usan bash

# Sitios Web , donde puedes encontrar más ejemplos :
# 1 -> http://www.askapache.com/linux/bash-power-prompt.html

function colores_en_terminal () {

	local CDU=$BLANCO		# Colores del Usuario Actual
	[ $UID -eq "0" ] && CDU=$ROJO	# Colores del SuperUsuario Root
	
	INV="\[\033[7m\]"		# Intercambiar Colores de Frente & Fondo
        NEGRITA='\033[01m'
	ADORNO='\342\234\227'
	REAJUSTE="\[\033[0m\]"		# Reinicio / Sin Color
	COLORIDO="\[\033[1m\]"		# Color de Alta Intensidad
	MARCADOR='\342\234\223'
	SUBRAYADO="\[\033[4m\]"
	
	# Colores Regulares
	GRIS='\[\033[1;30m\]'
	CYAN="\[\033[0;36m\]"
	AZUL="\[\033[0;34m\]"
	ROJO="\[\033[0;31m\]"
	VERDE="\[\033[0;32m\]"
	NEGRO="\[\033[0;30m\]"
	BLANCO="\[\033[0;37m\]"
	SINCOLOR="\[\033[00m\]"
	MAGENTA="\[\033[0;35m\]"
	MARRON="\[\033[00;33m\]"
	PURPURA="\[\033[00;35m\]"
	AMARILLO="\[\033[0;33m\]"

	# Colores Resaltados (Osea con Negrita)
    	NEGRITA_ROJO="\[\033[1;31m\]"
	NEGRITA_AZUL="\[\033[1;34m\]"
	NEGRITA_CYAN="\[\033[1;36m\]"
	NEGRITA_VERDE="\[\033[01;32m\]"
	NEGRITA_NEGRO="\[\033[1;30m\]"
	NEGRITA_GRIS="\[\033[01;37m\]"
	NEGRITA_BLANCO="\[\033[1;37m\]"
	NEGRITA_MAGENTA="\[\033[1;35m\]"
	NEGRITA_PURPURA="\[\033[01;35m\]"
	NEGRITA_AMARILLO="\[\033[1;33m\]"

	
	# Colores del Primer Plano
	PP_ROJO="\[\033[31m\]"
	PP_AZUL="\[\033[34m\]"
	PP_CYAN="\[\033[36m\]"
	PP_NEGRO="\[\033[30m\]"
	PP_VERDE="\[\033[32m\]"
	PP_BLANCO="\[\033[37m\]"
	PP_MAGENTA="\[\033[35m\]"
	PP_AMARILLO="\[\033[33m\]"

	# Colores de Fondo
	CF_ROJO="\[\033[41m\]"
	CF_AZUL="\[\033[44m\]"
	CF_CYAN="\[\033[46m\]"
	CF_NEGRO="\[\033[40m\]"
	CF_VERDE="\[\033[42m\]"
	CF_BLANCO="\[\033[47m\]"
	CF_MAGENTA="\[\033[45m\]"
	CF_AMARILLO="\[\033[43m\]"

	# EXPLICACION :
	# PS1 -> Prompt Shell 1 -> En español seria algo como "Capa Inmediata 1"
	# Aqui vamos a definir unicamente la capa 1 de las 4 ó 5 que existen
	# 
	# Puedes usar comandos de Linux directamente en la Variable de 
	# Entorno del sistema llamada "PS1"
	# 
	# Aparte de ello existen varios codigos que puedes usar en el PS1=
	# Aqui te explicare algunos de ellos , para que puedas personalizar
	#
	# La mayoria de ellos son los mismos que al utilizar en la terminal
	# echo -e "Algun texto de prueba\nComo este por ejemplo"
	
	# Explicacion de Codigos :
	# \a -> Caracter ASCII 07 : "Campana"
	# \d -> La fecha en "Nombre del dia de Semana Mes Numero del Dia de Semana " (Ejemplo : "vie may 30")
	# \e -> Caracter ASCII 033 : "Escape"
	# \h -> Nombre de la primera parte del anfitrión en uso
	# \H -> Nombre del anfitrión
	# \j -> El numero actual de trabajos controlados actualmente por la consola
	# \l -> Nombre base del dispositivo terminal de la capa inmediata (puede ser del 1 al 4/5)
	# \n -> Salto de Linea
	# \r -> Retorno del carro
	# \s -> Nombre del interprete , comando `basename $0` (la parte siguiente de la barra final)
	# \t -> Hora Acutal en Formato de 24 Horas -> Hora:Minutos:Segundos
	# \T -> Hora Acutal en Formato de 12 Horas -> Hora:Minutos:Segundos
	# \@ -> Hora Acutal en Formato de 12 Horas -> Hora:Minutos: am/pm 
	# \A -> Hora Acutal en Formato de 24 Horas -> Hora:Minutos
	# \u -> Nombre de usuario del usuario actual
	# \v -> La version de Bash (Ejemplo : 2.0)
	# \V -> La version de Bash + Nivel de Parche (Ejemplo : 2.0.00) the release of bash, version + patch level
	# \w -> Muestra La Ruta Acortada Del Directorio de Trabajo Actual , en $HOME se abrevia con una tilde
	# \W -> Muestra La Ruta Completa Del Directorio de Trabajo Actual , en $HOME se abrevia con una tilde
	# \! -> el número de historia de este comando
	# \# -> el número de comando de este comando
	# \$ -> si el UID efectivo es 0, un #, de lo contrario un $
	# \\ -> barra invertida
	# \[ -> comenzar una secuencia de caracteres no imprimibles, que podría ser utilizado para incrustar una secuencia de control de terminal en el interprete	
	# \] -> terminar una secuencia de caracteres no imprimibles
	#
	#
	# \nnn -> el carácter correspondiente al número octal nnn
	# en la terminal puedes usar el comando `man ascii` 
	# alli veras que una Columna dice "OCT" alli estan los valores octales
	# que puedes usar , por ejemplo para el caracter / el octal es 057
	#
	# Ejemplo(s)
	# PS1='[\u@\h: \W] (\057) \$ '
	#
	#
	# \D -> Fecha y Hora Personalizada se usan los valores de "date --help"
	# por ejemplo %H:%M:%S (Hora:Minitos:Segundos) si quieres usar am/pm en 
	# lugar de usar "%S" para los segundos debes usar "%p" para "am/pm"
	#
	# Ejemplo(s) :
	# PS1="[\u@\h: \W] (\D{%T %p) \$ "
	# PS1=(\D{%H:%M %p) "[\u@\h: \W]  \$ "
	#
	# Tambien puedes meter comandos yo lo hago con () por ejemplo
	# PS1="$(date +%d-%m-%Y)@$(date +%I:%M%p)\n${NEGRITA_VERDE}$ ${SINCOLOR}"
	#
	# Si se fijan bien , en el ejemplo anterior use el comando date
	# obviamente que con las opciones , uno para la fecha y otro para la hora
	# el "@" arroba que esta de por medio es solo un adorno.
	#
	# NOTA FINAL : No se si te abras percatado de lo siguiente , es importante que se entienda
	# Primer Ejemplo -> PS1='[\u@\h \W]\$ '
	# Segundo Ejemplo -> PS1="[\u@\h \W]\$ "
	#
	# Posiblemente cuando los uses solo el primero o el segundo , no veas problema alguno
	# Pero cuando intentes usar por ejemplo
	#
	# Primero -> PS1='[${CYAN}\u@\h ${NEGRITA_VERDE}\W]\$ ${SINCOLOR}'
	# Y te percates de que en la terminal , luce asi :
	#
	# [\[\033[0;36m\]inukaze@Inukaze \[\033[01;32m\]Linux]$ \[\033[00m\]
	#
	# La solucion es simplemente cambias las '' por "" , osea como en el segundo ejemplo
	# Te tenie que quedar asi
	# Segundo -> PS1="[${CYAN}\u@\h ${NEGRITA_VERDE}\W]\$ ${SINCOLOR}"
	#
	# Esto es debido a que colocar texto entre ' es para un entrecomillado fuerte y literal
	# de esta manera las variables no pueden cambiar su valor al establecido previamente.
	#
	# Al colocarlo entre " es un entrecomillado más pasivo y las varibles usan sus valores
	
	[ -z "$PS1" ] && return

	alias ls='ls -p --color=auto'
	
	# EJEMPLOS :
	# PS1='[\u@\h \W]\$ '
	# PS1="$NEGRITA_VERDE\u $AMARILLO[$ROJO\w$AMARILLO]$SINCOLOR "
	# PS1="$NEGRITA_VERDE\u $AMARILLO[$ROJO\w$AMARILLO] $NEGRITA_BLUE(\$(date +%H:%M:%S))$SINCOLOR: "
	# PS1="\n\e[1;37m[\e[0;32m\u\e[0;35m@\e[0;32m\h\e[1;37m]\e[1;37m[\e[0;31m\w\e[1;37m]\n$ \e[0m
	# PS1="\[\033[01;32m\]\D{%d-%m-%Y}@`(date +%I:%M%p)`\[\033[00m\]:\[\033[34m\]\w\[\033[00m\]\$ "
	# PS1="\n${SINCOLOR}${NEGRITA_AMARILLO}[Ubicacion Actual : \w]\n${CDU}${NEGRITA_GRIS}$(date +%d-%m-%Y)@$(date +%I:%M%p)\n${NEGRITA_VERDE}$ ${SINCOLOR}"
	# PS1="\n${SINCOLOR}${NEGRITA_AMARILLO}[Hora      : \@ ][Fecha : $(date +%d-%m-%Y) ]\n${NEGRITA_AZUL}[Usuario   : \u  ]\n${SINCOLOR}${NEGRITA_ROJO}[Ubicacion : \W ]${NEGRITA_VERDE}$ ${SINCOLOR}"
	# PS1="\n${SINCOLOR}${NEGRITA_AMARILLO}[Usuario   :   \u  ]${SINCOLOR}${NEGRITA_AZUL}\n[Hora      :  \@  ]\n[Fecha     : $(date +%d-%m-%Y) ]\n${NEGRITA_ROJO}[Ubicacion : \W ]\n${NEGRITA_VERDE}$ ${SINCOLOR}"
	# PS1="\n${SINCOLOR}[ ${NEGRITA_AMARILLO}\u ${SINCOLOR}${NEGRITA_AZUL}| $(date +%d-%m-%Y) | \@ ${SINCOLOR}]\n[${NEGRITA_ROJO}\W${SINCOLOR}]${NEGRITA_VERDE}$ ${SINCOLOR}"


		# Definiendo la variable de entorno PS1 :
		
		# Que yo uso actualmente
		PS1="\n${SINCOLOR}${NEGRITA_AMARILLO}[ \u ${SINCOLOR}${NEGRITA_AZUL}| $(date +%d-%m-%Y) | ${NEGRITA_ROJO}\@ ]${SINCOLOR}\n[\W]${NEGRITA_VERDE}$ ${SINCOLOR}"

		# El Predeterminado de ArchLinux, le cambie los '' por "" , debido a lo que explique más arriba.
		#PS1="[\u@\h \W]\$ "
		
		# NOTA : Puedes guardar este archivo como por ejemplo ~/pruebash
		# y al ejecutar una consola / terminal , o como quieras llamarlo
		# puedes usar el comando :
		#
		# $ source ~/pruebash
		#
		# Asi veras como luce , esto tomara el ultimo valor asignado a PS1
    }

    colores_en_terminal

	# Iniciar mejoras con NVIDIA (Privativo) :
#nv#	  nvidia-settings -a InitialPixmapPlacement=2 2&>/dev/null
#nv#	  nvidia-settings -a GlyphCache=1 2&>/dev/null
	  nvidia-settings --load-config-only
	  

	# Establecer mi idioma en el Sistema :
#	export LC_CTYPE=es_VE.UTF-8
#	export LC_MESSAGES=es_VE.UTF-8
#	export LC_ALL=es_VE.UTF-8

	# Establecer Puertos para Reproduccion Midi
	# Si Tienes Instalado y estas Usando " Timidity / Timidity++ " :
	export ALSA_OUTPUT_PORTS="128:0","128:1","128:2","128:3"

	# Correcion para Steam para que me deje de dar errores como :
	# Could not find required OpenGL entry point :
	# 'glColorMaskIndexedEXT'
	# 'GLGetError'!
	# 'glUseProgramStages'!
	# 
	export PATH="/media/Compartido/Videojuegos/Gestor/Linux/Steam/Slackware64/home/bin/":$PATH 
	export GAME_DEBUGGER="hl2debug"

	# Error de Python :
	#  Could not find platform independent libraries <prefix>
	#  Could not find platform dependent libraries <exec_prefix>
        #  Consider setting $PYTHONHOME to <prefix>[:<exec_prefix>]
	#  ImportError: No module named site
	#
	# Rebusque :
#	  PATH=/usr/bin:$PATH
	  #export PYTHONPATH=/usr/lib64/python2.7/
	  #export PYTHONHOME=/usr/bin/python
#	export PROMPT_COMMAND='printf "\033]0;%s@%s:%s\007" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/~}"'
	export PROMPT_COMMAND='printf "\033]0;%s@%s: %s\007" "${USER}" "${HOSTNAME%%.*}" "${PWD/*\//}"'

#Activar "ccache" (para compilar mas rapido algunas cosas como retroarch)
export PATH=/usr/lib/ccache/:$PATH


#VirtualBOX : Acceso a Disco Duro Real y Las Particiones "Slacks"
#cd "$HOME"
#rm -rf "$HOME/Compartido.vmdk"
#Compartido=$(blkid | grep "Compartido" | awk '{print$01}' | sed 's/\/*:$//')
#echo "Particion Compartido=$Compartido"
#DDCompartido=$(echo "$Compartido" | sed 's/[0-9]*//g')
#VBoxManage internalcommands createrawvmdk -filename Compartido.vmdk -rawdisk $DDCompartido

#MIDI :
export ALSA_OUTPUT_PORTS="128:0","128:1","128:2","128:3"
MIDI=$(ps -A | egrep 'fluidsynth|timidity')
if [ -z "$MIDI" ]; then
    fluidsynth1=$(fluidsynth  --disable-lash --server --audio-driver=pulseaudio --portname=alsa_seq -i -p FluidSynth -R 0 -C 0 -c 2 -z 512 -r 48000 /usr/share/sounds/sf2/default.sf2 &> /dev/null &)
    eval "$fluidsynth1"
    MIDI=$(ps -A | egrep 'fluidsynth|timidity' | awk '{print $4}')
    if [ "$MIDI" = "fluidsynth" ]; then
	#echo 'Sintetizador MIDI en uso : Fluidsynth'
	echo
    fi
    elif [ -z "MIDI" ]; then
	timidity1=$(timidity -iA -B5,10 -Os1l -s 44100 -Oe &> /dev/null &)
	eval "$timidity1"
	MIDI=$(ps -A | egrep 'fluidsynth|timidity' | awk '{print $4}')
	if [ "$MIDI" = "timidity" ]; then
	    #echo 'Sintetizador MIDI en uso : Timidity'
	    echo
	fi
fi

export PULSE_LATENCY_MSEC=60
