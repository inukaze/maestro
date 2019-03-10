#!/usr/bin/env bash
#
#
#
FECHA=$(date +"%Y-%m-%d")
HORA=$(date +"%r")
ADC2="/etc/ssh/sshd_config"
sudo echo "Instalacion de Servidor SSH" ; \
sudo apt-get install --reinstall openssh-server openssh-client ssh-askpass ; \
sudo echo "Configuracion Manual de SSHD" ; \
sudo touch /etc/ssh/ssh_host_rsa_key	    ; sudo chmod 777 /etc/ssh/ssh_host_rsa_key
sudo touch /etc/ssh/ssh_host_dsa_key	    ; sudo chmod 777 /etc/ssh/ssh_host_dsa_key
sudo touch /etc/ssh/ssh_host_ecdsa_key	    ; sudo chmod 777 /etc/ssh/ssh_host_ecdsa_key
cd "$HOME" ; \
ippriv=$(ifconfig $1 | grep "inet addr" | awk -F: '{print $2}' | awk '{print $1}' | head -n 1) ; \
sudo rm -rf /etc/ssh/ssh_host_* ; \
rm -rf ~/.ssh/{authorized_keys,id_dsa,id_dsa.pub,id_ecdsa,id_ecdsa.pub,id_rsa,id_rsa.pub,known_hosts} ; \
rm -rf ~/.ssh/ssh_host_* ; \
rm -rf ~/.ssh ; \
sudo ssh-keygen -t rsa -b 4096 -f /etc/ssh/ssh_host_rsa_key ; \
sudo ssh-keygen -t dsa -f /etc/ssh/ssh_host_dsa_key ; \
sudo ssh-keygen -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key
sudo ssh-keygen -A ; \
mkdir ~/.ssh ; \
chmod -R 700 ~/.ssh ; \
cd ~/.ssh ; \
ssh-keygen -t dsa -f ~/.ssh/ssh_host_dsa_key ; \
ssh-keygen -t rsa -b 4096 -f ~/.ssh/ssh_host_rsa_key ; \
ssh-keygen -t ecdsa -f ~/.ssh/ssh_host_ecdsa_key ; \
ssh-keygen -f ~/.ssh/ssh_host_key ; \
ssh-keygen -t dsa ; \
ssh-keygen -t rsa ; \
ssh-keygen -t ecdsa ; \
cat id_rsa.pub >> authorized_keys ; \
chmod 644 authorized_keys ; \
cat id_rsa >> "$USER@$HOSTNAME" ; \
cp ~/.ssh/"$USER@$HOSTNAME" "/media/Compartido/Liñux/"$USER@$HOSTNAME"" ; \
chmod 600 ~/.ssh/id_rsa ; \
sudo chmod 600 /etc/ssh/{ssh_host_dsa_key,ssh_host_rsa_key,ssh_host_ecdsa_key} ; \
sudo echo -e '\nInukaze , Configurador de : '"$ADC2"'\n' ; \
echo -e "Si existe el archivo $ADC2\nSe creara la copia : $ADC2.$FECHA.$HORA\n" ; \
if test -f "$ADC2"
	then
		sudo cp "$ADC2" "$ADC2.$FECHA.$HORA"
	else
		echo "No existe $ADC2 , Se creara uno nuevo"
fi ; \
echo '#$OpenBSD: sshd_config,v 1.95 2015/04/27 21:42:48 djm Exp $
#This is the sshd server system-wide configuration file. See
#sshd_config(5) for more information.

#This sshd was compiled with PATH=/usr/bin:/bin:/usr/sbin:/sbin

#The strategy used for options in the default sshd_config shipped with
#OpenSSH is to specify options with their default value where
#possible, but leave them commented. Uncommented options override the
#default value.

#Port 22
#AddressFamily any
#ListenAddress 0.0.0.0
#ListenAddress ::

#The default requires explicit activation of protocol 1
#Protocol 2

