# https://codecombat.com/play/level/copper-meadows?

# Recoge todas las monedas en cada prado.
# Usa banderas para moverte entre prados.
# Presione Enviar cuando esté listo para colocar banderas

while True:
    flag = hero.findFlag()
    if flag:
	# Toma la bandera.
	hero.pickUpFlag(flag)
    else:
        #Recoger el objeto más cercano que veas.
        Objeto = hero.findNearestItem()
        if Objeto:
            Posicion = Objeto.pos
            x = Posicion.x
            y = Posicion.y
            hero.moveXY(x, y)
