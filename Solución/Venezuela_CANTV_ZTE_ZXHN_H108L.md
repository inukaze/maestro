Modem Cantv ZTE ZXHN H108L
Linux configurar Multimodo

Abre una terminal :

`telnet 192.168.1.1` #Conectarse a la IP del Router.

#Contraseña : 
**c@ntv2000** ó **c@ntvwifi2000**

`wan adsl opencmd` #Mostrara la lista de modos disponibles
`wan adsl opencmd multimode` #Seleccionara y activara el modo oculto "multimode"

`exit` #Salir de telnet

#Notas : Verificar en la pestaña "Status" al final de la pagina.

SNR -> Margen de Ruido.

-- Atenuación máxima:
    256 kpbs : 64 dB.
    512 kpbs : 55 dB.
>= 1024 kpbs : 41 dB.
>= 6144 kpbs : 30 dB.

-- Margen Señal-Ruido :
<=     6 dB : Conexión inexistente o con graves deficiencias de estabilidad
    7~10 dB : Es posible que aparezcan problemas dependiendo de otros factores.
   11~20 dB : Valor óptimo
>=    21 dB : Valor excelente