#HostKey for protocol version 1
#HostKey /etc/ssh/ssh_host_key
#HostKeys for protocol version 2
#HostKey /etc/ssh/ssh_host_rsa_key
#HostKey /etc/ssh/ssh_host_dsa_key
#HostKey /etc/ssh/ssh_host_ecdsa_key
#HostKey /etc/ssh/ssh_host_ed25519_key

#Lifetime and size of ephemeral version 1 server key
#KeyRegenerationInterval 1h
#ServerKeyBits 1024

#Ciphers and keying
#RekeyLimit default none

#Logging
#obsoletes QuietMode and FascistLogging
#SyslogFacility AUTH
#LogLevel INFO

#Authentication:
#LoginGraceTime 2m
#PermitRootLogin no
#StrictModes yes
#MaxAuthTries 6
#MaxSessions 10

#RSAAuthentication yes
#PubkeyAuthentication yes

# The default is to check both .ssh/authorized_keys and .ssh/authorized_keys2
# but this is overridden so installations will only check .ssh/authorized_keys
AuthorizedKeysFile .ssh/authorized_keys

#AuthorizedPrincipalsFile none

#AuthorizedKeysCommand none
#AuthorizedKeysCommandUser nobody

# For this to work you will also need host keys in /etc/ssh/ssh_known_hosts
#RhostsRSAAuthentication no
# similar for protocol version 2
#HostbasedAuthentication no
# Change to yes if you don'"'"'t trust ~/.ssh/known_hosts for
# RhostsRSAAuthentication and HostbasedAuthentication
#IgnoreUserKnownHosts no
# Don'"'"'t read the user'"'"'s ~/.rhosts and ~/.shosts files
#IgnoreRhosts yes

# To disable tunneled clear text passwords, change to no here!
#PasswordAuthentication yes
#PermitEmptyPasswords no

# Change to no to disable s/key passwords
ChallengeResponseAuthentication no

# Kerberos options
#KerberosAuthentication no
#KerberosOrLocalPasswd yes
#KerberosTicketCleanup yes
#KerberosGetAFSToken no

# GSSAPI options
#GSSAPIAuthentication no
#GSSAPICleanupCredentials yes

# Set this to '"'"'yes'"'"' to enable PAM authentication, account processing,
# and session processing. If this is enabled, PAM authentication will
# be allowed through the ChallengeResponseAuthentication and
# PasswordAuthentication.Depending on your PAM configuration,
# PAM authentication via ChallengeResponseAuthentication may bypass
# the setting of "PermitRootLogin without-password".
# If you just want the PAM account and session checks to run without
# PAM authentication, then enable this but set PasswordAuthentication
# and ChallengeResponseAuthentication to '"'"'no'"'"'.
#UsePAM no

#AllowAgentForwarding yes
#AllowTcpForwarding yes
#GatewayPorts no
#X11Forwarding no
#X11DisplayOffset 10
#X11UseLocalhost yes
#PermitTTY yes
#PrintMotd no # pam does that
#PrintLastLog yes
#TCPKeepAlive yes
#UseLogin no
UsePrivilegeSeparation sandbox             # Default for new installations.
#PermitUserEnvironment no
#Compression delayed
#ClientAliveInterval 0
#ClientAliveCountMax 3
#UseDNS no
#PidFile /run/sshd.pid
#MaxStartups 10:30:100
#PermitTunnel no
#ChrootDirectory none
#VersionAddendum none

# no default banner path
#Banner none

# override default of no subsystems
Subsystem sftp /usr/lib/ssh/sftp-server

#Example of overriding settings on a per-user basis
#Match User anoncvs
#X11Forwarding no
#AllowTcpForwarding no
#PermitTTY no
#ForceCommand cvs server

##############################
#                            #
#  Configuracion de Inukaze  #
#                            #
##############################

