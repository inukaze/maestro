# https://codecombat.com/play/level/return-to-thornbush-farm?
# Debes equipar "Martillo Del Constructor"
#
# La funcion QuizaConstruyaTrampa define DOS parametros!
def QuizaConstruyaTrampa(x, y):
    # Usa x & y como coordenadas para moverte.
    hero.moveXY(x, y)
    Enemigo = hero.findNearestEnemy()
    if Enemigo:
	# Usa buildXY para construir una "Fuego-Trampa" en los ejes x & y recibidos
        hero.buildXY("fire-trap", x, y)
	pass
while True:
    # Esto llama a "QuizaConstruyaTrampa", con las coordenadas de la entrada superior!
    QuizaConstruyaTrampa(43, 50)
    # Ahora usa QuizaConstruyaTrampa, en la entrada izquierda!
    QuizaConstruyaTrampa(25, 34)
    # Ahora usa QuizaConstruyaTrampa, en la entrada inferior!
    QuizaConstruyaTrampa(43, 20)
