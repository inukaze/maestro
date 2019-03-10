# https://codecombat.com/play/level/drop-the-flag?
# Pon banderas donde quieras construir trampas.
# ¡Cuando no estés construyendo trampas, recoge monedas!
while True:
    Bandera = hero.findFlag()
    if Bandera:
        # ¿Cómo obtenemos BanderaX y BanderaY desde la posición de la bandera?
	# (Observa abajo cómo obtener X e Y de los objetos).
        PosicionBandera = Bandera.pos
	BanderaX = PosicionBandera.x
	BanderaY = PosicionBandera.y
        hero.buildXY("fire-trap", BanderaX, BanderaY)
        hero.pickUpFlag(Bandera)
    else:
        Objeto = hero.findNearestItem()
        if Objeto:
            PosicionObjeto = Objeto.pos
            ObjetoX = PosicionObjeto.x
            ObjetoY = PosicionObjeto.y
            hero.moveXY(ObjetoX, ObjetoY)
