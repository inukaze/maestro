# https://codecombat.com/play/level/coinucopia?
# Debes equipar : "Banderas básicas" -> Concede Codigo : "findFlag", "pickUpFlag". {green,black,violet}
#
# Presiona Enviar cuando estes preparado para colocar las banderas.
# Los botones de las banderas apareceran en la parte inferior luego de presionar Enviar.
while True:
    flag = hero.findFlag()
    if flag:
        hero.pickUpFlag(flag)
    else:
	hero.say("Coloca una bandera para que vaya.")