#Conexion :
Port 22                                    # Puerto de conexion : 22
Port 7777                                 # Puerto de conexion : 7777
TCPKeepAlive yes                           # Mantener la conexion TCP Activa : Si
AddressFamily any                          # Direcciones Familiares : Cualquiera
#ListenAddress '$ippriv'                    # Escuchar la direccion : '$ippriv'
ListenAddress 0.0.0.0			    # Escuchar todas las direcciones
ClientAliveInterval 60                     # Enviar un paquete a cada 60 segundos para manterner la conexion activa
ClientAliveCountMax 24                     # Desconectar del cliente despues de 24 intentos a cada 60 segundos

#Seguridad
UsePAM yes                                 # Usar P.A.M ( Pluggable Authentication Modules / Módulos de autentificación conectables )
MaxSessions 14                             # Sesiones maximas : 14
MaxAuthTries 7                             # Intentos maximos de Autenticacion : 7
StrictModes no                             # Modo Estricto : no
PermitRootLogin no                         # Permitir el acceso del super usuario : no
RSAAuthentication yes                      # Autenticacion por llave rsa : si
PubkeyAuthentication yes                   # Autenticacion por archivo de llave publica : si
PasswordAuthentication yes                 # Autenticacion por contraseña : si
UsePrivilegeSeparation yes                 # Usar Privilegios de Separacion : si
AllowUsers '$USER'                         # Permitir a los usuarios : '$USER'
#AllowGroups ssh			   # Permitir a todos los usuarios de los grupos : ssh
#AuthorizedKeysFile /etc/ssh/authorized-keys/%u	# Archivos de Autorizacion Permitidos
#LoginGraceTime 1m			   # Permitir Inicio de Sesion durante : 1 Minuto(s)


#Llaves del sistema
HostKey /etc/ssh/ssh_host_key              # Protocolo 1
HostKey /etc/ssh/ssh_host_rsa_key          # Protocolo 2
HostKey /etc/ssh/ssh_host_dsa_key          # Protocolo 2

#Llaves de usuario
HostKey ssh_host_key                       # Protocolo 1
HostKey ssh_host_rsa_key                   # Protocolo 2
HostKey ssh_host_dsa_key                   # Protocolo 2
AuthorizedKeysFile ssh/authorized_keys     # Llaves Autorizadas

# Sopote para abrir aplicaciones graficas desde el Androide :
X11Forwarding         yes                  # Permitir el redireccionamiento grafico
X11DisplayOffset      0                    # Session Grafica ?
PrintMotd             no                   # Monstrar el "Mensaje del Dia"?
PrintLastLog          no                   # Mostrar el ultimo log 
AllowAgentForwarding  yes                  # Permitir el redireccionamiento de Agente
X11UseLocalhost       yes                  # Permitir al redireccionamiento al sistema grafico local'| sudo tee "$ADS2" ; \
sudo chmod 600 /etc/ssh/moduli
sudo chmod 644 /etc/ssh/ssh_config
sudo chmod 644 /etc/ssh/sshd_config
sudo chmod 644 /etc/ssh/ssh_host_dsa_key.pub
sudo chmod 644 /etc/ssh/ssh_host_key.pub
sudo chmod 644 /etc/ssh/ssh_host_rsa_key.pub
sudo chmod 600 /etc/ssh/ssh_host_key
sudo chmod 600 /etc/ssh/ssh_host_dsa_key
sudo chmod 600 /etc/ssh/ssh_host_rsa_key
echo -e 'Indicarle a iptables que permita la ENTRADA y las ACEPTE desde\nEl Protocolo "TCP" a traves del Puerto 22' ; \
sudo iptables -A INPUT -p tcp --dport 22 -j ACCEPT ; \
echo -e 'Indicale a "iptables" que permita la ENTRADA y las ACEPTE desde\nLa Direccion publica de internet "inukaze.redirectme.net"' ; \
sudo iptables -I INPUT -p tcp --dport 22 -m string --algo bm  --string 'GET /inukaze.redirectme.net.' -j ACCEPT
echo ""
echo "Si ufw esta instalado : Permitir la conexion por el puerto 22 desde direcciones publicas" :
sudo ufw allow from any to any port 20,21,22,10000:11000 proto tcp
echo ""
sudo /etc/init.d/ssh stop ; sudo /etc/init.d/ssh start