# https://codecombat.com/play/level/coincrumbs?
# Sigue el trazo de monedas hasta la X roja en la salida.
while True:
    # Esto encuentra el objeto cercano.
    Objeto = hero.findNearestItem()
    if Objeto:
	# Esto guarda la posicion del objeto, o la posicion en una variable.
        PosicionObjeto = Objeto.pos
	# Colocar las coordenadas X & Y del objeto dentro de variables.
        ObjetoX = PosicionObjeto.x
        ObjetoY = PosicionObjeto.y
	# Ahora, usa "moveXY" para moverte al ObjetoX & ObjetoY
        hero.moveXY(Objeto.pos.x, Objeto.pos.y)
